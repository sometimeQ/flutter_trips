import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  // 定义接收的参数
  final Widget child;
  final bool isLoading;

  // 构造函数
  LoadingContainer({@required this.child, @required this.isLoading});

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(), // 圆行进度条
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [
          _loadingView,
        ],
      );
    } else {
      return Stack(
        children: [
          child,
          Container(),
        ],
      );
    }
  }
}
