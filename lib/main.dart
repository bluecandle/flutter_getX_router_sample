import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/home.dart';
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
              transition: Transition.zoom)
        ]);
  }
}
