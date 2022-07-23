import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sample_route_manage/src/controller/count_controller_with_getx.dart';

// GetView 를 사용하면, 그냥 해당 클래스 안에서는 controller.~~ 이런식으로 CountControllerWithGetX 접근이 가능해짐.
class BindingPage extends GetView<CountControllerWithGetX> {
// class BindingPage extends StatelessWidget {
  const BindingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // 아래 방식처럼 사용하기가 불편함! 코드 입력량이 너무 많다...
      // 간소화하는 방법 1 static 함수
      // CountControllerWithGetX.to
      body: Column(children: [
        // GetBuilder 는 CountControllerWithGetX 에 변화가 있을 때, 변화를 인지하는 함수인데,
        // 더 줄이려면 Obx 쓰면 돠는거!
        // 근데, 이거 쓰려면 count 를 Observable로 바꿔줘야함.

        Obx(() =>
            Text(controller.count.toString(), style: TextStyle(fontSize: 30))),

        // Obx 와 GetBuildr 를 동시 사용 > 에러 발생!
        // GetBuilder<CountControllerWithGetX>(
        //     id: 'bindingpage_1',
        //     builder: (_) {
        //       return Text(_.count.toString(), style: TextStyle(fontSize: 30));
        //     }),
        RaisedButton(onPressed: () {
          // Get.find<CountControllerWithGetX>().increase('bindingpage_1');

          CountControllerWithGetX.to.increase('bindingpage_1');
        })
      ]),
    );
  }
}
