import 'package:flutter/material.dart';
import 'package:flutter_trips/model/travel_model.dart';
import 'package:flutter_trips/model/travel_params_model.dart';
import 'package:flutter_trips/model/travel_tab_model.dart';
import 'package:flutter_trips/pages/travel_tab_page.dart';
import 'package:flutter_trips/severce/home_severce.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  // 初始化控制器
  TabController _controller;
  List<Groups> tabs = [];

  // 类别模型
  TravelTabModel travelTabModel;
  // 具体内容模型内容
  TravelParamsModel travelParamsModel;

  @override
  void initState() {
    // 初始化
    _controller = TabController(length: 0, vsync: this);

    // 调取旅拍类别接口
    _loadParams();

    super.initState();
  }

  @override
  void dispose() {
    // 销毁
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // 顶部的tabber 列表
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: TabBar(
              controller: _controller,
              isScrollable: true,
              labelColor: Colors.black,
              labelPadding: EdgeInsets.fromLTRB(8, 6, 8, 0),
              // indicator: UnderlineTabIndicator(
              //   borderSide: BorderSide(color: Color(0xff1fcfbb), width: 1),
              //   insets: EdgeInsets.only(bottom: 10),
              // ),

              // 设置底部线条的距离宽度的
              indicatorColor: Color(0xff2FCFBB),
              indicatorPadding: EdgeInsets.all(6),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              labelStyle: TextStyle(fontSize: 18),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              tabs: tabs.map<Tab>((Groups tab) {
                return Tab(
                  text: tab.name,
                );
              }).toList(),
            ),
          ),
          // 底部内容
          Flexible(
            child: Container(
              padding: EdgeInsets.fromLTRB(6, 3, 6, 0),
              child: TabBarView(
                controller: _controller,
                children: tabs.map((Groups group) {
                  return TravelTabPage(
                    travelUrl: travelParamsModel?.url,
                    params: travelParamsModel?.params,
                    groupChannelCode: group?.code,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loadParams() {
    requestTravelTabApiData().then((value) {
      setState(() {
        travelParamsModel = value;
        // print('旅拍接口 + $travelTabModel');
      });

      // 加载底部内容
      _loadTab();
    });
  }

  // 加载底部内容数据
  void _loadTab() {
    requestTravelTabContenApiData().then((value) {
      // 初始化
      _controller = TabController(
          length: value.district.groups.length,
          vsync: this); //fix tab label 空白问题

      setState(() {
        tabs = value.district.groups;
        travelTabModel = value;
      });
    }).catchError((onError) {});
  }
}
