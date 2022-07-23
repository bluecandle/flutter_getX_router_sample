import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/controller/dependence_controller.dart';
import 'package:sample_route_manage/src/pages/dependencies/get_lazyput.dart';
import 'package:sample_route_manage/src/pages/dependencies/get_put.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('의존성주입')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
              child: Text('Getput'),
              onPressed: () {
                // 보낼때 binding 을 하겠다!(page 로 보내면서, 사용할 controller 를 함께 보내주는 것.)
                // 넘어간 페이지에서 Get.put 을 하는게 아니라, routing 단계에서 binding 해주는 것!
                // 그리고, GetX 는 해당 페이지로 넘어갈 때 알아서 controller 생성해주고, 해당 페이지 빠져나오면 알아서 종료해줌. (알아서 메모리 관리)
                // [GETX] "DependenceController" onDelete() called
                Get.to(GetPut(), binding: BindingsBuilder(() {
                  Get.put(DependenceController());
                }));
              }),
          RaisedButton(
              child: Text('Get.lazyPut'),
              onPressed: () {
                Get.to(GetLazyPut(), binding: BindingsBuilder(() {
                  // lazyPut 은 build 형태의 인자를 받는다.
                  // lazyPut 은 페이지 넘어가자마자 controller 를 메모리에 올리는 것이 아니라, 사용하려고 할 때 올림!
                  Get.lazyPut<DependenceController>(
                      () => DependenceController());
                }));
              }),
          RaisedButton(
              child: Text('Get.putAsync'),
              onPressed: () {
                // 비동기 처리 이후 put 을 하겠다.
                Get.to(GetPut(), binding: BindingsBuilder(() {
                  // 근데, 주로 controller 인스턴스를 메모리에 올린 후에, 거기서 async 를 하는 방법이 더 많이 쓰임.
                  Get.putAsync<DependenceController>(() async {
                    await Future.delayed(Duration(seconds: 3));
                    return DependenceController();
                  });
                }));
              }),

          // Singleton -> 하나만 생성하고, 그것을 공유하는 방식.
          // 위의 세 가지 방법은 Singleton 방식
          // 아래 방식은 여러 개를 생성해서 사용하는 방식. 근데, 사실 사용할만한 상황이 많지가 않음!
          RaisedButton(
              child: Text('Get.create'),
              onPressed: () {
                Get.to(GetPut(), binding: BindingsBuilder(() {
                  Get.create<DependenceController>(() {
                    return DependenceController();
                  });
                }));
              }),
        ],
      )),
    );
  }
}
