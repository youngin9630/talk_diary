import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:talk_diary/screens/main_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
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
                      SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "이메일",
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
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "비밀번호",
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
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "비밀번호확인",
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
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()),
                              );
                            },
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
}
