import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange[100]!,
              Colors.tealAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          top: true,
          bottom: true,
          child: Column(
            children: [
              const Spacer(),
              Center(
                child: Image.asset(
                  "assets/images/talk_diary_logo_1.png",
                  width: 150,
                  height: 150,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("로그인",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("회원가입",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
