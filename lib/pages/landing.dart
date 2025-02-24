import 'package:flutter/material.dart';
import 'package:tugas1/pages/menu_page.dart';
import './show_data.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _buttomNavCurrentIndex = 0;
  final List<Widget> _container = [ShowData(), MenuPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(child: _container[_buttomNavCurrentIndex]),
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _buttomNavCurrentIndex = index;
          });
        },
        currentIndex: _buttomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.assignment,
              color: Colors.red,
            ),
            icon: Icon(
              Icons.assignment,
              color: Colors.grey,
            ),
            label: 'Show Data',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.menu,
              color: Colors.red,
            ),
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            label: 'Menu',
          ),
        ],
      ),
    ]));
  }
}
