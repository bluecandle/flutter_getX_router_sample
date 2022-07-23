import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/pages/normal/first.dart';
import 'package:sample_route_manage/src/pages/reactive_state_manage_page.dart';
import 'package:sample_route_manage/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('라우트 관리 홈')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('일반적인 라우트'),
              onPressed: () {
                // 이게 네비게이터를 통한 이동
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) => FirstPage()));

                // 이게 GetX 를 통한 이동
                // 그리고 이거 사용하면, GOING TO ROUTE /FirstPage 이런식으로 로그도 찍어줌!
                Get.to(FirstPage());
              },
            ),
            RaisedButton(
              child: Text('Named 라우트'),
              onPressed: () {
                // 네비게이터를 통한 Named route
                // Navigator.of(context).pushNamed('/first');

                // 이게 GetX 를 통한 Named route
                Get.toNamed('/first');
              },
            ),
            RaisedButton(
              child: Text('Arguments 전달'),
              onPressed: () {
                // 네비게이터를 통한 Named route
                // Navigator.of(context).pushNamed('/first');

                // 이게 GetX 를 통한 Named route
                Get.toNamed('/next',
                    arguments: User(date: '19950212', gender: 'm'));
                // 이렇게도 가능
                // Get.to(FirstPage(), arguments: "개남");
              },
            ),
            RaisedButton(
              child: Text('Arguments 전달'),
              onPressed: () {
                // 네비게이터를 통한 Named route
                // Navigator.of(context).pushNamed('/first');

                // 이게 GetX 를 통한 Named route
                Get.toNamed('/next',
                    arguments: User(date: '19950212', gender: 'm'));
                // 이렇게도 가능
                // Get.to(FirstPage(), arguments: "개남");
              },
            ),
            RaisedButton(
              child: Text('단순상태관리'),
              onPressed: () {
                Get.to(SimpleStateManagePage());
              },
            ),
            RaisedButton(
              child: Text('반응형상태관리'),
              onPressed: () {
                Get.to(ReactiveStateManagePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String date;
  String gender;
  User({required this.date, required this.gender});
}
