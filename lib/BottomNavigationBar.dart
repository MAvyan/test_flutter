import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2; // Par défaut à "Accueil"

  // Liste des icônes SVG pour la navbar, avec les versions normales et sélectionnées
  final List<Map<String, String>> _svgIcons = [
    {'normal': 'lib/img/podium.svg', 'selected': 'lib/img/podium_primary.svg'},
    {'normal': 'lib/img/trophy.svg', 'selected': 'lib/img/trophy_primary.svg'},
    {'normal': 'lib/img/stadium.svg', 'selected': 'lib/img/stadium_primary.svg'},
    {'normal': 'lib/img/field.svg', 'selected': 'lib/img/field_primary.svg'},
    {'normal': 'lib/img/ticket.svg', 'selected': 'lib/img/ticket_primary.svg'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF7584FF), // Couleur bleu-violet
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _selectedIndex == 0 ? _svgIcons[0]['selected']! : _svgIcons[0]['normal']!,
            height: 24,
          ),
          label: 'Classement',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _selectedIndex == 1 ? _svgIcons[1]['selected']! : _svgIcons[1]['normal']!,
            height: 24,
          ),
          label: 'Tournois',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _selectedIndex == 2 ? _svgIcons[2]['selected']! : _svgIcons[2]['normal']!,
            height: 24,
          ),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _selectedIndex == 3 ? _svgIcons[3]['selected']! : _svgIcons[3]['normal']!,
            height: 24,
          ),
          label: 'Match',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _selectedIndex == 4 ? _svgIcons[4]['selected']! : _svgIcons[4]['normal']!,
            height: 24,
          ),
          label: 'Mes Pronos',
        ),
      ],
    );
  }
}
