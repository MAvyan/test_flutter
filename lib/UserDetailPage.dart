import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Retour Button
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

            // User Information
            Text(
              'Pseudo: ${user['pseudo']}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Balance: ${user['balance']}'),
            Text('Global Rank: ${user['global_rank']}'),
            Text('HoF Rank: ${user['hof_rank']}'),
            Text('Level: ${user['level']}'),
            Text('Ligue Rank: ${user['ligue_rank']}'),
            Text('Points Genius Pass: ${user['points_genius_pass']}'),
            Text('Rank Genius Pass: ${user['rank_genius_pass']}'),
            Text('Rank Squad: ${user['rank_squad']}'),
            Text('Total Generated: ${user['total_generated']}'),
            Text('Validated Odds Rate: ${user['validated_odds_rate']}'),
            Text('Won Game Rate: ${user['won_game_rate']}'),
            Text('Won Games: ${user['won_games']}'),
          ],
        ),
      ),
    );
  }
}
