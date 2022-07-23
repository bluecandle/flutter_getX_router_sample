import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/controller/dependence_controller.dart';

class GetPut extends StatelessWidget {
  const GetPut({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Get.create vs Get.put 실험
      // Get.put 을 통해 build 되어서 (BindingsBuilder) 넘어오면 hashcode 가 같게 찍힘. 왜? 같은거니까.
      // Get.create 통해 build 되어서 넘어오면 hashcode 가 다르게 찍힘. 왜?? 다른거니까! (새로 생성)
      body: RaisedButton(onPressed: () {
        print(Get.find<DependenceController>().hashCode);
        Get.find<DependenceController>().increase();
      }),
    );
  }
}
