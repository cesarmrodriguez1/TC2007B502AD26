import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/products_screen.dart';
import 'screens/profile_screen.dart';

void main(){
   runApp(const FlutterBottomNavigationApp());
}

class FlutterBottomNavigationApp extends StatelessWidget{
 const FlutterBottomNavigationApp({super.key});

@override
Widget build(BuildContext context){
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Tab Navigation',

      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(
           seedColor: Colors.blue,
         ),
         useMaterial3: true,

      ),

      home: const MainNavigation(),

   );
  }
}

class MainNavigation extends StatefulWidget{
   const MainNavigation({super.key});

   @override
   State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation>{
  int _currentIndex = 0;

  final List<Widget> _screens = const[
    HomeScreen(),
    ProductsScreen(),
    ProfileScreen(),
  ];
  
  void _changeTab(int index){
    setState((){
       _currentIndex = index;

    });

  }

@override
Widget build(BuildContext context){
   return Scaffold(
     body: _screens[_currentIndex],

     bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _changeTab,
        destinations: const [NavigationDestination(
             icon: Icon(Icons.home_outlined),
             selectedIcon: Icon(Icons.home),
             label: 'Inicio',

        ),
        NavigationDestination(
             icon: Icon(Icons.shopping_cart_outlined),
             selectedIcon: Icon(Icons.shopping_cart),
             label: 'Products',

        ),
        NavigationDestination(
             icon: Icon(Icons.person_outline),
             selectedIcon: Icon(Icons.person),
             label: 'Profile',

        ),
        
        ]
     ),

   );
  }
}