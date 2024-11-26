import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String apiResponse = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchApiData();
  }

  Future<void> fetchApiData() async {
    try {
      final response =
          await http.get(Uri.parse('http://13.125.128.111:8080/api/test'));
      if (response.statusCode == 200) {
        setState(() {
          apiResponse = response.body; // JSON 데이터에서 필요한 부분 추출
        });
      } else {
        setState(() {
          apiResponse = "Failed to load data";
        });
      }
    } catch (e) {
      setState(() {
        apiResponse = "Error: $e";
      });
    }
  }

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
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "이름",
                          hintStyle: TextStyle(
                            color: Color(0xff999999),
                          ),
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
                        decoration: InputDecoration(
                          hintText: "이름",
                          hintStyle: TextStyle(
                            color: Color(0xff999999),
                          ),
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
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text('가입완료'),
                          ),
                          TextButton(
                            onPressed: () {},
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
