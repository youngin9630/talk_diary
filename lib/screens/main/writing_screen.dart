import 'package:flutter/material.dart';
import 'package:talk_diary/components/appbar/writing_appbar';

class WritingScreen extends StatefulWidget {
  const WritingScreen({super.key});

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      }, // 이거 키보드 올라왔을 때, 화면 터치하면 키보드 내려가는 코드임.
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: WritingAppBar(
          title: 'Gandalf',
          leadingIcon: Icons.arrow_back,
          onLeadingPressed: () {},
          actionIcon: Icons.more_horiz_rounded,
          onActionPressed: () {},
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 10),
                            ClipOval(
                              child: Container(
                                color: Colors.grey[600],
                                height: 32,
                                width: 32,
                                child: Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(0),
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "상대의 메시지 상대의 메시지 상대의 메시지 상대의 메시지 상대의 메시지 상대의 메시지 상대의 메시지 상대의 메시지 상대의 메시지 상대의 메시지 상대의 메시지 상대의 메시지 ",
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    '10:00 am',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(0),
                            ),
                          ),
                          child: Text(
                            "나의 메시지 나의 메시지 나의 메시지 나의 메시지 나의 메시지 나의 메시지 나의 메시지 나의 메시지 나의 메시지 나의 메시지 나의 메시지 나의 메시지 ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                              '10:00 am',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 64,
              color: const Color(0xffb2b1b1),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0.0,
                        vertical: 8.0,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 0.0,
                          ),
                          filled: true,
                          fillColor: const Color(0xffd9d9d9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 48),
                      backgroundColor: const Color(0xffd9d9d9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      '전송',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
