import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talk_diary/screens/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 비동기적으로 FirebaseOptions 가져오기
  final firebaseOptions = await DefaultFirebaseOptions.currentPlatform;

  // Firebase 초기화
  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}
