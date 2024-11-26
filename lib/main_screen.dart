import 'package:flutter/material.dart';
import 'package:talk_diary/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
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
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12.0,
          unselectedFontSize: 2.0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade200,
          backgroundColor: Colors.grey.shade200,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_sharp,
                color: Colors.black,
              ),
              label: '프로필',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
