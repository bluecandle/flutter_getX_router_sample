import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/binding/binding_page.dart';
import 'package:sample_route_manage/src/controller/count_controller_with_getx.dart';
import 'package:sample_route_manage/src/home.dart';
import 'package:sample_route_manage/src/pages/binding.dart';
import 'package:sample_route_manage/src/pages/named/first.dart';
import 'package:sample_route_manage/src/pages/named/second.dart';
import 'package:sample_route_manage/src/pages/next.dart';
import 'package:sample_route_manage/src/pages/normal/first.dart';
import 'package:sample_route_manage/src/pages/normal/second.dart';
import 'package:sample_route_manage/src/pages/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Home(),
        // 기존 방식으로 named route 설정하는 옵션 (MaterialApp 에도 있었음.)
        initialRoute: '/',

        // routes 와 getPages 동시에 쓰면 에러 발생.
        // routes: {
        //   '/': (context) => Home(),
        //   '/first': (context) => FirstNamedPage(),
        //   '/second': (context) => SecondNamedPage()
        // },
        // Get 으로 named route 설정하는 옵션
        getPages: [
          GetPage(name: '/', page: () => Home(), transition: Transition.zoom),
          GetPage(
              name: '/first',
              page: () => FirstNamedPage(),
              transition: Transition.zoom),
          GetPage(
              name: '/second',
              page: () => SecondNamedPage(),
              transition: Transition.zoom),
          GetPage(
              name: '/next',
              page: () => NextPage(),
              transition: Transition.zoom),
          GetPage(
              name: '/user/:uid',
              page: () => UserPage(),
              transition: Transition.zoom),
          // 앱이 켜질 때, 설정 단계에서 binding 을 해줄 수 있음!
          GetPage(
              // /binding 페이지에 대한 라우트 설정 할 때, binding 을 이렇게 설정해주면, 앞으로 신경쓰지 않아도 된다!
              name: '/binding',
              page: () => BindingPage(),
              // binding: BindingsBuilder(() {
              // Get.lazyPut<CountControllerWithGetX>(
              //     () => CountControllerWithGetX());

              // Get.put(CountControllerWithGetX());
              // }))

              // 이런식으로 binding 을 미리 설정해놓을 수도 있음!
              binding: BindingPageBinding())
        ]);
  }
}
