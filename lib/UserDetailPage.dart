// UserDetailPage.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ProfilPage.dart'; // Import the new ProfilPage

class UserDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfilPage(user: user), // Use the ProfilPage widget
    );
  }
}