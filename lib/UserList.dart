// UserList.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserList extends StatelessWidget {
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
              title: Text(user['pseudo']),                    // Display 'pseudo' field
              subtitle: Text('Balance: ${user['balance']}'),   // Display 'balance' as a string
            );
          },
        );
      },
    );
  }
}
