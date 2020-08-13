import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_trips/model/destination_model.dart';
import 'package:flutter_trips/pages/scalable_box.dart';
import 'package:flutter_trips/plugin/vertical_tab_view.dart';
import 'package:flutter_trips/widget/loading_container.dart';
import 'package:flutter_trips/widget/search_bar.dart';
import '../severce/home_severce.dart';

const DEFAULT_TEXT = '目的地 | 主题 | 关键字';

class DestinationPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage>
    with AutomaticKeepAliveClientMixin {
  // 定义模型数据
  DestinationModel destinationModel;
  List<NavigationPopList> navigationPopList;

  // 左边List数组
  List<Tab> leftTabs = [];
  // 右边总的数据
  List<Widget> rightTotalTabPages = [];

  // 是否显示菊花,默认
  bool _isLoading = true;

  @override
  void initState() {
    // 请求数据
    _loadData();
    super.initState();
  }

  // 缓存页面
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // 判断是否有值
    if (leftTabs.length > 0 && rightTotalTabPages.length > 0) {
      setState(() {
        _isLoading = false;
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingContainer(
        isLoading: _isLoading,
        child: Container(
          margin: EdgeInsets.only(
            top: Theme.of(context).platform == TargetPlatform.iOS ? 24 : 86,
          ),
          // 传入左边的left 与右边的page
          child: VerticalTabView(
            tabsWidth: 88,
            tabsElevation: 0,
            indicatorWidth: 0,
            selectedTabBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            tabTextStyle: TextStyle(
              height: 60,
              color: Color(0xff333333),
            ),
            tabs: leftTabs,
            contents: rightTotalTabPages,
          ), // Tabbar数据
        ),
      ),
    );
  }

  _loadData() {
    requestDestionsApiData().then((reslut) {
      // 模型转换
      DestinationModel model = DestinationModel.fromJson(reslut);
      // 赋值
      setState(() {
        destinationModel = model;
        navigationPopList = model.navigationPopList;
      });

      // 左边 List 上下滚动数据
      _createLeftTab();
      // 整合数据
      _createTabPage(context);
    });
  }

  // 左边 List 上下滚动数据
  List<Tab> _createLeftTab() {
    // 校验
    if (navigationPopList == null) return null;
    // 遍历取得left list数组
    navigationPopList.forEach((element) {
      // print(element.categoryName);
      leftTabs.add(
        Tab(
          child: Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(
              element.categoryName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 15,
              ),
            ),
          ),
        ),
      );
    });
    return leftTabs;
  }

  List<Widget> _createTabPage(BuildContext context) {
    // 校验
    if (navigationPopList == null) return null;
    // 遍历整合数据
    for (var i = 0; i < navigationPopList.length; i++) {
      // 声明右边显示的header 标题数组
      List<Widget> rightTabPage = [];
      // 继续遍历内部的destAreaList
      for (var j = 0; j < navigationPopList[i].destAreaList.length; j++) {
        // 打印标题
        // print(navigationPopList[i].destAreaList[j].text);

        // 右边header标题数组
        rightTabPage.add(
          Container(
            // 内边距
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Text(
              navigationPopList[i].destAreaList[j].text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        );

        // 图片数组
        List<Widget> imageItems = [];

        // 可显示的图片+标题
        List<Widget> visibleSpans = [];
        List<Row> visibleRows = [];

        // 不可显示的区域
        List<Widget> unVisibleSpans = [];
        List<Row> unVisibleRows = [];

        // 遍历内部child的数组整合数据
        for (var k = 0;
            k < navigationPopList[i].destAreaList[j].child.length;
            k++) {
          // 右边子标题
          String childName = navigationPopList[i].destAreaList[j].child[k].text;
          // 右边子标题上面显示的类别,比如 美食、兵马俑、啤酒节
          String tagName =
              navigationPopList[i].destAreaList[j].child[k].tagList.length > 0
                  ? navigationPopList[i]
                      .destAreaList[j]
                      .child[k]
                      .tagList[0]
                      .tagName
                  : "";

          // 关于右边自标题过多展示图片与标题以及是否只有展示标题的
          String spanText = navigationPopList[i].destAreaList[j].child[k].text;
          // 类别数组个数
          int aTagList =
              navigationPopList[i].destAreaList[j].child[k].tagList.length;
          // 展示的图片
          String picUrl = navigationPopList[i].destAreaList[j].child[k].picUrl;
          // 类似标题
          String kwd = navigationPopList[i].destAreaList[j].child[k].kwd;
          // id
          int id = navigationPopList[i].destAreaList[j].child[k].id;

          // 判断是否有图片以及大于9个的标题如何展示
          if (picUrl != '' && picUrl != null) {
            // 整合数据
            imageItems.add(
              createImage(
                picUrl,
                aTagList,
                tagName,
                childName,
                kwd,
                id,
              ),
            );
          } else {
            /// 标签
            // 当标签数量小于9个时，放到可以显示的容器
            if (k < 9) {
              visibleSpans.add(
                createSpan(spanText, aTagList, tagName, kwd, id),
              );
            } else if (k >= 9) {
              // 放到不可显示的区域
              unVisibleSpans.add(
                createSpan(spanText, aTagList, tagName, kwd, id),
              );
            }
          }
        }

        // 整合数据row 、如果可显示的区域visibleSpans > 9  截取范围加入
        // 内部row组件
        if (visibleSpans.length == 9) {
          visibleRows.add(Row(
            children: visibleSpans.sublist(0, 3),
          ));

          visibleRows.add(Row(
            children: visibleSpans.sublist(3, 6),
          ));

          visibleRows.add(Row(
            children: visibleSpans.sublist(6, 9),
          ));
        }

        // 不可显示区域、用于展示 或收起的数据
        int unStart = 0;
        if (unVisibleSpans.length >= 9) {
          // 展示底部如果大于9个则显示更多 展开 收起 的数据 // 2 5 8 就是最后一列，即每一行的最后一位数值
          // 超过后即显示展开或者收起的字段
          for (var k = 0; k < unVisibleSpans.length; k++) {
            if ((k + 1) % 3 == 0 && k != 0) {
              unVisibleRows.add(Row(
                children: unVisibleSpans.sublist(unStart, (k + 1)),
              ));
              unStart = k + 1;
            }
          }
        }

        // 处理数据 每3条数据放到一个row容器
        /*
                                                                8 ÷ 3 :	 商= 2; 余数= 2
                                                                7 ÷ 3 :	 商= 2; 余数= 1
                                                                6 ÷ 3 :	 商= 2; 余数= 0
                                                                5 ÷ 3 :	 商= 1; 余数= 2
                                                                4 ÷ 3 :	 商= 1; 余数= 1
                                                                3 ÷ 3 :	 商= 1; 余数= 0
                                                                2 ÷ 3 :	 商= 0; 余数= 2
                                                                1 ÷ 3 :	 商= 0; 余数= 1
                                                                0 ÷ 3 :	 商= 0; 余数= 0
                                                               */
        List<Widget> rowList = [];
        // 数组从0开始  1 4 7 即 ====>   2  5  8
        if (imageItems.length % 3 == 1) {
          imageItems.add(Expanded(child: Container()));
          imageItems.add(Expanded(child: Container()));
        } else if (imageItems.length % 3 == 2) {
          // 2 5 8 即 ======= >   3  6  9
          imageItems.add(Expanded(child: Container()));
        }

        int start = 0;
        for (var k = 0; k < imageItems.length; k++) {
          // 证明每一行的末尾
          if ((k + 1) % 3 == 0 && k != 0) {
            rowList.add(Row(
              children: imageItems.sublist(start, (k + 1)),
            ));
            start = k + 1;
          } else if (imageItems.length - start < 3) {
            rowList.add(Row(
              children: imageItems.sublist(start),
            ));
            break;
          }
        }

        rightTabPage.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rowList,
        ));

        // 如果可显示行
        if (visibleRows.length > 0) {
          rightTabPage.add(
            ScalableBox(
              visibleSpans: visibleRows, // 可显示行
              unVisibleSpans: unVisibleRows, // 不可显示行
            ),
          );
        }
      }

      // 布局总的数据
      rightTotalTabPages.add(
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(2, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: rightTabPage,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  // 整合数据的数组  图片 + 类别 + 下方子标题
  Widget createImage(String picUrl, int tagListList, String tagName, imgName,
      String kwd, int id) {
    return Expanded(
      child: GestureDetector(
        onDoubleTap: () {
          print('可点击的');
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
          child: Column(
            children: <Widget>[
              // PhysicalModel ，主要的功能就是设置widget四边圆角
              PhysicalModel(
                borderRadius: BorderRadius.circular(6),
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                elevation: 5, // z轴高度
                child: Stack(
                  children: <Widget>[
                    // 图片
                    Container(
                      child: Image.network(
                        picUrl,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // 顶部悬浮的类别
                    tagListList > 0
                        ? Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              height: 18,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xffff7600),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8)),
                              ),
                              // 文字
                              child: Text(
                                tagName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              // 图片下方子标题
              Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: Text(
                  kwd,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff333333).withAlpha(220),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 没有图片的组件  无图片 + 边框 + 悬浮类别 + 显示展开、收起的类别
  Widget createSpan(
      String spanText, int aTagList, String tagName, String kwd, int id) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
              height: 36,
              // 装饰器
              decoration: BoxDecoration(
                color: Color(0xfff8f8f8),
                borderRadius: BorderRadius.circular(4),
                // 阴影
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(30),
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 3,
                  )
                ],
              ),
              child: Text(
                // 子标题
                spanText,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff333333).withAlpha(220),
                  fontSize: 13,
                ),
              ),
            ),
            aTagList > 0
                ? Positioned(
                    top: -8,
                    right: 4,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      height: 18,
                      alignment: Alignment.center,
                      // 悬浮上面的四角
                      decoration: BoxDecoration(
                        color: Color(0xffff7600),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                      child: Text(
                        // 悬浮上面的名字
                        tagName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
          overflow: Overflow.visible, // 可见UI
        ),
      ),
    );
  }

  void _jumpToSearch() {}

  void _jumpToSpeak() {}

  void _jumpToService() {}
}
