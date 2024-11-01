// GeniusPass.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GeniusPass extends StatelessWidget {
  final QueryDocumentSnapshot user;

  GeniusPass({required this.user});

  @override
  Widget build(BuildContext context) {
    const poppinsTextStyle = TextStyle(fontFamily: 'Poppins', color: Color(0xFF333C75));
    const whiteTextStyle = TextStyle(fontFamily: 'Poppins', color: Colors.white);

    return Container(
      color: Color(0xFFECF1FF), // Outer background color
      child: Center(
        child: Stack(
          children: [
            // Top half with darker blue, bottom half with lighter blue
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Darker blue with bottom-left more rounded corner
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF1a1750),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                              ),
                            ),
                          ),
                        ),
                        // Darker blue with bottom-right more rounded corner
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF1a1750),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Container(color: Color(0xFFECF1FF))), // Lighter blue on the left
                        Expanded(child: Container(color: Color(0xFFECF1FF))), // Lighter blue on the right
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Main content container with added margin at the bottom
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20), // Adjust the value as needed
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFc2cffd),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: -15,
                        child: Image.asset(
                          'lib/img/title_gamepass.png',
                          height: 45,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Stack(
                          children: [
                            Image.asset(
                              'lib/img/saison_progressbar.png',
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                              left: 45,
                              top: 25,
                              child: Text(
                                user['points_genius_pass'].toString(),
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 220,
                              top: 25,
                              child: Text(
                                user['next_level_score'].toString(),
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
