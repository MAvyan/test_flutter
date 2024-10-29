import 'package:flutter/material.dart';
import 'TopNavigationBar.dart';  // Import the TopNavigationBar file
import 'BottomNavigationBar.dart';

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
        appBar: TopNavigationBar(), // Add TopNavigationBar here
        body: Center(child: Text('Home Page')),
        bottomNavigationBar: BottomNavBar(), // Bottom nav
      ),
    );
  }
}
