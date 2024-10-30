// UserList.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserList extends StatelessWidget {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFECF1FF), // Background color for the entire UserList
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Subtitle
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CLASSEMENT',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333C75), // Text color for the title
                  ),
                ),
                Text(
                  'AMIS',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333C75), // Text color for the title
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Compare ton classement avec tes amis et regarde lequel est le meilleur d\'entre vous',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF333C75), // Text color for the subtitle
                  ),
                ),
              ],
            ),
          ),
          
          // User List
          Expanded(
            child: StreamBuilder(
              stream: users.snapshots(), // Listen to Firestore updates
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()); // Loading indicator
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}')); // Error message
                }

                final data = snapshot.requireData.docs;
                data.sort((a, b) => (a['global_rank'] as int).compareTo(b['global_rank'] as int)); // Sort by global rank

                return ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8.0), // Add padding for better layout
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var user = data[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0), // Spacing between list items
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Subtle shadow
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Rank Number with padding
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0), // Right padding for rank
                            child: Text(
                              '${user['global_rank']}', // Display rank
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7584FF), // Color for the rank text
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0), // Padding around slash
                            child: Text(
                              '/', // Display slash
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7584FF),
                              ),
                            ),
                          ),

                          // Profile Picture and Username
                          Expanded(
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF7584FF), // Profile picture background color
                                      ),
                                      width: 40,
                                      height: 40,
                                    ),
                                    ClipOval(
                                      child: Image.asset(
                                        'lib/img/person.png',
                                        width: 36,
                                        height: 36,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Text(
                                  user['pseudo'], // Display username
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Balance and Coin Icon
                          Row(
                            children: [
                              Text(
                                '${user['balance']}', // Display balance
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: 4),
                              SvgPicture.asset(
                                'lib/img/coins.svg',
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
