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
      centerTitle: true,
      leadingWidth: 150,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0), // Added left padding
        child: Row(
          children: [
            // Profile picture with yellow background and progress bar
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFE3BA),
                  ),
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  width: 45,
                  height: 45,
                  child: CircularProgressIndicator(
                    value: 0.7, // Set progress value
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF108236)),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    'lib/img/person.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(width: 8),
            // Balance and Ranking
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'lib/img/coins.svg',
                      height: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '150', // Replace with dynamic balance
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  '#8', // Replace with dynamic ranking
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
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
              // Add your onTap logic here
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFE3BA), // Starting color
                    Color(0xFFFFC107), // Ending color (more yellow)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
        ),
      ],
    );
  }
}
