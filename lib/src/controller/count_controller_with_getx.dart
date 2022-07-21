import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountControllerWithGetX extends GetxController {
  int count = 0;
  void increase(String id) {
    count++;
    update([id]); // GetxController 는 그냥 이걸로 업데이트
  }
}
