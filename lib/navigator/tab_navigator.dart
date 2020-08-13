import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/destination_page.dart';
import '../pages/travel_page.dart';
import '../pages/my_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  // 底部tabbar默认颜色
  // final _defaultColor = Colors.grey;
  // final _activeColor = Colors.blue;

  final _defaultColor = Color(0xff8a8a8a);
  final _activeColor = Color(0xff50b4ed);

  // tabbar索引
  int _currentIndex = 0;
  PageController _pageController;

  // tabbar数组
  List<Widget> tabbarList = [
    HomePage(),
    DestinationPage(),
    TravelPage(),
    MyPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: tabbarList,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // 跳转到对应的page
          // _pageController.animateToPage(index,
          //     duration: Duration(milliseconds: 260), curve: Curves.easeIn);
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        items: [
          _bottomItem(
              'images/xiecheng.png', 'images/xiecheng_active.png', '首页', 0),
          _bottomItem('images/mude.png', 'images/mude_active.png', '目的地', 1),
          _bottomItem('images/lvpai.png', 'images/lvpai_active.png', '旅拍', 2),
          _bottomItem('images/wode.png', 'images/wode_active.png', '我的', 3),

          /*
          BottomNavigationBarItem(
            icon: Image.asset('images/xiecheng.png', width: 22, height: 22),
            activeIcon: Image.asset('images/xiecheng_active.png',
                width: 22, height: 22),
            title: Text(
              '首页',
              style: TextStyle(
                color: _currentIndex != 0 ? _defaultColor : _activeColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/mude.png', width: 22, height: 22),
            activeIcon:
                Image.asset('images/mude_active.png', width: 22, height: 22),
            title: Text(
              '目的地',
              style: TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/lvpai.png', width: 22, height: 22),
            activeIcon:
                Image.asset('images/lvpai_active.png', width: 22, height: 22),
            title: Text(
              '旅拍',
              style: TextStyle(
                  color: _currentIndex != 2 ? _defaultColor : _activeColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/wode.png', width: 22, height: 22),
            activeIcon:
                Image.asset('images/wode_active.png', width: 22, height: 22),
            title: Text(
              '我的',
              style: TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor),
            ),
          ),
          */
        ],
      ),
    );
  }

  // 封装底部Item
  BottomNavigationBarItem _bottomItem(
      String defalutIcon, String activeIcon, String title, int index) {
    // IconData icon
    return BottomNavigationBarItem(
      icon: Image.asset(
        defalutIcon,
        width: 22,
        height: 22,
      ),
      activeIcon: Image.asset(
        activeIcon,
        width: 22,
        height: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: _currentIndex != index ? _defaultColor : _activeColor,
        ),
      ),
    );
  }
}
