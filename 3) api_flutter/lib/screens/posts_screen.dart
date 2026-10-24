import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';

import '../screens/post_detail_screen.dart';

class PostScreen extends StatefulWidget{
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
  
}

class _PostScreenState extends State<PostScreen>{

   final ApiService _apiService = ApiService();

   List<Post> _posts = [];

   bool _isLoading = true;

   String? _errorMessage;

   @override
   void initState(){
    super.initState();
    _loadPosts();
   }

   Future<void> _loadPosts() async{
      setState((){
         _isLoading = true;
         _errorMessage = null;
      });

      try{
          final posts = await _apiService.getPosts();

          if(!mounted){
             return;
          }

          setState((){
            _posts = posts;
            _isLoading = false;
          });
      } catch(e){
            if(!mounted){
              return;
            }

          setState((){
             _isLoading = false;
             _errorMessage = e.toString();
          });
            
          }
        
   }

 Future <void> _refreshPosts() async{
     await _loadPosts();
 }  

@override
Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
        title: Text('Posts from API JSON'),
        centerTitle: true,
        actions:[
            IconButton(
               onPressed: _isLoading ? null : _loadPosts,
               icon: const Icon(Icons.refresh),
               tooltip: 'Update'
            ),
        ],

     ),
     body: _buildBody(),

      );
  }
Widget _buildBody(){
   if(_isLoading){
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading information. . .',
                style: TextStyle(
                  fontSize: 16,
                  ),
              ),
          ],
        ),
      );
   }
   if(_errorMessage != null){
      return Center(
          child: Padding(
               padding: const EdgeInsets.all(24),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const Icon(Icons.error_outline,
                    size: 64,
                    ),
                    const SizedBox(height: 16),
                    const Text('Unable to load API data',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                          ),
                      ),
                    const SizedBox(height: 12),
                    Text(_errorMessage!,
                    textAlign: TextAlign.center,
                    ),
                    const SizedBox (height: 24),
                    ElevatedButton.icon(
                      onPressed: _loadPosts,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reload API'),
                    ),
                ],
               ),
            ),

      );
   }
  if(_posts.isEmpty){
      return const Center(
        child: Text('API didnt return data',
        style: TextStyle(
          fontSize: 18,
            ),
        ),
      );
  }

return RefreshIndicator(
   onRefresh: _refreshPosts,
   child: ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: _posts.length,
      itemBuilder: (context, index){
        final post = _posts[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 3,
          child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                child: Text(
                  post.id.toString(),
                ),
              ),
          title: Text (
             post.title,
             style: TextStyle(
          fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'User: ${post.userId}\n'
                  'Post ID ${post.id}, '
                ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onTap: () {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(
                          post: post,
                          ),
                      ),
                 );
            },
          ),
         );
      },
   ),
  );
 } 
}
