import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TopNavigationBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  final String connectedUser = "wSibajYUNWp62yLeMXaO";
  int? balance;
  int? globalRank;
  String? rankSquad;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance.collection('users').doc(connectedUser).get();
      if (docSnapshot.exists) {
        setState(() {
          balance = docSnapshot['balance'];
          globalRank = docSnapshot['global_rank'];
          rankSquad = docSnapshot['rank_squad'];
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  String _formatBalance(int balance) {
    final formatter = NumberFormat('#,###', 'en_US');
    return formatter.format(balance).replaceAll(',', ' ');
  }

  @override
  Widget build(BuildContext context) {
    const poppinsTextStyle = TextStyle(fontFamily: 'Poppins');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFC107),
                    ),
                    width: 45,
                    height: 45,
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: CircularProgressIndicator(
                      value: 0.7,
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF108236)),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      'lib/img/person.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'lib/img/coins.svg',
                        height: 22,
                      ),
                      SizedBox(width: 4),
                      Text(
                        balance != null ? _formatBalance(balance!) : '0',
                        style: poppinsTextStyle.copyWith(
                          color: Color(0xFF333C75),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        rankSquad ?? '-',
                        style: poppinsTextStyle.copyWith(
                          color: Color(0xFF333C75),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        globalRank != null ? '#$globalRank' : '#0',
                        style: poppinsTextStyle.copyWith(
                          color: Color(0xFF333C75),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFE3BA), Color(0xFFFFC107)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'lib/img/shop.svg',
                      height: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Boutique',
                      style: poppinsTextStyle.copyWith(
                        color: Color(0xFF364F6B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
