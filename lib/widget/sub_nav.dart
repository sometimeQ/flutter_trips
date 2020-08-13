import 'package:flutter/material.dart';
import 'package:flutter_trips/widget/webview.dart';
import '../model/common_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SubNav extends StatelessWidget {
  // 接收参数
  final List<CommonModel> subNavList;
  const SubNav({this.subNavList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.all(7.0),
        child: _items(context),
      ),
    );
  }

  Widget _items(context) {
    if (subNavList == null) return null;
    List<Widget> items = [];

    // 遍历
    subNavList.forEach((model) {
      items.add(_item(context, model));
    });

    // 计算出第一行显示的数量
    int separate = (subNavList.length / 2 + 0.1).toInt(); // 间隙吧
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, separate), // 数组拆分
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(separate, subNavList.length), // 数组拆分
          ),
        ),
      ],
    );
  }

  Widget _item(context, CommonModel model) {
    // print(model.title);
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          print('点了没有反映呢');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebView(
                url: model.url,
                hideAppBar: model.hideAppBar,
                statusBarColor: model.statusBarColor,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: model.icon,
              width: 18,
              height: 18,
            ),
            Container(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                model.title,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
