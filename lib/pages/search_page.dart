import 'package:flutter/material.dart';
import 'package:flutter_trips/model/seach_model.dart';
import 'package:flutter_trips/widget/search_bar.dart';
import 'package:flutter_trips/widget/webview.dart';
import '../model/seach_model.dart';
import '../severce/home_severce.dart';

const URL =
    'http://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=';

const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

// 图标
const TYPES = [
  'channelgroup',
  'gs',
  'plane',
  'train',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];

class SearchPage extends StatefulWidget {
  // 声明数据
  final bool hideLeft; // 隐藏左边的返回按钮
  final String searchUrl;
  final String keyword; // 关键字
  final String hint; // 默认文字

  const SearchPage(
      {Key key, this.hideLeft, this.searchUrl, this.keyword, this.hint})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // 模型数据
  SearchModel searchModel;
  // 关键字
  String keyword;

  @override
  void initState() {
    // 语音识别完毕之后,跳转回来默认执行搜索接口 + 关键字 \ 不为空，则可以搜索，否则报错
    if (widget.keyword != null) {
      _onTextChange(widget.keyword);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar,
          Container(
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                // 如果searchModel 不为null 则searchModel?.data? 为null 否则返回0
                itemCount: searchModel?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return _items(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 数据item
  _items(index) {
    // 校验数据
    if (searchModel == null && searchModel.data == null) return null;
    SearchItem item = searchModel.data[index];
    // print(item);

    return GestureDetector(
      onTap: () {
        // print('点击啦');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              url: item.url,
              title: "详情",
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10), // 内边距属性
        decoration: BoxDecoration(
          // 下划线
          border: Border(
            bottom: BorderSide(width: 0.3, color: Colors.grey),
          ),
        ),
        child: Row(
          /*
          如果使用布局方式为Row，则mainAxisAlignment方向为row方向，即横向，crossAxisAlignment 轴方向为纵向。
          如布局使用Colum, 则mainAxisAlignment方向为column方向，即纵向，crossAxisAlignment 轴方向为横向。
          总之，mainAxisAlignment 为主轴方向，crossAxisAlignment为交叉轴方向  
          */
          crossAxisAlignment:
              CrossAxisAlignment.start, // start : 将children放置在主轴的起点；
          children: <Widget>[
            // 前面的图标
            Container(
              margin: EdgeInsets.all(1), // 外边距
              child: Image(
                height: 26,
                width: 26,
                image: AssetImage(_typeImage(item.type)),
              ),
            ),
            Column(
              children: <Widget>[
                // 标题
                Container(
                  width: 300,
                  child: _title(item),
                ),
                // 富标题
                item.price != null
                    ? Container(
                        width: 300,
                        margin: EdgeInsets.only(top: 5),
                        child: _subTitle(item),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 搜索标题
  _title(SearchItem item) {
    if (item == null) return null;
    // 富文本 关键字高亮
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(item.word, searchModel.keyword));
    // 区域、地区
    spans.add(
      TextSpan(
        text: ' ' + (item.districtname ?? '') + ' ' + (item.zonename ?? ''),
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
    // 返回富文本包裹textSpan
    return RichText(text: TextSpan(children: spans));
  }

  // 关键字、以及显示的字 word
  // keyword 关键字高亮处理
  // 示列程序 word == 南京勿忘我宾馆;   keyword == 我;
  _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;
    // 搜索关键字高亮忽略大小写
    String aWord = word.toLowerCase();
    String aKeyword = keyword.toLowerCase();
    // 以输入的关键字分割 ==> 最终得到的结果是一个数组 示列  搜我分割后 [南京勿忘, 宾馆]
    List<String> reslutArray = aWord.split(aKeyword);
    // 显示的模式
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = TextStyle(fontSize: 16, color: Colors.orange);

    // 示列 搜索 哈哈
    // 南京邵 哈哈 公寓
    // prefIndex = 3 ; keyword.length = 2; prefIndex + keyword.length = 5;  word.substring(prefIndex, prefIndex + keyword.length) = 哈哈

    // 遍历索引
    int prefIndex = 0;
    for (var i = 0; i < reslutArray.length; i++) {
      // 排除第0个元素 ,   示例： [, 尼陶瓷手工创意坊]
      if (i != 0) {
        // 某个字符串的下标 第一个匹配元素的下标
        // 获取起始位置
        // prefIndex = aWord.indexOf(aKeyword, prefIndex);
        // print(prefIndex);
        // print(keyword.length);
        // print(prefIndex + keyword.length);
        // print(word.substring(prefIndex, prefIndex + keyword.length));
        // print('prefIndex');
        spans.add(TextSpan(
          // substring(startIndex,endIndex)截取一段字符串
          text: word.substring(prefIndex, prefIndex + keyword.length),
          style: keywordStyle,
        ));
      }

      // 默认的每一个值
      String value = reslutArray[i];
      if (value != null && value.length > 0) {
        spans.add(
          TextSpan(text: value, style: normalStyle),
        );
      }
    }

    return spans;
  }

  // 导航栏
  Widget get _appBar {
    // 上下
    return Column(
      children: <Widget>[
        Container(
          // 边框装饰器
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // 渐变色
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            height: 80,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            // 搜索栏
            child: SearchBar(
              hideLeft: widget.hideLeft,
              defaultText: widget.keyword,
              hint: widget.hint ?? SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
              speakClick: _jumpToSpeak,
            ),
          ),
        ),
      ],
    );
  }

  // 输入框文本更改 请求接口
  void _onTextChange(String text) async {
    // 关键字赋值
    keyword = text;
    if (text.length == 0) {
      setState(() {
        searchModel = null;
      });
      return;
    }

    // 请求数据
    requestSearchKeywordApiData(keyword).then((value) => {
          // 只有当当前输入的内容和服务端返回的内容一致时才渲染
          print(value),
          if (value.keyword == keyword)
            {
              setState(() {
                searchModel = value;
              }),
            }
        });
  }

  _jumpToSpeak() {}

  Widget _subTitle(SearchItem item) {
    if (item == null) return null;
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: item.price ?? '',
            style: TextStyle(color: Colors.orange, fontSize: 16),
          ),
          TextSpan(
            text: ' ' + (item.star ?? ''),
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  String _typeImage(String type) {
    if (type == null) return 'images/type_travelgroup.png';
    String path = 'travelgroup';
    for (var item in TYPES) {
      if (type.contains(item)) {
        path = item;
        break;
      }
    }
    return 'images/type_$path.png';
  }
}
