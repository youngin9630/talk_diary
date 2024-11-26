import 'package:flutter/material.dart';
import 'package:talk_diary/components/buttons/gradient_button.dart';
import 'package:talk_diary/screens/signup_screen.dart';
import 'package:talk_diary/main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: _gradientBackground(),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          top: true,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: Column(
              children: [
                const Spacer(),
                _talkDiaryWritingLogo(),
                _talkDiaryImageLogo(),
                const Spacer(),
                _buttonField(),
                _noticeText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _gradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [const Color(0xffeeedd5), const Color(0xff6adedb)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  _talkDiaryWritingLogo() {
    return Image.asset(
      "assets/images/talk_diary_writing_logo@3x.png",
      fit: BoxFit.fitHeight,
      width: 300,
      height: 300,
    );
  }

  _talkDiaryImageLogo() {
    return Image.asset(
      "assets/images/talk_diary_image_logo@3x.png",
      width: 100,
      height: 100,
    );
  }

  _buttonField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Color(0xffF86B61), width: 2),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                child: Text(
                  "로그인",
                  style: TextStyle(
                    color: const Color(0xffF86B61),
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                flex: 1,
                child: GradientButton(
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()),
                          )
                        },
                    text: '회원가입',
                    gradientColors: [Color(0xffEDE5C8), Color(0xffF86B61)])),
          ],
        ),
      ),
    );
  }

  _noticeText() {
    return Align(
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
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
