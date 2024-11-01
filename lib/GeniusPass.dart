// GeniusPass.dart
import 'package:flutter/material.dart';

class GeniusPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const poppinsTextStyle = TextStyle(fontFamily: 'Poppins');

    return Container(
      color: Color(0xFFECF1FF), // Set the background color to match StatsPage
      child: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFECF1FF), // Same color as the 'Retour' button
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white, width: 2), // White border
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4), // Increased opacity
                spreadRadius: 5, // Increased spread radius
                blurRadius: 10, // Increased blur radius
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            'Genius Pass',
            style: poppinsTextStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}