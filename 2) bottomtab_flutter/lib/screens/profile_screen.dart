import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
const ProfileScreen({super.key});

@override
Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
            title: const Text('Products'),
            centerTitle: true,
            backgroundColor: Colors.deepPurple.shade700,
            foregroundColor: Colors.white,

        ),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      
      body: Center(
           child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                        Icon(
                            Icons.home,
                            size: 120,
                            color: Colors.blue.shade700,
                        ),
                        const SizedBox(height: 30),
                        const Text('This is profile page',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                      ),

                      const SizedBox(height: 16),
                        const Text('Profile',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                        ),
                      ),
                    const SizedBox(height: 30),

                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const[
                                BoxShadow(
                                    blurRadius: 8,
                                    offset: Offset(0,4),
                                    color: Colors.black12,

                                ),

                            ],
                        ),
                        child: const Text(
                            'Use the bottom tab bar in the app'
                            'to change different screens',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                            ),
                        ),
                    ),

                    ],


                ),
      ),
      ),
   );
  }
}