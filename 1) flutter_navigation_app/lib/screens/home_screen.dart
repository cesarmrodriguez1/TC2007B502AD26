import 'package:flutter/material.dart';

import '../widgets/navigation_buttons.dart';

class HomeScreen extends StatelessWidget{

const HomeScreen({super.key});

@override
Widget build(BuildContext context){
  return Scaffold(
     appBar: AppBar(
       title: const Text('Home'),
       centerTitle: true,
       backgroundColor: Colors.blue.shade700,
       foregroundColor: Colors.white,
     ),
     
     backgroundColor: Colors.blue.shade50,
     body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Icon(Icons.home,
                    size: 110,
                    color:Colors.blue.shade700,
                    ),
                    const SizedBox(height: 24),

                    const Text('Home page of the app',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),
                    
                    ),
                   const SizedBox(height: 12),
                   const Text('This is the main screen of the app',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87
                    ),
                    
                    ),
                    const SizedBox(height: 45),

                    const NavigationButtons(
                      currentRoute: '/'
                    ),
                 ],

            ),
          ),

     ),
  );
}
}