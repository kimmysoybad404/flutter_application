import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application/SmartHomeNaja/Page/Homepage.dart';
import 'package:flutter_application/SmartHomeNaja/Page/RoomPage.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage.dart';
import 'package:flutter_application/SmartHomeNaja/Page/StatisticPage.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
    Statisticpage(),
    Roompage(),
    Settingpage(),
  ];

  final List<Color> _backgroundColors = [
    const Color.fromARGB(137, 224, 224, 224),
    const Color.fromARGB(137, 224, 224, 224),
    const Color.fromARGB(137, 224, 224, 224),
    const Color.fromARGB(137, 224, 224, 224),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: _backgroundColors[_pageIndex],
        index: _pageIndex,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.bar_chart, size: 30),
          Icon(Icons.dashboard, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      body: Container(
        color: _backgroundColors[_pageIndex],
        child: _pages[_pageIndex],
      ),
    );
  }
}
