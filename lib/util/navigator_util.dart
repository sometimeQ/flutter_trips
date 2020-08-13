import 'package:flutter/material.dart';

class NavigatorUtil {
  ///跳转到指定页面
  static push(BuildContext context, Widget page, {Function callBack}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page)).then(
      (value) => {
        /// 获取返回处理
        callBack != null ? callBack() : print('not fount callBack')
      },
    );
  }
}
