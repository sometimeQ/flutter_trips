import 'package:flutter/material.dart';
import '../model/home_model.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final String city; // 城市
  final bool enabled;
  final bool hideLeft;
  final bool autofocus;
  final SearchBarType searchBarType;
  final String hint; // 默认提示文案
  final String defaultText;
  final bool rightIcon;

  // 回调方法
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  // 组件之间传值，可以通过构建函数，如果我要回调这个组件的值呢，给大家介绍一下这两个值 ValueChanged VoidCallback
  final ValueChanged<String> onChanged;

  const SearchBar({
    Key key,
    this.enabled = true,
    this.hideLeft, // 是否隐藏左边按钮
    this.autofocus = false, // 聚焦
    this.searchBarType = SearchBarType.normal, // 默认
    this.hint, // 提示文案
    this.defaultText,
    this.leftButtonClick, // 返回按钮
    this.rightButtonClick, // 右边搜索按钮
    this.speakClick, // 语音按钮
    this.inputBoxClick, // 输入框按钮回调
    this.onChanged, // 监听输入值改变
    this.city,
    this.rightIcon: false,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // 是否显示清除按钮
  bool showClear = false;

  // 文本输入框TextField控制器
  final TextEditingController _controller = TextEditingController();

  // 默认值
  @override
  void initState() {
    // 要实现的效果是语音输入后，把文字带到搜索页的文本框上。所以就需要defaultText来设置默认的文字
    if (widget.defaultText != null) {
      _controller.text = widget.defaultText;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch(); // 首页
  }

  Widget _genNormalSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
                // 左边的返回按钮的样式
                // 如果widget为空则返回hideLeft，如果hideLeft为空则返回 false
                child: widget?.hideLeft ?? false
                    ? Container()
                    : Icon(
                        // 返回按钮图标
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                        size: 24,
                      ),
              ),
              widget.leftButtonClick),
          Expanded(
            flex: 1,
            child: _inputBox, // 中间显示输出框，能够自适应宽度所以这里用Expanded。然后flex设置为1
          ),
          _wrapTap(
              Container(
                // 最右边的搜索按钮
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  '搜索',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
              ),
              widget.rightButtonClick),
        ],
      ),
    );
  }

  // 首页输入框布局,
  Widget _genHomeSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapTap(
              Container(
                  padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
                  child: Row(
                    // 城市、颜色、向下图标s
                    children: <Widget>[
                      Text(
                        widget.city,
                        style: TextStyle(color: _homeFontColor, fontSize: 14),
                      ),
                      Icon(
                        Icons.expand_more, // 向下箭头符号
                        color: _homeFontColor,
                        size: 22,
                      )
                    ],
                  )),
              widget.leftButtonClick),
          Expanded(
            flex: 1,
            child: _inputBox, // 输入框
          ),
          _wrapTap(
              Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Icon(
                    Icons.comment, // 右边消息图标s
                    color: _homeFontColor,
                    size: 26,
                  )),
              widget.rightButtonClick), // 事件
        ],
      ),
    );
  }

  // 所以我们根据是否隐藏左边的按钮的属性来判断
  // 这里我们先提供一个方法。包裹我们的child和加点击事件
  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  // 输入框的实现
  // 包括底部的背景图，框的圆角。右边话筒图标。左边搜索图标。输入内容后最右边有个关闭按钮。
  Widget get _inputBox {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      // 首页
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse('0xffEDEDED'));
    }

    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: inputBoxColor,
        borderRadius: BorderRadius.circular(
          widget.searchBarType == SearchBarType.normal ? 5 : 10,
        ),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            // 搜索框
            'images/sousuo.png',
            width: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffa9a9a9)
                : Colors.blue,
          ),
          // 中间输入框部分，用Expand然后宽度自适应 Flex:1、按钮的事件是onChange方法
          Expanded(
            flex: 1,
            child: widget.searchBarType == SearchBarType.normal
                ? TextField(
                    // normal
                    controller: _controller,
                    onChanged: _onChanged,
                    autofocus: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    // 输入框文本的样式
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // 内容的边距
                      contentPadding:
                          // 获取平台
                          Theme.of(context).platform == TargetPlatform.iOS
                              ? EdgeInsets.fromLTRB(4, 0, 4, 12)
                              : EdgeInsets.fromLTRB(4, 0, 4, 12),
                      hintText: widget.hint ?? '',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
                // 如果是首页
                : _wrapTap(
                    Container(
                      child: Text(
                        widget.defaultText,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                    widget.inputBoxClick,
                  ),
          ),
          // 是否显示清除按钮 或者麦克风图标
          !showClear
              ? _wrapTap(
                  Icon(
                    Icons.mic,
                    size: 22,
                    color: widget.searchBarType == SearchBarType.normal
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  widget.speakClick)
              : _wrapTap(
                  Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.grey,
                  ),
                  () {
                    setState(() {
                      _controller.clear();
                    });
                    _onChanged('');
                  },
                )
        ],
      ),
    );
  }

  _onChanged(String text) {
    // 如果有值则显示，否则不显示
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }

    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  Color get _homeFontColor {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }
}
