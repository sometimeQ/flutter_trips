import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const CATCH_URLS = [
  'm.ctrip.com/',
  'm.ctrip.com/html5/',
  'm.ctrip.com/html5',
  'm.ctrip.com/html5/you/',
  'm.ctrip.com/webapp/you/foods/',
  'm.ctrip.com/webapp/vacations/tour/list'
];

class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;
  final bool hideHead;

  WebView(
      {this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid = false,
      this.hideHead = false});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  // 初始化
  final webViewReference = FlutterWebviewPlugin();

  // 监听流初始化
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  bool exiting = false;

  @override
  void initState() {
    webViewReference.close();
    // 监听
    _onUrlChanged = webViewReference.onUrlChanged.listen((String url) {});
    // 状态回调
    _onStateChanged =
        webViewReference.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          // 在白名单且false
          if (_isToMain(state.url) && !exiting) {
            if (widget.backForbid) {
              // 禁止返回
              webViewReference.launch(widget.url);
            } else {
              // 返回首页
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;

        default:
          break;
      }
    });

    // 出错的情况下
    _onHttpError =
        webViewReference.onHttpError.listen((WebViewHttpError error) {});
    super.initState();
  }

  // 白名单
  _isToMain(String url) {
    bool contain = false;
    for (final value in CATCH_URLS) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  // 销毁
  @override
  void dispose() {
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webViewReference.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 状态栏
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    // 系统状态样式
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Column(
          children: <Widget>[
            _appBar(
                Color(int.parse('0xff' + statusBarColorStr)), backButtonColor),
            // 撑满
            Expanded(
              //  webview
              child: WebviewScaffold(
                url: widget.url,
                withZoom: true,
                withLocalStorage: true,
                hidden: true,
                initialChild: Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar ?? false) {
      return widget.hideHead
          ? Container()
          : Container(
              color: backgroundColor,
              height: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 29,
              width: double.infinity,
            );
    }

    return Container(
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(0, 38, 0, 10),
      // 布局
      child: FractionallySizedBox(
        widthFactor: 1,
        // 悬浮
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // 返回
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                  size: 24,
                ),
              ),
            ),
            // 绝对定位
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title ?? '',
                  style: TextStyle(color: backButtonColor, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
