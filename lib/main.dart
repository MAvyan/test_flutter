// main.dart
import 'package:flutter/material.dart';
import 'TopNavigationBar.dart'; // Import the TopNavigationBar file
import 'BottomNavigationBar.dart';
import 'UserList.dart';          // Import the UserList widget
import 'package:firebase_core/firebase_core.dart';  // Import Firebase Core
import 'firebase_options.dart';  // Import the generated Firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure Flutter binding
  await Firebase.initializeApp(               // Initialize Firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());                            // Run your app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cas pratique',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: TopNavigationBar(), // Add TopNavigationBar here
        body: UserList(),            // Use UserList widget to display data
        bottomNavigationBar: BottomNavBar(), // Bottom nav
      ),
    );
  }
}
