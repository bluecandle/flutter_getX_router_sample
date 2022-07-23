import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountControllerWithGetX extends GetxController {
  int count = 0;
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
    count = value;
    update();
  }
}
