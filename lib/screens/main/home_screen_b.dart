import 'package:flutter/material.dart';

class HomeScreenB extends StatefulWidget {
  const HomeScreenB({super.key});

  @override
  State<HomeScreenB> createState() => _HomeScreenBState();
}

class _HomeScreenBState extends State<HomeScreenB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8BE2DA),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          top: true,
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Color(0xff8BE2DA),
                expandedHeight: 220,
                floating: true,
                pinned: false,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.blurBackground,
                  ],
                  background: Container(
                    color: Color(0xff8BE2DA),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 20, right: 20, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffECEDD5),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 24),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '안녕하세요, kubony',
                                      style: TextStyle(
                                        color: Color(0xff004351),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 30, top: 16),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: ClipOval(
                                      child: Container(
                                        color: Colors.pink,
                                        height: 50,
                                        width: 50,
                                        child: Icon(
                                          Icons.person_outline_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: '오늘 하루는 어땠나요?',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 30,
                              width: 300,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  '글쓰기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 300,
                          width: double.infinity,
                          child: Center(child: Text('어쩌고 저쩌고 내용')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 300,
                          width: double.infinity,
                          child: Center(child: Text('어쩌고 저쩌고 내용')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 300,
                          width: double.infinity,
                          child: Center(child: Text('어쩌고 저쩌고 내용')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 300,
                          width: double.infinity,
                          child: Center(child: Text('어쩌고 저쩌고 내용')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 300,
                          width: double.infinity,
                          child: Center(child: Text('어쩌고 저쩌고 내용')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 300,
                          width: double.infinity,
                          child: Center(child: Text('어쩌고 저쩌고 내용')),
                        ),
                      ),
                    ],
                  ),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
