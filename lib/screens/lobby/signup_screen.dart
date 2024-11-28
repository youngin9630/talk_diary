import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:talk_diary/screens/main_screen.dart';
import 'package:talk_diary/components/backgrounds/gradient_background.dart';
import 'package:talk_diary/components/buttons/gradient_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: GradientBackground(
          child: SafeArea(
            top: true,
            bottom: false,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    _emailFormField(),
                    SizedBox(height: 16),
                    _nicknameFormField(),
                    SizedBox(height: 16),
                    _passwordFormField(),
                    SizedBox(height: 16),
                    _confirmPasswordFormField(),
                    SizedBox(height: 16),
                    _phoneFormField(),
                    SizedBox(height: 16),
                    _buttonField(),
                    SizedBox(height: 24),
                    Text(apiResponse),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _emailFormField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: "이메일",
        hintStyle: TextStyle(color: Color(0xff999999)),
        labelStyle: TextStyle(color: Color(0xff999999)),
        floatingLabelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff999999)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  _nicknameFormField() {
    return TextFormField(
      controller: _nicknameController,
      decoration: InputDecoration(
        labelText: "닉네임",
        labelStyle: TextStyle(color: Color(0xff999999)),
        floatingLabelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Color(0xff999999)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff999999)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  _passwordFormField() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: "비밀번호",
        labelStyle: TextStyle(color: Color(0xff999999)),
        floatingLabelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Color(0xff999999)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff999999)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      obscureText: true, // 비밀번호 숨기기
    );
  }

  _confirmPasswordFormField() {
    return TextFormField(
      controller: _confirmPasswordController,
      decoration: InputDecoration(
        labelText: "비밀번호 확인",
        labelStyle: TextStyle(color: Color(0xff999999)),
        floatingLabelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Color(0xff999999)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff999999)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      obscureText: true, // 비밀번호 숨기기
    );
  }

  _phoneFormField() {
    return TextFormField(
      controller: _phoneController,
      decoration: InputDecoration(
        labelText: "전화번호",
        labelStyle: TextStyle(color: Color(0xff999999)),
        floatingLabelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Color(0xff999999)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff999999)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      keyboardType: TextInputType.phone,
    );
  }

  _buttonField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: GradientButton(
            onPressed: () {
              if (_nicknameController.text.isEmpty ||
                  _emailController.text.isEmpty ||
                  _passwordController.text.isEmpty ||
                  _confirmPasswordController.text.isEmpty ||
                  _phoneController.text.isEmpty) {
                setState(() {
                  apiResponse = "모든 필드를 입력하세요.";
                });
              } else if (_passwordController.text !=
                  _confirmPasswordController.text) {
                setState(() {
                  apiResponse = "비밀번호가 일치하지 않습니다.";
                });
              } else {
                signupUser(); // 회원가입 메서드 호출
              }
            },
            text: '가입완료',
            gradientColors: [Color(0xffEDE5C8), Color(0xffF86B61)],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Color(0xffF86B61), width: 2),
              ),
            ),
            child: Text(
              '취소',
              style: TextStyle(
                color: Color(0xffF86B61),
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  final _nicknameController = TextEditingController(); // 닉네임 입력 컨트롤러
  final _emailController = TextEditingController(); // 이메일 입력 컨트롤러
  final _passwordController = TextEditingController(); // 비밀번호 입력 컨트롤러
  final _confirmPasswordController = TextEditingController(); // 비밀번호 확인 입력 컨트롤러
  final _phoneController = TextEditingController(); // 전화번호 입력 컨트롤러
  String apiResponse = "";

  Future<void> signupUser() async {
    final userUid = const Uuid().v4();
    final nickname = _nicknameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final phone = _phoneController.text;

    try {
      final response = await http.post(
        Uri.parse('http://13.125.128.111:8080/api/users/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'uid': userUid,
          'nickname': nickname,
          'email': email,
          'password': password,
          'phonenumber': phone,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          apiResponse = "회원가입 성공!";
        });

        if (!mounted) return; // mounted 체크 추가
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );

        // 성공 메시지를 스낵바로 표시 (선택사항)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('회원가입이 완료되었습니다!')),
        );
      } else {
        final errorData = jsonDecode(response.body);
        setState(() {
          apiResponse = "회원가입 실패: ${errorData['message'] ?? response.body}";
        });
      }
    } catch (e) {
      setState(() {
        apiResponse = "오류: $e";
      });
    }
  }
}
