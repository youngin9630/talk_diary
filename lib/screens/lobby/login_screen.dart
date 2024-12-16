import 'package:flutter/material.dart';
import 'package:talk_diary/screens/main_screen.dart';
import 'package:talk_diary/screens/lobby/signup_screen.dart';
import 'package:talk_diary/components/backgrounds/gradient_background.dart';
import 'package:talk_diary/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthService _authService;
  bool isRememberMe = false;

  @override
  void initState() {
    super.initState();
    _initializeAuthService(); // 비동기 초기화
  }

  Future<void> _initializeAuthService() async {
    _authService = await AuthService.create(); // 비동기 생성자
    setState(() {
      _isLoading = false; // 초기화 완료
    });
  }

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
                    const SizedBox(height: 50),
                    _emailFormField(),
                    const SizedBox(height: 16),
                    _passwordFormField(),
                    _rememberMeCheckbox(),
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
        errorText: _errorMessage,
      ),
    );
  }

  _passwordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
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
    );
  }

  _rememberMeCheckbox() {
    return CheckboxListTile(
      title: const Text('자동 로그인'),
      value: isRememberMe,
      onChanged: (bool? value) {
        setState(() {
          isRememberMe = value ?? false;
        });
      },
    );
  }

  _loginButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Color(0xffEDE5C8), Color(0xffF86B61)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.5],
        ),
      ),
      width: MediaQuery.of(context).size.width / 2.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: _isLoading ? null : login,
        child: _isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: const Text(
                  "로그인",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                    fontSize: 18,
                  ),
                ),
              ),
      ),
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
      final success = await _authService.login(
        _emailController.text,
        _passwordController.text,
        isRememberMe, // 자동 로그인 옵션 전달
      );

      if (success && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        setState(() {
          _errorMessage = '로그인에 실패했습니다.';
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
