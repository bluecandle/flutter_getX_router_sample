import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/home.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // url param 받는 방법
            // query param 에도 동일하게 적용됨
            Text("uid : ${Get.parameters['uid']}"),
            Text("date : ${Get.parameters['date']}"),
            Text("gender : ${Get.parameters['gender']}"),

            RaisedButton(
              child: Text('뒤로 이동'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
