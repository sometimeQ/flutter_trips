import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trips/model/common_model.dart';
import 'package:flutter_trips/model/sales_box_modle.dart';
import 'package:flutter_trips/widget/webview.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxModel salesBoxModel;

  const SalesBox({Key key, this.salesBoxModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: _items(context),
    );
  }

  Widget _items(context) {
    if (salesBoxModel == null) return null;
    List<Widget> items = [];

    // 分成3行
    // 第一行大卡片
    items.add(_doubleItem(
        context, salesBoxModel.bigCard1, salesBoxModel.bigCard2, true, false));
    items.add(_doubleItem(context, salesBoxModel.smallCard1,
        salesBoxModel.smallCard2, false, false));
    items.add(_doubleItem(context, salesBoxModel.smallCard3,
        salesBoxModel.smallCard4, false, true));

    // 返回 组件组成的Column
    return Column(
      children: <Widget>[
        Container(
          height: 44,
          margin: EdgeInsets.only(left: 10),
          // 下划线用decoration装饰器。
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Color(0xfff2f2f2)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // 更多活动
              // 标题
              CachedNetworkImage(
                imageUrl: salesBoxModel.icon,
                fit: BoxFit.fill,
                height: 15,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
                margin: EdgeInsets.only(right: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // 线性渐变
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffff4e63),
                      Color(0xffff6cc9),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: InkWell(
                  child: Text(
                    '获取更多福利 >',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        items[0],
        items[1],
        items[2],
      ],
    );
  }

  // isBig 是否是大卡片，leftCard 左边，rightCard 右边，isLast 是否是最后一个图片
  Widget _doubleItem(BuildContext context, CommonModel leftCard,
      CommonModel rightCard, bool isBig, bool isLast) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // 左边图片
        _item(context, leftCard, isBig, true, isLast),
        // 右边图片
        _item(context, rightCard, isBig, false, isLast),
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel model, bool isBig, bool isLeft,
      bool isLast) {
    BorderSide borderSide = BorderSide(width: 1, color: Color(0xfff2f2f2));
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: model.url,
                      title: model.title ?? '活动',
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: isLast ? BorderSide.none : borderSide,
            right: isLeft ? borderSide : BorderSide.none,
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: model.icon,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width / 2 - 15, // 屏幕宽度
          height: isBig ? 129 : 80,
        ),
      ),
    );
  }
}
