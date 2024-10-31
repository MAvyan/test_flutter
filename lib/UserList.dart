import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'UserDetailPage.dart';

class UserList extends StatelessWidget {
  final String connectedUser = "wSibajYUNWp62yLeMXaO";
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    const poppinsTextStyle = TextStyle(fontFamily: 'Poppins');

    String _formatBalance(int balance) {
      final formatter = NumberFormat('#,###', 'en_US');
      return formatter.format(balance).replaceAll(',', ' ');
    }

    return Scaffold(
      body: Container(
        color: Color(0xFFECF1FF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Combining CLASSEMENT and AMIS into a single Column
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CLASSEMENT',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333C75),
                            ),
                          ),
                          SizedBox(height: 2), // Reduced space between CLASSEMENT and AMIS
                          Text(
                            'AMIS',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333C75),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Compare ton classement avec tes amis et regarde lequel est le meilleur d\'entre vous',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      color: Color(0xFF333C75),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: users.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final data = snapshot.requireData.docs;
                  data.sort((a, b) => (a['global_rank'] as int).compareTo(b['global_rank'] as int));

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var user = data[index];
                      final friendRank = index + 1;
                      final isConnectedUser = user.id == connectedUser;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetailPage(user: user),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: isConnectedUser ? Color(0xFF7584FF) : Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: isConnectedUser ? Border.all(color: Colors.white, width: 2) : null,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '$friendRank',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isConnectedUser ? Colors.white : Color(0xFF7584FF),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  '/',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 28,
                                    fontWeight: FontWeight.normal,
                                    color: isConnectedUser ? Colors.white : Color(0xFF7584FF),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: isConnectedUser ? Border.all(color: Colors.white, width: 2) : null,
                                            color: Color(0xFF7584FF),
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
                                      user['pseudo'],
                                      style: poppinsTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: isConnectedUser ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    _formatBalance(user['balance']),
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isConnectedUser ? Colors.white : Colors.black87,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  SvgPicture.asset(
                                    'lib/img/coins.svg',
                                    height: 20,
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
