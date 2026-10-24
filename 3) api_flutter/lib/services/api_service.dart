import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';

class ApiService{
   static const String baseUrl = 'https://jsonplaceholder.typicode.com';

   Future<List<Post>> getPosts() async {
         final Uri url = Uri.parse('$baseUrl/posts');

         final response = await http.get(
            url,
            headers:{
              'Accept': 'application/json',
            },
         );

         if (response.statusCode == 200){
            final List<dynamic> jsonData = jsonDecode(response.body);

            return jsonData.map(
              (item) => Post.fromJson(
                item as Map<String, dynamic>,
              ),
            ).toList();
         }
         throw Exception(
          'Data could not be obtained'
          'Code HTTP: ${response.statusCode}',
         );
   }
}