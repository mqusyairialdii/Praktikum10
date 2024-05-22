import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Step 1: Mendefinisikan initialRoute dan routes
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const Home(),
        '/product': (BuildContext context) => const Product(),
        '/profil': (BuildContext context) => const Profil(),
      },
    );
  }
}

// Step 2: Mendefinisikan Drawer dengan menambahkan widget-widget yang kita butuhkan
Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://unsplash.com/photos/person-wearing-blue-top-smiling-j3lf-Jn6deo',
            ),
          ),
          accountEmail: Text('mqusyairialdi23@gmail.com'),
          accountName: Text(
            'M. Qusyairi Aldi',
            style: TextStyle(fontSize: 24.0),
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 176, 14, 111),
          ),
        ),
        ListTile(
          title: const Text('Home'),
          leading: const Icon(Icons.home),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Product'),
          leading: const Icon(Icons.add_shopping_cart),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/product');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Profile'),
          leading: const Icon(Icons.person),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/profil');
          },
        ),
      ],
    ),
  );
}

// Step 3: Menambahkan Drawer ke setiap Scaffold
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 118, 0, 71),
      ),
      body: const Center(
        child: Text('Halaman Home'),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: const Text(
          'Product',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 118, 0, 71),
      ),
      body: const Center(
        child: Text('Halaman Product'),
      ),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 118, 0, 71),
      ),
      body: const Center(
        child: Text('Halaman Profile'),
      ),
    );
  }
}
