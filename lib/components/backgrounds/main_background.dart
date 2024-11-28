import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  final Widget child;
  const MainBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff8BE2DA),
      ),
      width: double.infinity,
      height: double.infinity,
      child: child,
    );
  }
}
