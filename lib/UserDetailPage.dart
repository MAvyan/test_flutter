import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Upper section with rounded bottom corners and background color
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF333C75),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Retour Button
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Color(0xFF7584FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Retour',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Main content row with left, center, and right columns
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left Column: Trophy and Timer
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/img/premium.png',
                          height: 64,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '02j:12h:30m',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),

                    // Center Column: Profile Picture, Pseudo, Rank, Balance
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 52.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              // Profile Picture Circle
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('lib/img/person.png'),
                                  radius: 38,
                                  backgroundColor: Color(0xFFEE9714),
                                ),
                              ),
                              // Level Circle with Progress Bar
                              Positioned(
                                bottom: -4, // Position it slightly outside bottom-right
                                right: -4,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      value: 0.7, // Set progress here
                                      strokeWidth: 4,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF7584FF),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Niv\n${user['level']}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8),
                          Text(
                            user['pseudo'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                user['rank_squad'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '#${user['global_rank']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                user['balance'].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              SvgPicture.asset(
                                'lib/img/coins.svg',
                                height: 28,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Right Column: Buttons with Icons
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var icon in ['settings.svg', 'trophy.svg', 'sticker.svg', 'share.svg'])
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: GestureDetector(
                              onTap: () {
                                // Add actions for each button as needed
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(0xFF7584FF),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  'lib/img/$icon',
                                  height: 20,
                                  color: Colors.white, // Set the color to white
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Additional content can go here if needed
        ],
      ),
    );
  }
}
