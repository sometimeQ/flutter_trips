import 'package:flutter/material.dart';
import './navigator/tab_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        // 自定义字体
        fontFamily: 'PingFang',
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator(),
    );
  }
}
