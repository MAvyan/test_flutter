import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Classement', // Replace with your title text if needed
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFE3BA), // Light yellow on the left
                  Color(0xFFFFD500), // More intense yellow on the right
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              onPressed: () {
                // Action when the button is tapped
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Transparent background
                shadowColor: Colors.transparent, // No shadow
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'lib/img/ticket_primary.svg', // Replace with the correct path
                    height: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Boutique',
                    style: TextStyle(
                      color: Color(0xFF364F6B), // Updated text color to #364F6B
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
