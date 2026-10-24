import 'package:flutter/material.dart';
import '../models/post.dart';

class PostDetailScreen extends StatelessWidget{
  final Post post;

  const PostDetailScreen({
    super.key,
    required this.post,
  });
@override
  Widget build(BuildContext context){
     return Scaffold(
        appBar: AppBar(
          title: Text('Post #${post.id}'),        
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Center(
                    child: CircleAvatar(
                      radius: 42,
                      child: Text(post.id.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ),

              const SizedBox(height: 24),
              const Text(
                'User id',
                style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                   ),
               const SizedBox(height: 6),

               Text(
                post.userId.toString(),
                style: const TextStyle(
                        fontSize: 18,
                      ),
                   ),
              const SizedBox(height: 24),
              const Text(
                'Post Id',
                style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                   ),

              const SizedBox(height: 6),

               Text(
                post.id.toString(),
                style: const TextStyle(
                        fontSize: 18,
                      ),
                   ),

                   const SizedBox(height: 24),
              const Text(
                'Title',
                style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                   ),

              const SizedBox(height: 6),

               Text(
                post.title,
                style: const TextStyle(
                        fontSize: 18,
                      ),
                   ),

                        const SizedBox(height: 24),
              const Text(
                'Body: ',
                style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                   ),

                   const SizedBox(height: 6),

               Text(
                post.body,
                style: const TextStyle(
                        fontSize: 18,
                      ),
                   ),

                   const SizedBox(height: 8),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(),
                      ),
                      child: Text(
                          post.body,
                          style: const TextStyle(
                            fontSize: 17,
                            height: 1.5,
                          ),

                      ),
                  ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Go back to list'),

                ),
              ),
            ],
          )
        )
     );
  }
}