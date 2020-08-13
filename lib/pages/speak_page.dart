import 'package:flutter/material.dart';
import 'package:flutter_trips/pages/search_page.dart';
import 'package:flutter_trips/plugin/asr_manager.dart';
import 'package:flutter_trips/util/navigator_util.dart';

class SpeakPage extends StatefulWidget {
  final String pageType;

  SpeakPage({Key key, this.pageType = 'Home'}) : super(key: key);

  @override
  _SpeakPageState createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  // 默认提示
  String speakTips = '长按说话';
  String speakResult = '';

  // 动画
  Animation<double> animation;
  AnimationController controller;
  // 是否是
  bool isVTop = true;
  // 是否有语言说话的结果、默认有结果
  bool isUnResult = true;
  // 是否开始
  bool isStart = false;

  @override
  void initState() {
    // 初始化控制器
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    // CurvedAnimation 曲线动画，动画插值
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInCubic)
      // 监听状态改变
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // 动画反向从尾到头执行，动画值逐渐变小的过程
          print('动画结束啦');
          controller.reset();
        } else if (status == AnimationStatus.dismissed) {
          // dismissed 一般动画结束值为 0.0 的时候调用。对应 reverse 操作
          // 开始动画操作，动画值逐渐变大的过程
          print('动画开始啦');
          controller.forward();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    // 移除
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            /*
            MainAxisAlignment（主轴）就是与当前控件方向一致的轴，而CrossAxisAlignment（交叉轴）就是与当前控件方向垂直的轴在水平方向控件中，例如Row 
            MainAxisAlignment是水平的，默认起始位置在左边，排列方向为从左至右，此时可以通过textDirection来改变MainAxisAlignment的起始位置和排列方向
            CrossAxisAlignment是垂直的，默认起始位置在中间，排列方向为从上至下，此时可以通过verticalDirection来改变CrossAxisAlignment的起始位置及排列方向
            在垂直方向的控件中，例如Column
            MainAxisAlignment是垂直的，默认起始位置在上边，排列方向为从上至下，此时可以通过verticalDirection来改变MainAxisAlignment的起始位置及排列方向
            CrossAxisAlignment是水平的，默认起始位置在中间，此时可以通过textDirection来改变CrossAxisAlignment的起始位置
             */
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // 如果 !isUnResult 为falese则返回_topTip 否则空
              isVTop
                  ? _topItem
                  : isStart
                      ? _startTip()
                      : !isUnResult ? _topTip() : Container(),
              // : Container(
              //     child: Center(
              //       child: Text('data'),
              //     ),
              //   ),
              _bottomItem(),
            ],
          ),
        ),
      ),
    );
  }

  _bottomItem() {
    return Stack(
      children: <Widget>[
        GestureDetector(
          // 手指按下
          onTapDown: (e) {
            _speakStart();
          },
          // 手指抬起
          onTapUp: (e) {
            _speakStop();
          },
          onTapCancel: () {
            _speakStop();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    speakTips,
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                  AnimatedWear(
                    animation: animation,
                    isStart: isStart,
                  ),
                ],
              ),
            ],
          ),
        ),
        // 绝对定位
        Positioned(
          child: GestureDetector(
            onTap: () {
              // 关闭,返回
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: 26,
              color: Colors.grey,
            ),
          ),
          right: 0,
          bottom: 26,
        ),
      ],
    );
  }

  // 录音开始
  void _speakStart() {
    // 动画开始
    controller.forward();
    // 改变文字状态
    setState(() {
      speakTips = '松开完成';
      isStart = true;
      isVTop = false;
    });

    // 百度录音SDK自己封装的类,需要原生集成sdk
    AsrManager.start().then((value) {
      print('value');
      print(value);
      // 校验返回的文字
      if (value.length > 0 && value != null) {
        // 赋值语音结果
        setState(() {
          speakResult = value;
        });

        // 语音位置末尾是否有,
        if (speakResult.endsWith(',')) {
          speakResult = speakResult.substring(0, speakResult.length - 1);
        }

        // 先返回在push结果
        Navigator.pop(context);
        // psuh
        switch (widget.pageType) {
          case 'home':
            NavigatorUtil.push(
                context,
                SearchPage(
                  keyword: speakResult,
                  hideLeft: false,
                ));
            break;
          default:
        }
      } else {
        // 没有也赋值占位符
        setState(() {
          isUnResult = false;
        });
      }
    }).catchError((onError) {
      setState(() {
        isUnResult = false;
      });
      print("----------" + onError.toString());
    });
  }

  // 录音结束
  void _speakStop() {
    setState(() {
      speakTips = '长按说话';
      isStart = false;
    });

    // 动画
    controller.reset();
    // 动画停止
    controller.stop();
    // 录音结束
    AsrManager.stop();
  }

  _startTip() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30),
          child: // 上面图片，底部两文字
              Image.network(
            'https://images3.c-ctrip.com/marketing/2015/07/coupon_new_h5/dlp_awk.png',
            width: 80,
            height: 80,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            '正在听您说...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withAlpha(180),
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  _topTip() {
    // 上下结构
    return Column(
      children: <Widget>[
        Container(
          child: Image.network(
            'https://pages.c-ctrip.com/you/livestream/lvpai_you_img2.png',
            width: 80,
            height: 80,
          ),
        ),
        Container(
          child: Text(
            '你好像没有说话',
            style: TextStyle(
              color: Colors.black.withAlpha(180),
              fontSize: 16,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            '请按住话筒重新开始',
            style: TextStyle(
              color: Colors.black.withAlpha(100),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

///圆球动画
class AnimatedWear extends AnimatedWidget {
  final bool isStart;
  // 一个是透明度改变的动画
  static final _opacityTween = Tween<double>(begin: 0.5, end: 0);
  // 第二个是大小尺寸的变化
  static final _sizeTween = Tween<double>(begin: 90, end: 260);

  AnimatedWear({Key key, this.isStart, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // 监听
    final Animation<double> animation = listenable;
    return Container(
      height: 90,
      width: 90,
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: <Widget>[
          // 外部大的灰色的 如果开始动画则显示灰色的，否则不显示
          isStart
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(30),
                    borderRadius: BorderRadius.circular(45),
                  ),
                )
              : Container(),
          // 蓝色⭕️
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Icon(
              Icons.mic,
              color: Colors.white,
              size: 30,
            ),
          ),
          // 绝对定位
          Positioned(
            // 保证⭕️
            left: -((_sizeTween.evaluate(animation) - 90) / 2), // 45
            right: -((_sizeTween.evaluate(animation) - 90) / 2), //45,
            // left: 40,
            // right: 40,
            // 设置子控件透明度
            child: Opacity(
              opacity: _opacityTween.evaluate(animation),
              child: Container(
                // 如果没有开始动画则宽度为0、就不显示
                width: isStart ? _sizeTween.evaluate(animation) : 0,
                height: isStart ? _sizeTween.evaluate(animation) : 0,
                // ⭕️扩散器
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius:
                      BorderRadius.circular(_sizeTween.evaluate(animation) / 2),
                  border: Border.all(
                    color: Color(0xa8000000),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 顶部item
Widget get _topItem {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: Text(
          '你可以这样说',
          style: TextStyle(color: Colors.black.withAlpha(180), fontSize: 16),
        ),
      ),
      _textItem('东方明珠'),
      _textItem('三亚自由行'),
      _textItem('迪士尼乐园'),
      _textItem('迪士尼乐园'),
    ],
  );
}

_textItem(String stex) {
  return Container(
    padding: EdgeInsets.only(bottom: 6),
    child: Text(
      stex,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        color: Colors.grey,
      ),
    ),
  );
}
