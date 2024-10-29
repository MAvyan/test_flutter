import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Circular yellow background
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFE3BA), // Yellow background
              ),
              width: 45,
              height: 45,
            ),
            // Green progress indicator
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                value: 0.7, // Set the progress value here
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF108236)), // Green color
                backgroundColor: Colors.transparent,
              ),
            ),
            // Profile image
            ClipOval(
              child: Image.asset(
                'lib/img/person.png', // Use the path to your PNG file here
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ElevatedButton(
            onPressed: () {
              // Action when the button is tapped
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFE3BA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'lib/img/ticket_primary.svg',
                  height: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Boutique',
                  style: TextStyle(
                    color: Color(0xFF364F6B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
