import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trips/model/common_model.dart';
import 'package:flutter_trips/model/grid_nav_model.dart';
import 'package:flutter_trips/model/home_models.dart';
import 'package:flutter_trips/model/sales_box_modle.dart';
import 'package:flutter_trips/pages/speak_page.dart';
import 'package:flutter_trips/util/navigator_util.dart';
import 'package:flutter_trips/widget/loading_container.dart';
import 'package:flutter_trips/widget/local_nav.dart';
import 'package:flutter_trips/widget/search_bar.dart';
import 'package:flutter_trips/widget/webview.dart';
import '../severce/home_severce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/grid_nav.dart';
import '../widget/sub_nav.dart';
import '../widget/sales_box.dart';
import '../pages/search_page.dart';
// import '../widget/grid_nav.dart';
// import 'package:flutter_trip/pages/city_page.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CommonModel> bannerList = [];
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;

  double appBarAlpha = 0;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 加载数据
    _loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    // 初始化屏幕
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      backgroundColor: Color(0xfffafafc),
      body: LoadingContainer(
        child: Stack(
          children: <Widget>[
            _topNavBar(context),
            _apspBar,
          ],
        ),
        isLoading: _isLoading,
      ),
    );
  }

  Widget _topNavBar(context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: NotificationListener(
        onNotification: (scrollview) {
          // 监听滚动距离
          if (scrollview is ScrollUpdateNotification && scrollview.depth == 0) {
            _onScollview(scrollview.metrics.pixels);
          }
          return true;
        },
        child: RefreshIndicator(
          // 下拉回调方法,方法需要有async和await关键字，没有await，刷新图标立马消失，没有async，刷新图标不会消失
          onRefresh: _loadHomeData,
          child: ListView(
            children: <Widget>[
              Container(
                height: 262,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: _swiperPicture(context),
                    ),
                    Positioned(
                      top: 180,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: LocalNav(localNavList: localNavList),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                margin: EdgeInsets.only(top: 0),
                child: Column(
                  children: <Widget>[
                    GridNav(gridNavModel: gridNavModel),
                    SubNav(subNavList: subNavList),
                    SalesBox(salesBoxModel: salesBoxModel),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _swiperPicture(context) {
    return Container(
      height: 210,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        pagination: SwiperPagination(// 分页指示器

            ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              CommonModel models = bannerList[index];
              // 路由跳转
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebView(
                    url: models.url,
                  ),
                ),
              );
            },
            child: Image.network(bannerList[index].icon, fit: BoxFit.fill),
          );
        },
      ),
    );
  }

  _onScollview(offset) {
    // print(offset);
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      appBarAlpha = alpha;
    });
  }

  Widget get _apspBar {
    return Column(
      children: <Widget>[
        // 首先放一个Container，里面设置装饰器的演示、设置AppBar渐变的遮罩，从0x66000000渐变到。透明的颜色
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter, // bottomRight透明
            ),
          ),
          // child里面再放一个Container。设置了一个高度，然后设置了padding，这个Container其实就是输入框后面的背景。
          // contianer能够随着滚动发生颜色的变化
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {
                // 城市选择器
              },
              city: '上海',
            ),
          ),
        ),
        // 默认状态下底部阴影是没有的， 只有当我们滑动了一定的距离才会出现阴影
        Container(
          height: appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]),
        ),
      ],
    );
  }

  // 跳转搜索页面
  void _jumpToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(
          hint: SEARCH_BAR_DEFAULT_TEXT,
          hideLeft: false,
        ),
      ),
    );
  }

  // 跳转语音页面
  void _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }

  // 跳转选择城市页面
  void _jumpToCity() async {}

  Future<Null> _loadHomeData() async {
    requestHomeApiData().then((value) {
      // Map map = new Map<String, dynamic>.from(value);
      HomeTatolModel models = HomeTatolModel.fromJson(value);

      setState(() {
        bannerList = models.bannerList;
        localNavList = models.localNavList;
        gridNavModel = models.gridNav;
        subNavList = models.subNavList;
        salesBoxModel = models.salesBox;
        _isLoading = false;
      });
    });
  }
}
