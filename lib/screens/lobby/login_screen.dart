import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:talk_diary/screens/main_screen.dart';
import 'package:talk_diary/screens/lobby/signup_screen.dart';
import 'package:talk_diary/components/backgrounds/gradient_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: GradientBackground(
          child: SafeArea(
            top: true,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 120),
                    _emailFormField(),
                    const SizedBox(height: 16),
                    _passwordFormField(),
                    const SizedBox(height: 24),
                    _loginButton(),
                    const SizedBox(height: 50),
                    _signupButton(),
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
        border: const OutlineInputBorder(),
        errorText: _errorMessage,
      ),
    );
  }

  _passwordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "비밀번호",
        border: OutlineInputBorder(),
      ),
    );
  }

  _loginButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : login,
      child: _isLoading ? const CircularProgressIndicator() : const Text("로그인"),
    );
  }

  _signupButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("계정이 없으신가요?"),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            );
          },
          child: const Text("회원가입"),
        ),
      ],
    );
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이메일과 비밀번호를 입력해주세요.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('http://13.125.128.111:8080/api/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        }
      } else {
        final error = jsonDecode(response.body);
        setState(() {
          _errorMessage = error['message'] ?? '로그인에 실패했습니다.';
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(_errorMessage ?? '로그인 실패')),
          );
        }
      }
    } catch (e) {
      setState(() {
        _errorMessage = '올바르지 않은 이메일 또는 비밀번호 입니다.';
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage ?? '서버 오류')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}