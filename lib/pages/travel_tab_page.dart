import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_trips/model/travel_model.dart';
import 'package:flutter_trips/severce/home_severce.dart';
import 'package:flutter_trips/util/navigator_util.dart';
import 'package:flutter_trips/widget/loading_container.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_trips/widget/webview.dart';

const _TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';

const PAGE_SIZE = 10;

class TravelTabPage extends StatefulWidget {
  // 接收别处传递过来的参数
  final String travelUrl;
  final Map params;
  final String groupChannelCode;

  // 构造函数
  const TravelTabPage(
      {Key key, this.travelUrl, this.params, this.groupChannelCode})
      : super(key: key);

  @override
  _TravelTabPageState createState() => _TravelTabPageState();
}

class _TravelTabPageState extends State<TravelTabPage>
    with AutomaticKeepAliveClientMixin {
  // 模型
  List<TravelItem> travelItems;

  ScrollController _scrollController = ScrollController();

  // 默认
  int pageIndex = 1;

  // 默认显示loading
  bool _loading = true;
  // 默认加载更多false
  bool _loadMore = false;

  @override
  void initState() {
    // 加载数据
    _loadData();

    // 监听往上滚动的最大值上拉加载更多
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData(loadMore: true);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 缓存页面
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        isLoading: _loading,
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(
            children: <Widget>[
              // 第三方组件,瀑布流
              Expanded(
                child: StaggeredGridView.countBuilder(
                  controller: _scrollController,
                  crossAxisCount: 4,
                  itemCount: travelItems?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) =>
                      new _TravelItem(
                    index: index,
                    item: travelItems[index],
                  ),
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                ),
              ),
              // 加载更多文字提示
              _loadMoreIndicator(_loadMore),
            ],
          ),
        ),
      ),
    );
  }

  // 下拉刷新
  Future<Null> _handleRefresh() async {
    // 加载数据
    _loadData();

    return null;
  }

  // 请求翻页数据
  void _loadData({loadMore = false}) {
    // 翻页入参设置
    if (loadMore) {
      // 是否加载更多的状态
      setState(() {
        _loadMore = true;
      });
      pageIndex++;
    } else {
      pageIndex = 1;
    }

    requestTravelMoreContenApiData(widget.travelUrl ?? _TRAVEL_URL,
            widget.params, widget.groupChannelCode, pageIndex, PAGE_SIZE)
        .then((model) {
      setState(() {
        // 过滤
        List<TravelItem> items = _filterItems(model.resultList);

        // 赋值
        if (travelItems != null) {
          // 上啦加载更多数据
          travelItems.addAll(items);
          _loadMore = false;
        } else {
          travelItems = items;
        }

        // 状态
        _loading = false;
      });

      // print('开始请求翻页效果啦');
      // print(value);
    }).catchError((onError) {
      _loading = false;
    });
  }

  // 数据过滤
  List<TravelItem> _filterItems(List<TravelItem> resultList) {
    // 校验
    if (resultList == null) return [];
    List<TravelItem> filterItems = [];

    resultList.forEach((element) {
      if (element.article != null) {
        // 移除article为空的模型
        filterItems.add(element);
      }
    });

    return filterItems;
  }

  // 加载更多文字提示
  Widget _loadMoreIndicator(bool loadMore) {
    Widget loadMoreIndicator = loadMore
        ? Padding(
            padding: EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 24,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  '加载中...',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )
        : Container();

    return loadMoreIndicator;
  }
}

// 每个item类
class _TravelItem extends StatelessWidget {
  // 接收参数
  final TravelItem item;
  final int index;

  const _TravelItem({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 判断
        if (item.article.urls != null && item.article.urls.length > 0) {
          NavigatorUtil.push(
              context,
              WebView(
                url: item.article.urls[0].h5Url,
                title: '旅行拍摄呀',
              ));
        }
      },
      child: Card(
        // 设置圆角
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _itemImage(context),
              // 标题
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  item.article.articleTitle ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ),
              // 详细介绍
              _infoText(),
            ],
          ),
        ),
      ),
    );
  }

  // 网络图片
  _itemImage(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(item.article.images[0]?.dynamicUrl),
        Positioned(
          bottom: 8,
          left: 8,
          // 图片上面的地图图标以及文字信息
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
            // 装饰器
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                // 图标
                Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: Icon(
                    Icons.location_on,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
                // 是限制类型的控件。这种类型的控件前面也介绍了不少了，这个是对最大宽高进行限制的控件
                LimitedBox(
                  maxWidth: MediaQuery.of(context).size.width / 2 - 66,
                  child: Text(
                    _poiName(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // 省略号
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _poiName() {
    return item.article.pois == null || item.article.pois.length == 0
        ? '未知'
        : item.article.pois[0]?.poiName ?? '未知';
  }

  // 详情
  _infoText() {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 0, 6, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 头像圆角 、昵称
          Row(
            children: <Widget>[
              PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.article.author?.coverImage?.dynamicUrl,
                  width: 24,
                  height: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 80,
                child: Text(
                  item.article.author?.nickName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          // 喜欢点赞👍、数量
          Row(
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                size: 14,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(
                  item.article.likeCount.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
