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
          child: ElevatedButton(
            onPressed: () {
              // Action when the button is tapped
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFE3BA), // Updated to backgroundColor
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'lib/img/shop.svg', // Replace with the correct path
                  height: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Boutique',
                  style: TextStyle(
                    color: Colors.black,
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
