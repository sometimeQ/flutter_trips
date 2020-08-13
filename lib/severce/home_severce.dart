import 'dart:async';
import 'dart:convert'; // 解码(JSON String->Object)
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_trips/model/travel_model.dart';
import 'package:flutter_trips/model/travel_params_model.dart';
import 'package:flutter_trips/model/travel_tab_model.dart';
import '../model/home_model.dart';
import '../model/seach_model.dart';
import 'package:http/http.dart' as http;

const HOME_URL = 'https://cdn.lishaoy.net/ctrip/homeConfig.json';
const SEARCH_URL =
    'http://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=';

Future<HomeModel> requestHomeData() async {
  try {
    // Dio().options.responseType = ResponseType.plain;
    Response response = await Dio().get(HOME_URL);
    if (response.statusCode == 200) {
      // String jsonsDataString = response.toString();
      // var result = jsonDecode(jsonsDataString);
      var result = json.decode(response.toString());
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (erro) {
    print('首页数据====>>>> $erro');
  }
}

Future requestHomeApiData() async {
  try {
    Response response = await Dio().get(HOME_URL);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (erro) {
    print('首页数据====>>>> $erro');
  }
}

Future requestSearchKeywordApiData(String keyword) async {
  try {
    Response response = await Dio().get(SEARCH_URL + keyword);
    if (response.statusCode == 200) {
      // var reslut = json.decode(response.data);

      // 只有当输入的内容与服务端返回的内容一致时才渲染
      SearchModel model = SearchModel.fromJson(response.data);
      model.keyword = keyword;

      return model;
    } else {
      throw Exception('搜搜接口服务器异常');
    }
  } catch (e) {
    print('请求搜索接口======>  $e');
  }
}

/// 目的地入参
var Params = {
  "contentType": "json",
  "head": {
    "cid": "09031043410934928682",
    "ctok": "",
    "cver": "1.0",
    "lang": "01",
    "sid": "8888",
    "syscode": "09",
    "auth": "",
    "extension": []
  },
  "channel": "H5",
  "businessUnit": 14,
  "startCity": 2
};

// 目的地接口post 1
Future requestDestionApiData() async {
  try {
    final response = await http.post(
        'https://sec-m.ctrip.com/restapi/soa2/14422/navigationInfo?_fxpcqlniredt=09031043410934928682',
        body: jsonEncode(Params));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return result;
    } else {
      throw Exception('目的地接口服务器异常');
    }
  } catch (erro) {
    print('请求目的地接口======>  $erro');
  }
}

// 目的地接口post // 目的地接口post 2
Future requestDestionsApiData() async {
  Response response = await Dio().post(
      'https://sec-m.ctrip.com/restapi/soa2/14422/navigationInfo?_fxpcqlniredt=09031043410934928682',
      data: Params);

  return response.data;
}

// 旅拍顶部类别接口
Future requestTravelTabApiData() async {
  try {
    Response response = await Dio()
        .get('http://www.devio.org/io/flutter_app/json/travel_page.json');
    if (response.statusCode == 200) {
      TravelParamsModel model = TravelParamsModel.fromJson(response.data);
      return model;
    } else {
      throw Exception('旅拍类别接口服务器异常');
    }
  } catch (error) {
    print('旅拍类别接口接口======>  $error');
  }
}

// 旅怕底部内容接口
Future requestTravelTabContenApiData() async {
  try {
    Response response = await Dio().get(
        'https://m.ctrip.com/restapi/soa2/15612/json/getTripShootHomePage');
    if (response.statusCode == 200) {
      TravelTabModel model = TravelTabModel.fromJson(response.data);
      return model;
    } else {
      throw Exception('旅拍内容接口服务器异常');
    }
  } catch (erro) {
    print('旅拍内容接口======>  $erro');
  }
}

var moreData = {
  "districtId": -1,
  "groupChannelCode": "RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {'cid': "09031014111431397988"},
  "contentType": "json"
};

// 旅拍翻页接口数据
Future requestTravelMoreContenApiData(String url, Map params,
    String groupChannelCode, int pageIndex, int pageSize) async {
  Map paramsMap = params['pagePara'];
  paramsMap['pageIndex'] = pageIndex;
  paramsMap['groupChannelCode'] = groupChannelCode;
  params['pageSize'] = pageSize;

  try {
    Response response = await Dio().post(url, data: params);
    if (response.statusCode == 200) {
      // var reslut = response.data;
      // print('看看返回的什么数据 =====> $reslut');
      TravelItemModel model = TravelItemModel.fromJson(response.data);
      return model;
    } else {
      throw Exception('翻页效果异常');
    }
  } catch (erro) {
    print('旅拍翻页接口数据 ======>  $erro');
  }
}
