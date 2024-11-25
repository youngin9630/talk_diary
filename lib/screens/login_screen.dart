import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Observer를 사용하기 위해 필요
import 'package:talk_diary/screens/home_screen.dart';
import 'package:talk_diary/store/auth_store.dart';

final authStore = AuthStore();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    void handleOnPressTest() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          Observer(
            builder: (_) => TextField(
              onChanged: (value) => authStore.setUsernameInput(value),
              decoration: InputDecoration(
                labelText: "Username",
                hintText: authStore.usernameInput, // 입력한 값 표시
              ),
            ),
          ),
          Observer(
            builder: (_) => TextField(
              onChanged: (value) => authStore.setPasswordInput(value),
              decoration: InputDecoration(
                labelText: "Password",
                hintText: authStore.passwordInput, // 입력한 값 표시
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint("Username: ${authStore.usernameInput}");
              debugPrint("Password: ${authStore.passwordInput}");
            },
            child: const Text("Submit"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
