import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Step 1: Creating objects for the home, product, and profile pages
  final _pages = [
    const Home(),
    const Product(),
    const Profil(),
  ];

  // Step 2: Declaring the variable _selectedIndex
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coba Button Navigation',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            const Color.fromARGB(255, 118, 0, 71), // Set app bar color to blue
      ),
      // Step 3: Filling the bottomNavigationBar property
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 118, 0, 71),
        // Set selected item color to blue
        unselectedItemColor: const Color.fromARGB(
            255, 118, 0, 71), // Set unselected item color to grey
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      // Step 4: Defining the body based on the objects declared above
      body: _pages.elementAt(_selectedIndex),
    );
  }
}

// Pages called in the TabBarView do not need another Scaffold
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman Home'),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman Product'),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman Profil'),
    );
  }
}
