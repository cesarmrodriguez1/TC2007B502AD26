import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/products_screen.dart';
import 'screens/profile_screen.dart';

void main(){
  runApp(const FlutterNavigationApp());
}

class FlutterNavigationApp extends StatelessWidget{
   const FlutterNavigationApp({super.key});

   @override
   Widget build(BuildContext context){
      return MaterialApp(
         debugShowCheckedModeBanner: false,
        title: 'Navigation in Flutter',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
            ),
            useMaterial3: true
        ),
        initialRoute: '/',
        routes:{
            '/' : (context) => const HomeScreen(),
            '/products' : (context) => const ProductsScreen(),
            '/profile' : (context) => const ProfileScreen(),

        }
      );
   }
}
