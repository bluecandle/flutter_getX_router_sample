import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/pages/normal/second.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Named Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('다음페이지 이동'),
              onPressed: () {
                // Get.toNamed('/second');

                // 현재페이지 (First Named page) 의 히스토리를 지우고 second 로 이동
                Get.offNamed('/second');
              },
            )
          ],
        ),
      ),
    );
  }
}
