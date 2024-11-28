import 'package:flutter/material.dart';
import 'package:talk_diary/screens/main/home_screen.dart';
// ignore: unused_import
import 'package:talk_diary/screens/main/mydiary_screen.dart';
import 'package:talk_diary/screens/main/writing_screen.dart';
import 'package:talk_diary/screens/main/exploring_screen.dart';
import 'package:talk_diary/screens/main/profile_screen.dart';
import 'package:talk_diary/screens/main/home_screen_b.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: false,
        extendBodyBehindAppBar: false,
        body: Column(
          children: [
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const HomeScreenB(),
    const WritingScreen(),
    const ExploringScreen(),
    const ProfileScreen(),
  ];

  _bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blueAccent[100],
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.my_library_books_outlined,
              color: Colors.white,
            ),
            label: '내 글',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.white,
            ),
            label: '글쓰기',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              color: Colors.white,
            ),
            label: '탐색',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_sharp,
              color: Colors.white,
            ),
            label: '프로필',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }
}
