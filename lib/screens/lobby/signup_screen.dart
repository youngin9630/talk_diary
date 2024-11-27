import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nicknameController = TextEditingController(); // 닉네임 입력 컨트롤러
  final _emailController = TextEditingController(); // 이메일 입력 컨트롤러
  final _passwordController = TextEditingController(); // 비밀번호 입력 컨트롤러
  final _confirmPasswordController = TextEditingController(); // 비밀번호 확인 입력 컨트롤러
  final _phoneController = TextEditingController(); // 전화번호 입력 컨트롤러
  String apiResponse = "Loading...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _gradientBackground(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "이메일",
                          hintStyle: TextStyle(color: Color(0xff999999)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xff999999)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _nicknameController,
                        decoration: InputDecoration(
                          hintText: "닉네임",
                          hintStyle: TextStyle(color: Color(0xff999999)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xff999999)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "비밀번호",
                          hintStyle: TextStyle(color: Color(0xff999999)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xff999999)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        obscureText: true, // 비밀번호 숨기기
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "비밀번호 확인",
                          hintStyle: TextStyle(color: Color(0xff999999)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xff999999)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        obscureText: true, // 비밀번호 숨기기
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: "전화번호",
                          hintStyle: TextStyle(color: Color(0xff999999)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xff999999)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          TextButton(
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
                            child: Text('가입완료'),
                          ),
                          TextButton(
                            onPressed: () {
                              // 취소 버튼 동작
                            },
                            child: Text('취소'),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(apiResponse),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

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
        Navigator.pop(context); // 현재 화면을 스택에서 제거하고 이전 화면(welcome_screen)으로 돌아감

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

  _gradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [const Color(0xffeeedd5), const Color(0xff6adedb)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}
