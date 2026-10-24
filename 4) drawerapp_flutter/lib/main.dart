
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/products_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const DrawerNavigationApp());
}

class DrawerNavigationApp extends StatelessWidget {
  const DrawerNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer Navigation',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ProductsScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = const [
    'Inicio',
    'Productos',
    'Perfil',
  ];

  void _selectScreen(int index) {
    setState(() {
      _currentIndex = index;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),

      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flutter_dash,
                        size: 70,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Mi Aplicación Flutter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.blue.shade700,
                ),
                title: const Text(
                  'Inicio',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                selected: _currentIndex == 0,
                selectedTileColor: Colors.blue.shade50,
                onTap: () {
                  _selectScreen(0);
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.green.shade700,
                ),
                title: const Text(
                  'Productos',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                selected: _currentIndex == 1,
                selectedTileColor: Colors.green.shade50,
                onTap: () {
                  _selectScreen(1);
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.deepPurple.shade700,
                ),
                title: const Text(
                  'Perfil',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                selected: _currentIndex == 2,
                selectedTileColor: Colors.deepPurple.shade50,
                onTap: () {
                  _selectScreen(2);
                },
              ),

              const Divider(),

              ListTile(
                leading: const Icon(
                  Icons.info_outline,
                ),
                title: const Text(
                  'Información',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'Mi Aplicación Flutter',
                    applicationVersion: '1.0.0',
                    applicationLegalese:
                        'Ejemplo educativo de navegación Drawer.',
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}

