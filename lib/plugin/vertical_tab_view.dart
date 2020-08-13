import 'package:flutter/material.dart';

enum IndicatorSide { start, end }

class VerticalTabView extends StatefulWidget {
  // 初始化值
  final Key key;
  final int initialIndex;
  final double tabsWidth;
  final double indicatorWidth;
  final IndicatorSide indicatorSide;
  final List<Tab> tabs;
  final List<Widget> contents;
  final TextDirection direction;
  final Color indicatorColor;
  final bool disabledChangePageFromContentView;
  final Axis contentScrollAxis;
  final Color selectedTabBackgroundColor;
  final Color tabBackgroundColor;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final Duration changePageDuration;
  final Curve changePageCurve;
  final Color tabsShadowColor;
  final double tabsElevation;
  final Function(int tabIndex) onSelect;
  final Color backgroundColor;

  VerticalTabView(
      {this.key,
      @required this.tabs, // 左边列表数组
      @required this.contents, // 内容
      this.tabsWidth = 200, // 默认宽度
      this.indicatorWidth = 3, // 指示器宽度3
      this.indicatorSide, //
      this.initialIndex = 0, // 默认初始化 index = 0
      this.direction =
          TextDirection.ltr, // // textDirection 文本方向分别有.ltr从左到右; .rtl 从右到左
      this.indicatorColor = Colors.green, // 默认绿色
      this.disabledChangePageFromContentView = false, // 禁用从内容视图更改页面
      this.contentScrollAxis = Axis.horizontal, // 水平
      this.selectedTabBackgroundColor = const Color(0x1100ff00), // 选中背景色
      this.tabBackgroundColor = const Color(0xfff8f8f8), // 左边默认色选中颜色
      this.selectedTabTextStyle =
          const TextStyle(color: Colors.black), // 选中文字颜色
      this.tabTextStyle = const TextStyle(color: Colors.black38), // 默认颜色
      this.changePageCurve = Curves.easeInOut, // 动画
      this.changePageDuration = const Duration(milliseconds: 300), // 持续时间
      this.tabsShadowColor = Colors.black54, // 默认阴影色
      this.tabsElevation = 2.0, // z轴
      this.onSelect, // 现在选中的索引
      this.backgroundColor})
      : assert(
            tabs != null && contents != null && tabs.length == contents.length),
        super(key: key);

  @override
  _VerticalTabViewState createState() => _VerticalTabViewState();
}

class _VerticalTabViewState extends State<VerticalTabView>
    with TickerProviderStateMixin {
  // 选中索引
  int _selectedIndex;
  // 是否切换view
  bool _changePageByTapView;

  // 动画相关
  AnimationController animationController;
  Animation<double> animation;
  List<AnimationController> animationControllers = [];

  // pageController
  PageController pageController = PageController();
  // 禁止弹黄效果
  ScrollPhysics pageScrollPhysics = AlwaysScrollableScrollPhysics();

  @override
  void initState() {
    // 赋值初始化选中的值
    _selectedIndex = widget.initialIndex;
    for (var i = 0; i < widget.tabs.length; i++) {
      // 初始化切换的时候动画控制器
      animationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400)));
    }

    // 默认选中第一个
    _selectTab(widget.initialIndex);

    if (widget.disabledChangePageFromContentView == true) {
      pageScrollPhysics = NeverScrollableScrollPhysics();
    }

    super.initState();

    // 监听生命周期喔 addPostFrameCallback 是 StatefulWidge 渲染结束的回调，只会被调用一次，之后 StatefulWidget 需要刷新 UI 也不会被调用
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageController.jumpToPage(widget.initialIndex);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // 用于确定文本和文字方向
    return Directionality(
      textDirection: widget.direction,
      child: Container(
        color:
            widget.backgroundColor ?? Theme.of(context).canvasColor, // 右边的背景颜色
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Material(
                    elevation: widget.tabsElevation,
                    shadowColor: widget.tabsShadowColor,
                    shape: BeveledRectangleBorder(),
                    child: Container(
                      width: widget.tabsWidth,
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          itemCount: widget.tabs.length,
                          itemBuilder: (context, index) {
                            // 取出传入的tab
                            Tab tab = widget.tabs[index];

                            Widget childs;
                            if (tab.child != null) {
                              childs = tab.child;
                            }

                            // 默认选中颜色以及选中的背景色
                            Color itemBGColor = widget.tabBackgroundColor;
                            if (_selectedIndex == index) {
                              itemBGColor = widget.selectedTabBackgroundColor;
                              // itemBGColor = Color(0x1100ff00);
                            }

                            // 左边装饰器
                            return Stack(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    print('点击啦傻傻');

                                    _changePageByTapView = true;
                                    // 选中索引状态
                                    setState(() {
                                      _selectTab(index);
                                    });

                                    // 切换对应的控制器
                                    pageController.animateToPage(
                                      index,
                                      duration: widget.changePageDuration,
                                      curve: widget.changePageCurve,
                                    );
                                  },
                                  // childs 左边的list竖着的数据 边框
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: itemBGColor,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.all(5),
                                    child: childs,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  // 切换PageView
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: widget.contentScrollAxis,
                      physics: pageScrollPhysics,
                      itemCount: widget.contents.length,
                      itemBuilder: (BuildContext context, index) {
                        return widget.contents[index];
                      },
                      controller: pageController,
                      onPageChanged: (value) {
                        // 改变状态且切换
                        if (_changePageByTapView == false ||
                            _changePageByTapView == null) {
                          _selectTab(value);
                        }

                        if (_selectedIndex == value) {
                          _changePageByTapView = null;
                        }

                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectTab(int index) {
    _selectedIndex = index;
    // 遍历重置
    for (AnimationController animationController in animationControllers) {
      animationController.reset();
    }

    // 开始动画
    animationControllers[index].forward();
    // 赋值索引
    if (widget.onSelect != null) {
      widget.onSelect(_selectedIndex);
    }
  }
}
