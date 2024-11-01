// StatsPage.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatsPage extends StatelessWidget {
  final QueryDocumentSnapshot user;

  StatsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    const poppinsTextStyle = TextStyle(fontFamily: 'Poppins', color: Color(0xFF333C75));

    return Container(
      color: Color(0xFFECF1FF),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: _buildStatSquare(
                    iconPath: 'lib/img/shield.svg',
                    statValue: user['ligue_rank'].toString(),
                    label: 'Classement Ligue',
                    textStyle: poppinsTextStyle.copyWith(fontSize: 20),
                    keepOriginalColor: true,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildStatSquare(
                  iconPath: 'lib/img/crown.svg',
                  statValue: user['hof_rank'].toString(),
                  label: 'Classement Hall of Fame',
                  textStyle: poppinsTextStyle.copyWith(fontSize: 20),
                  keepOriginalColor: true,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: _buildStatSquare(
                    iconPath: 'lib/img/field_primary.svg',
                    statValue: user['won_games'].toString(),
                    label: 'Nombre de partie gagnées',
                    textStyle: poppinsTextStyle.copyWith(fontSize: 20),
                    keepOriginalColor: true,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user['total_generated'].toString(),
                      style: poppinsTextStyle.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 2),
                    SvgPicture.asset(
                      'lib/img/coins.svg',
                      height: 28,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'Nombre total de Genius Coins générée',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 12,
                    color: Color(0xFF333C75),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: _buildStatSquare(
                    statValue: '${user['validated_odds_rate']}%',
                    label: 'Taux de cotes validés',
                    textStyle: poppinsTextStyle.copyWith(fontSize: 22),
                    isPercentage: true,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildStatSquare(
                  statValue: '${user['won_game_rate']}%',
                  label: 'Taux de parties gagnantes',
                  textStyle: poppinsTextStyle.copyWith(fontSize: 22),
                  isPercentage: true,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: _buildStatSquare(
                    statValue: '${user['successful_rapid_bet_rate']}%',
                    label: 'Taux de pronos rapides réussis',
                    textStyle: poppinsTextStyle.copyWith(fontSize: 22), 
                    isPercentage: true,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 130, vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 5, 
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Voir toutes les stats',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF7584FF), width: 2),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Color(0xFF7584FF),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatSquare({
    String? iconPath,
    required String statValue,
    required String label,
    required TextStyle textStyle,
    bool isPercentage = false,
    bool keepOriginalColor = false,
  }) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5, 
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath != null)
            SvgPicture.asset(
              iconPath,
              height: 28,
              color: keepOriginalColor ? null : Colors.grey[700],
            ),
          SizedBox(height: 4),
          Text(
            statValue,
            style: textStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: textStyle.copyWith(
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
