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
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Membuat objek dari class TabController
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coba Tab Navigation',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 7.0,
        // Membuat objek dari class TabBar
        bottom: TabBar(
          tabs: const <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Home',
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Produck',
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Profile',
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
        backgroundColor:
            const Color.fromARGB(255, 118, 0, 71), // Set app bar color to blue
      ),
      // Membuat objek dari class TabBarView
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Home(),
          Product(),
          Profil(),
        ],
      ),
    );
  }
}

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
      child: Text('Halaman Profile'),
    );
  }
}
