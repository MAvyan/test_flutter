// UserDetailPage.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ProfilPage.dart'; // Import the new ProfilPage
import 'StatsPage.dart'; // Import the new StatsPage
import 'GeniusPass.dart'; // Import the new GeniusPass

class UserDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFECF1FF), // Set the background color to match UserList and StatsPage
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfilPage(user: user), // Use the ProfilPage widget
              GeniusPass(), // Add the GeniusPass widget
              StatsPage(user: user), // Use the StatsPage widget
            ],
          ),
        ),
      ),
    );
  }
}