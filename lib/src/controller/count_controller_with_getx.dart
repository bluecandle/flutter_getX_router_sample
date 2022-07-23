import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountControllerWithGetX extends GetxController {
  // Get.find<CountControllerWithGetX> 를 사용하지 않도록 하기 위한 방법
  static CountControllerWithGetX get to => Get.find();

  // int count = 0;
  RxInt count = 0.obs;
  void increase(String id) {
    count++;
    update([id]); // GetxController 는 그냥 이걸로 업데이트 (id 지정된 컴포넌트에게 변경사항 전달)
    /**
     *  WithGetX 에 있는 아래 친구한테 보내주는거임!
     *  GetBuilder<CountControllerWithGetX>(
            id: 'first',
     */
  }

  void putNumber(int value) {
    // count = value;
    count(value);
    update();
  }
}
