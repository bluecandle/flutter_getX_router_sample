import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/controller/count_controller_with_getx.dart';
import 'package:sample_route_manage/src/controller/count_controller_with_getx_reactive.dart';

class ReactiveStateManagePage extends StatelessWidget {
  ReactiveStateManagePage({Key? key}) : super(key: key);

  CountControllerWithReactive _controllerWithReactive =
      Get.put(CountControllerWithReactive());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('반응형상태관리')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GetX",
              style: TextStyle(fontSize: 50),
            ),

            // 반응형 변경값 반영하는 방법 1 > 이게 더 선호되는 방법.
            Obx(() {
              // print('update!');
              return Text(
                '${_controllerWithReactive.count.value}',
                style: TextStyle(fontSize: 50),
              );
            }),

            // 반응형 변경값 반영하는 방법 2
            // GetX(builder: (_) {
            //   return Text(
            //     '${Get.find<CountControllerWithReactive>().count.value}',
            //     style: TextStyle(fontSize: 50),
            //   );
            // }),

            // 여기다가 GetBuilder 하나 더 놓으니까 에러 발생 (Each child must be laid out exactly once.)

            RaisedButton(
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  _controllerWithReactive.increase();
                }),
            RaisedButton(
                child: Text(
                  '5로 변경',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  _controllerWithReactive.putNumber(5);
                })
          ],
        ),
      ),
    );
  }
}
