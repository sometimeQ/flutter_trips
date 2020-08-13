import 'package:flutter/material.dart';
import 'package:flutter_trips/widget/webview.dart';
import '../model/common_model.dart';

class LocalNav extends StatelessWidget {
  // 接收参数
  final List<CommonModel> localNavList;

  const LocalNav({this.localNavList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: _localNav(context),
      ),
    );
  }

  Widget _localNav(context) {
    if (localNavList == null) return null;
    List<Widget> items = [];

    localNavList.forEach((element) {
      items.add(_item(context, element));
    });

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 平分
        children: items,
      ),
    );
  }

  Widget _item(context, CommonModel model) {
    return InkWell(
      onTap: () {
        print('点击跳转');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebView(
                url: model.url,
                statusBarColor: model.statusBarColor,
                hideAppBar: model.hideAppBar,
                title: model.title,
              ),
            ));
      },
      child: Column(
        children: <Widget>[
          Image.network(model.icon, width: 40, height: 40),
          Text(model.title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
