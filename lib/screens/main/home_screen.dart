import 'package:flutter/material.dart';
import 'package:talk_diary/components/backgrounds/main_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: MainBackground(
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffECEDD5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '안녕하세요, kubony',
                          style: TextStyle(
                            color: Color(0xff004351),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isArrowDown
                                ? Icons.keyboard_arrow_down_rounded
                                : Icons.keyboard_arrow_up_rounded,
                            size: 30,
                          ),
                          onPressed: _toggleArrow, // 아이콘 클릭 시 함수 호출
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  transform: Matrix4.translationValues(0, _offset, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffc8c8c8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: 80,
                            height: 4,
                          ),
                        ),
                        SizedBox(height: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 78),
                            child: SingleChildScrollView(
                              // 나중에 futurebuilder 또는 listview.builder로 바꿀 것
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.redAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.blueAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.redAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.blueAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.redAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.blueAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.redAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.blueAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.redAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.blueAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.redAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    color: Colors.blueAccent,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isArrowDown = true; // 아이콘 상태를 관리하는 변수
  double _offset = 80; // 초기 offset 값

  void _toggleArrow() {
    setState(() {
      _isArrowDown = !_isArrowDown; // 아이콘 상태 변경
      _offset = _isArrowDown ? 80 : 200; // offset 값 변경
    });
  }
}
