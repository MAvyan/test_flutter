// main.dart
import 'package:flutter/material.dart';
import 'Components/TopNavigationBar.dart';
import 'Components/BottomNavigationBar.dart';
import 'Components/UserList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
        appBar: TopNavigationBar(),
        body: UserList(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
