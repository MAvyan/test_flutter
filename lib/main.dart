// main.dart
import 'package:flutter/material.dart';
import 'TopNavigationBar.dart'; // Import the TopNavigationBar file
import 'BottomNavigationBar.dart';
import 'package:firebase_core/firebase_core.dart';  // Import Firebase Core
import 'package:cloud_firestore/cloud_firestore.dart';  // Import Firestore
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: TopNavigationBar(), // Add TopNavigationBar here
        body: FirestoreData(),       // Display Firestore data here
        bottomNavigationBar: BottomNavBar(), // Bottom nav
      ),
    );
  }
}

class FirestoreData extends StatelessWidget {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: users.snapshots(),  // Listen to Firestore updates
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Loading indicator
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}')); // Error message
        }

        // Display data if available
        final data = snapshot.requireData;

        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (context, index) {
            var user = data.docs[index];
            return ListTile(
              title: Text(user['pseudo']),  // Display 'name' field from Firestore
            );
          },
        );
      },
    );
  }
}
