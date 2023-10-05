import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sravnenie/home_screen/home_screen.dart';
import 'package:sravnenie/news_screen/news_screen.dart';
import 'package:sravnenie/settings_screen/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showAllItems = false;
  int index = 0;
  int indexOfArticle = 0;

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> pages = [
    const MyHomePage(),
    const NewsPageScreen(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 124, 154, 4),
        unselectedItemColor: const Color.fromARGB(255, 149, 149, 149),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            label: 'Меню',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings_solid),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
