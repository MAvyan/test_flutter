import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ProfilPage.dart';
import 'StatsPage.dart';
import 'GeniusPass.dart';

class UserDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFECF1FF),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfilPage(user: user), 
              GeniusPass(user: user),
              StatsPage(user: user),
            ],
          ),
        ),
      ),
    );
  }
}