import 'package:flutter/material.dart';

import '../widgets/navigation_buttons.dart';

class ProfileScreen extends StatelessWidget{

const ProfileScreen({super.key});

@override
Widget build(BuildContext context){
  return Scaffold(
     appBar: AppBar(
       title: const Text('Profile'),
       centerTitle: true,
       backgroundColor: Colors.deepPurple.shade700,
       foregroundColor: Colors.white,
     ),
     
     backgroundColor: Colors.deepPurple.shade50,
     body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Icon(Icons.person,
                    size: 110,
                    color:Colors.deepPurple.shade700,
                    ),
                    const SizedBox(height: 24),

                    const Text('Profile screen',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple
                    ),
                    
                    ),
                   const SizedBox(height: 12),
                   const Text('This is Profile Screen',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87
                    ),
                    
                    ),
                    const SizedBox(height: 45),

                    const NavigationButtons(
                      currentRoute: '/profile'
                    ),
                 ],

            ),
          ),

     ),
  );
}
}