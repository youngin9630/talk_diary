import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 문자열 경로를 사용하여 이동
            Navigator.pushNamed(context, '/home');
          },
          child: Text('Go to Home Screen'),
        ),
      ),
    );
  }
}
