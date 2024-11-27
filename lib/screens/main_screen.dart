import 'package:flutter/material.dart';
import 'package:talk_diary/screens/home_screen.dart';
import 'package:talk_diary/screens/mydiary_screen.dart';
import 'package:talk_diary/screens/writing_screen.dart';
import 'package:talk_diary/screens/exploring_screen.dart';
import 'package:talk_diary/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MyDiaryScreen(),
    const WritingScreen(),
    const ExploringScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
          child: BottomNavigationBar(
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.black,
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
        ),
      ),
    );
  }
}
