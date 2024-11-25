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
              const Color(0xffeeedd5),
              const Color(0xff6adedb),
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
              Column(
                children: [
                  Image.asset(
                    "assets/images/talk_diary_writing_logo.png",
                    fit: BoxFit.fitHeight,
                    // width: 300,
                    // height: 300,
                  ),
                  Image.asset(
                    "assets/images/talk_diary_image_logo.png",
                    width: 100,
                    height: 100,
                  ),
                ],
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
                      Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xffF86B61),
                            width: 3,
                          ),
                          boxShadow: [],
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("로그인",
                              style: TextStyle(
                                color: const Color(0xffF86B61),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xfffd420b),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xffEDE5C8),
                              const Color(0xffF86B61),
                            ],
                            begin: Alignment.topCenter,
                            stops: [0.0, 0.5],
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("회원가입",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By pressing “Sign Up” you agree to our ',
                          style: TextStyle(
                            color: Color(0xff00444C),
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy\n',
                          style: TextStyle(
                            color: Color(0xffff440d),
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'and ',
                          style: TextStyle(
                            color: Color(0xff00444C),
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms and Service',
                          style: TextStyle(
                            color: Color(0xffff440d),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center, // 텍스트 가운데 정렬
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
