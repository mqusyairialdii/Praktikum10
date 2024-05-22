import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coba Widget - Snackbar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            const Color.fromARGB(255, 118, 0, 71), // Set app bar color to
      ),
      body: Center(
        child: Builder(
          builder: (BuildContext context1) {
            return ElevatedButton(
              child: const Text('Tampilkan Snackbar'),
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text('Pesan ditampilkan dengan cara pertama'),
                );
                ScaffoldMessenger.of(context1).showSnackBar(snackBar);
              },
            );
          },
        ),
      ),
    );
  }
}

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
      home: const Home(),
    );
  }
}
