import 'package:flutter/material.dart';
import 'package:flutter_trips/widget/webview.dart';
import '../model/common_model.dart';
import '../model/grid_nav_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;
  const GridNav({this.gridNavModel});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(6.0),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  List<Widget> _gridNavItems(context) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;
    if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.hotel, true));
    }
    if (gridNavModel.flight != null) {
      items.add(_gridNavItem(context, gridNavModel.flight, false));
    }
    if (gridNavModel.travel != null) {
      items.add(_gridNavItem(context, gridNavModel.travel, false));
    }

    return items;
  }

  Widget _gridNavItem(context, GridNavItem gridNavItem, bool firstRow) {
    List<Widget> items = [];

    // 线性渐变
    Color startColor = Color(int.parse('0xff${gridNavItem.startColor}'));
    Color endColor = Color(int.parse('0xff${gridNavItem.endColor}'));

    // 总结下:因为外面是一个数组所以的循环的去创建遍历
    // 大的
    items.add(_inkeWell(gridNavItem.mainItem, context));

    // 第一行
    items.add(_midlleWell(gridNavItem.item1, gridNavItem.item2, context));
    items.add(_midlleWell(gridNavItem.item3, gridNavItem.item4, context));

    return Container(
      height: 88,
      margin: firstRow ? null : EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [startColor, endColor],
      )),
      child: Row(
        children: items,
      ),
    );
  }

  Widget _midlleWell(CommonModel top, CommonModel bottom, context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _childRenItem(top, context, true),
            ),
            _childRenItem(bottom, context, false),
          ],
        ),
      ),
    );
  }

  Widget _childRenItem(CommonModel model, context, bool isLast) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    // FractionallySizedBox 是一个相对父组件尺寸的组件
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: borderSide,
            bottom: isLast ? borderSide : BorderSide.none,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebView(
                          url: model.url,
                          title: model.title,
                          statusBarColor: model.statusBarColor,
                          hideAppBar: model.hideAppBar,
                        )));
          },
          child: Container(
            child: Center(
              child: Text(
                model.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inkeWell(CommonModel mainItem, context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              url: mainItem.url,
              title: mainItem.title,
              statusBarColor: mainItem.statusBarColor,
              hideAppBar: mainItem.hideAppBar,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          // 右边分割线
          border: Border(
            right: BorderSide(
              width: 1,
              color: Colors.white,
            ),
          ),
        ),
        child: Stack(
          // 叠加,绝对定位
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            CachedNetworkImage(
              // 缓存图片
              imageUrl: mainItem.icon,
              fit: BoxFit.contain,
              height: 88,
              width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              // alignment: AlignmentDirectional.centerEnd,
              margin: EdgeInsets.only(top: 13),
              child: Text(
                mainItem.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    // 主要的功能就是设置widget四边圆角，可以设置阴影颜色，和z轴高度
    return PhysicalModel(
      borderRadius: BorderRadius.circular(6.0), // 四角圆度半径
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias, // 裁剪模式
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  List<Widget> _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;
    if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.hotel, true));
    }
    if (gridNavModel.flight != null) {
      items.add(_gridNavItem(context, gridNavModel.flight, false));
    }
    if (gridNavModel.travel != null) {
      items.add(_gridNavItem(context, gridNavModel.travel, false));
    }
    return items;
  }

  Widget _gridNavItem(
      BuildContext context, GridNavItem gridNavItem, bool first) {
    List<Widget> items = [];
    List<Widget> expandItems = [];

    // 线性渐变色
    Color startColor = Color(int.parse('0xff${gridNavItem.startColor}'));
    Color endColor = Color(int.parse('0xff${gridNavItem.endColor}'));

    items.add(_mainItem(context, gridNavItem.mainItem));
    items.add(_doubleItem(context, gridNavItem.item1, gridNavItem.item2));
    items.add(_doubleItem(context, gridNavItem.item3, gridNavItem.item4));

    items.forEach((element) {
      expandItems.add(Expanded(
        child: element,
        flex: 1,
      ));
    });

    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [startColor, endColor]),
      ),
      child: Row(
        children: expandItems,
      ),
    );
  }

  Widget _doubleItem(
      BuildContext context, CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(
            context,
            topItem,
            true,
          ),
        ),
        Expanded(
          child: _item(
            context,
            bottomItem,
            false,
          ),
        ),
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel item, bool first) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      // 撑满宽度
      widthFactor: 1,
      child: Container(
          decoration: BoxDecoration(
            border: Border(
                left: borderSide, bottom: first ? borderSide : BorderSide.none),
          ),
          child: _wrapGesture(
              context,
              Center(
                child: Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              item)),
    );
  }

  Widget _mainItem(BuildContext context, CommonModel model) {
    return _wrapGesture(
      context,
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: model.icon,
            fit: BoxFit.contain,
            height: 88,
            width: 121,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          Container(
            margin: EdgeInsets.only(top: 11),
            child: Text(model.title,
                style: TextStyle(fontSize: 14, color: Colors.white)),
          )
        ],
      ),
      model,
    );
  }

  Widget _wrapGesture(BuildContext context, Widget widget, CommonModel model) {
    return InkWell(
      onTap: () {
        print('object');
      },
      child: widget,
    );
  }
  */
// }
