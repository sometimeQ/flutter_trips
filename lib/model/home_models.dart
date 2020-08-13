import 'config_model.dart';
import 'common_model.dart';
import 'localNav_model.dart';
import 'sales_box_modle.dart';
import 'searchPlace_model.dart';
import 'grid_nav_model.dart';
import '../model/sales_box_modle.dart';

class HomeTatolModel {
  final ConfigModel config;
  final List<SearchPalceModle> searchPlaceHolderList;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;

  HomeTatolModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.subNavList,
      this.searchPlaceHolderList,
      this.gridNav,
      this.salesBox});

  // 工厂方法
  factory HomeTatolModel.fromJson(Map<String, dynamic> json) {
    // 先转换List，在转换成对象
    var localNavLists = json['localNavList'] as List;
    List<CommonModel> localNavList =
        localNavLists.map((e) => CommonModel.fromJson(e)).toList();

    // var
    var bannerArray = json['bannerList'] as List;
    List<CommonModel> bannerList =
        bannerArray.map((e) => CommonModel.fromJson(e)).toList();

    // v
    var subNavArray = json['subNavList'] as List;
    List<CommonModel> subNavList =
        subNavArray.map((e) => CommonModel.fromJson(e)).toList();

    //
    var searchPlaceHolderArray = json['searchPlaceHolderList'] as List;
    List<SearchPalceModle> searchPlaceHolderList = searchPlaceHolderArray
        .map((e) => SearchPalceModle.fromJson(e))
        .toList();

    return HomeTatolModel(
      config: ConfigModel.fromJson(json['config']),
      searchPlaceHolderList: searchPlaceHolderList,
      bannerList: bannerList,
      localNavList: localNavList,
      subNavList: subNavList,
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }

  // 对象序列化
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
  }
}
