import 'package:flutter/material.dart';
import 'BottomNavigationBar.dart';  // Assurez-vous que le chemin est correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: Text('Home Page')),
        bottomNavigationBar: BottomNavBar(), // Ajoute la navbar ici
      ),
    );
  }
}
