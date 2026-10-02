import 'package:flutter/material.dart';

import '../widgets/navigation_buttons.dart';

class ProductsScreen extends StatelessWidget{

const ProductsScreen({super.key});

@override
Widget build(BuildContext context){
  return Scaffold(
     appBar: AppBar(
       title: const Text('Products'),
       centerTitle: true,
       backgroundColor: Colors.green.shade700,
       foregroundColor: Colors.white,
     ),
     
     backgroundColor: Colors.green.shade50,
     body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Icon(Icons.shopping_cart,
                    size: 110,
                    color:Colors.green.shade700,
                    ),
                    const SizedBox(height: 24),

                    const Text('Products screen',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),
                    
                    ),
                   const SizedBox(height: 12),
                   const Text('This is Products Screen',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87
                    ),
                    
                    ),
                    const SizedBox(height: 45),

                    const NavigationButtons(
                      currentRoute: '/products'
                    ),
                 ],

            ),
          ),

     ),
  );
}
}