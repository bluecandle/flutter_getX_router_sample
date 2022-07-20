import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/home.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Named Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('뒤로 이동'),
              onPressed: () {
                // Navigator 사용하는 방법
                // context 를 접근하느냐 마느냐에 차이점이 있음.
                // StatelessWidget 를 쓰는 경우 , build 를 벗어난 다른 영역에서 뒤로가기가 안됨.
                // 결국 context 를 전달해줘야하는 차이점이 만들어짐.
                // Navigator.of(context).pop();

                Get.back();
              },
            ),
            RaisedButton(
              child: Text('홈 이동'),
              onPressed: () {
                // 기존 방식
                // 이거 진짜 눈에 안 들어온다...
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (_) => Home()),
                //     (route) => false);

                // 이건 그냥 단순 Home 이동. 근데 이러면 기록이 남음.
                // Get.to(Home());
                // Home 으로 이동하면서, 모든 히스토리를 제거하는 기능.
                // 회원가입, 스플래시 페이지 등 한 번 보고 다시 돌아갈 일 없는 페이지인 경우 사용 가능.
                Get.offAllNamed('/');
              },
            )
          ],
        ),
      ),
    );
  }
}
