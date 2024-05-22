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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/1.jpg', // Ganti dengan path gambar banner yang Anda miliki
                width: 350,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Text(
                'Selamat Datang di Aplikasi Pemesanan Makanan Indonesia!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 118, 0, 71),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Temukan berbagai macam Makanan Indonesia, serta nikmati layanan pengiriman yang cepat dan terpercaya.',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk Makanan'),
      ),
      body: ListView(
        children: [
          ProductCard(
            productName: 'Nasi Goreng',
            productImage: 'images/3.jpg',
            productPrice: 'Rp 25.000',
          ),
          ProductCard(
            productName: 'Ayam Goreng',
            productImage: 'images/4.jpg',
            productPrice: 'Rp 30.000',
          ),
          ProductCard(
            productName: 'Soto',
            productImage: 'images/5.jpg',
            productPrice: 'Rp 25.000',
          ),
          ProductCard(
            productName: 'Bakso',
            productImage: 'images/6.jpg',
            productPrice: 'Rp 30.000',
          ),
          // Add more ProductCard widgets as needed
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            productImage,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  productPrice,
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 173, 5, 5),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          productName: productName,
                          productImage: productImage,
                          productPrice: productPrice,
                        ),
                      ),
                    );
                  },
                  child: Text('View Details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;

  const ProductDetail({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              productImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              productName,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 118, 0, 71),
              ),
            ),
            SizedBox(height: 10),
            Text(
              productPrice,
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 173, 5, 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                NetworkImage('images/2.jpg'), // Replace with your image URL
          ),
          SizedBox(height: 10),
          Text(
            'M. Qusyairi Aldi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'mqusyairialdi23@gmail.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
