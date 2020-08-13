class HomeModel {
  Config config;
  List<SearchPlaceHolderList> searchPlaceHolderList;
  List<BannerList> bannerList;
  List<LocalNavList> localNavList;
  GridNav gridNav;
  List<SubNavList> subNavList;
  SalesBox salesBox;

  HomeModel(
      {this.config,
      this.searchPlaceHolderList,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  HomeModel.fromJson(Map<String, dynamic> json) {
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
    if (json['searchPlaceHolderList'] != null) {
      searchPlaceHolderList = new List<SearchPlaceHolderList>();
      json['searchPlaceHolderList'].forEach((v) {
        searchPlaceHolderList.add(new SearchPlaceHolderList.fromJson(v));
      });
    }
    if (json['bannerList'] != null) {
      bannerList = new List<BannerList>();
      json['bannerList'].forEach((v) {
        bannerList.add(new BannerList.fromJson(v));
      });
    }
    if (json['localNavList'] != null) {
      localNavList = new List<LocalNavList>();
      json['localNavList'].forEach((v) {
        localNavList.add(new LocalNavList.fromJson(v));
      });
    }
    gridNav =
        json['gridNav'] != null ? new GridNav.fromJson(json['gridNav']) : null;
    if (json['subNavList'] != null) {
      subNavList = new List<SubNavList>();
      json['subNavList'].forEach((v) {
        subNavList.add(new SubNavList.fromJson(v));
      });
    }
    salesBox = json['salesBox'] != null
        ? new SalesBox.fromJson(json['salesBox'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    if (this.searchPlaceHolderList != null) {
      data['searchPlaceHolderList'] =
          this.searchPlaceHolderList.map((v) => v.toJson()).toList();
    }
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    if (this.localNavList != null) {
      data['localNavList'] = this.localNavList.map((v) => v.toJson()).toList();
    }
    if (this.gridNav != null) {
      data['gridNav'] = this.gridNav.toJson();
    }
    if (this.subNavList != null) {
      data['subNavList'] = this.subNavList.map((v) => v.toJson()).toList();
    }
    if (this.salesBox != null) {
      data['salesBox'] = this.salesBox.toJson();
    }
    return data;
  }
}

class Config {
  String searchUrl;

  Config({this.searchUrl});

  Config.fromJson(Map<String, dynamic> json) {
    searchUrl = json['searchUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchUrl'] = this.searchUrl;
    return data;
  }
}

class SearchPlaceHolderList {
  String text;

  SearchPlaceHolderList({this.text});

  SearchPlaceHolderList.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class BannerList {
  String icon;
  String sIcon;
  String url;

  BannerList({this.icon, this.sIcon, this.url});

  BannerList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    sIcon = json['sIcon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['sIcon'] = this.sIcon;
    data['url'] = this.url;
    return data;
  }
}

class LocalNavList {
  String icon;
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  LocalNavList(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  LocalNavList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class GridNav {
  Hotel hotel;
  Hotel flight;
  Hotel travel;

  GridNav({this.hotel, this.flight, this.travel});

  GridNav.fromJson(Map<String, dynamic> json) {
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
    flight = json['flight'] != null ? new Hotel.fromJson(json['flight']) : null;
    travel = json['travel'] != null ? new Hotel.fromJson(json['travel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }
    if (this.flight != null) {
      data['flight'] = this.flight.toJson();
    }
    if (this.travel != null) {
      data['travel'] = this.travel.toJson();
    }
    return data;
  }
}

class Hotel {
  String startColor;
  String endColor;
  LocalNavList mainItem;
  Item3 item1;
  Item1 item2;
  Item3 item3;
  Item3 item4;

  Hotel(
      {this.startColor,
      this.endColor,
      this.mainItem,
      this.item1,
      this.item2,
      this.item3,
      this.item4});

  Hotel.fromJson(Map<String, dynamic> json) {
    startColor = json['startColor'];
    endColor = json['endColor'];
    mainItem = json['mainItem'] != null
        ? new LocalNavList.fromJson(json['mainItem'])
        : null;
    item1 = json['item1'] != null ? new Item3.fromJson(json['item1']) : null;
    item2 = json['item2'] != null ? new Item1.fromJson(json['item2']) : null;
    item3 = json['item3'] != null ? new Item3.fromJson(json['item3']) : null;
    item4 = json['item4'] != null ? new Item3.fromJson(json['item4']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startColor'] = this.startColor;
    data['endColor'] = this.endColor;
    if (this.mainItem != null) {
      data['mainItem'] = this.mainItem.toJson();
    }
    if (this.item1 != null) {
      data['item1'] = this.item1.toJson();
    }
    if (this.item2 != null) {
      data['item2'] = this.item2.toJson();
    }
    if (this.item3 != null) {
      data['item3'] = this.item3.toJson();
    }
    if (this.item4 != null) {
      data['item4'] = this.item4.toJson();
    }
    return data;
  }
}

class MainItem {
  String title;
  String icon;
  String url;
  String statusBarColor;

  MainItem({this.title, this.icon, this.url, this.statusBarColor});

  MainItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    return data;
  }
}

class Item1 {
  String title;
  String url;
  String statusBarColor;

  Item1({this.title, this.url, this.statusBarColor});

  Item1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    return data;
  }
}

class Item2 {
  String title;
  String url;

  Item2({this.title, this.url});

  Item2.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class Item3 {
  String title;
  String url;
  bool hideAppBar;

  Item3({this.title, this.url, this.hideAppBar});

  Item3.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class MainItemx {
  String title;
  String icon;
  String url;

  MainItemx({this.title, this.icon, this.url});

  MainItemx.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['url'] = this.url;
    return data;
  }
}

class Item1x {
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  Item1x({this.title, this.url, this.statusBarColor, this.hideAppBar});

  Item1x.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class SubNavList {
  String icon;
  String title;
  String url;
  bool hideAppBar;

  SubNavList({this.icon, this.title, this.url, this.hideAppBar});

  SubNavList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class SalesBox {
  String icon;
  String moreUrl;
  BigCard1 bigCard1;
  MainItem bigCard2;
  BigCard1 smallCard1;
  BigCard1 smallCard2;
  MainItem smallCard3;
  BigCard1 smallCard4;

  SalesBox(
      {this.icon,
      this.moreUrl,
      this.bigCard1,
      this.bigCard2,
      this.smallCard1,
      this.smallCard2,
      this.smallCard3,
      this.smallCard4});

  SalesBox.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    moreUrl = json['moreUrl'];
    bigCard1 = json['bigCard1'] != null
        ? new BigCard1.fromJson(json['bigCard1'])
        : null;
    bigCard2 = json['bigCard2'] != null
        ? new MainItem.fromJson(json['bigCard2'])
        : null;
    smallCard1 = json['smallCard1'] != null
        ? new BigCard1.fromJson(json['smallCard1'])
        : null;
    smallCard2 = json['smallCard2'] != null
        ? new BigCard1.fromJson(json['smallCard2'])
        : null;
    smallCard3 = json['smallCard3'] != null
        ? new MainItem.fromJson(json['smallCard3'])
        : null;
    smallCard4 = json['smallCard4'] != null
        ? new BigCard1.fromJson(json['smallCard4'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;
    if (this.bigCard1 != null) {
      data['bigCard1'] = this.bigCard1.toJson();
    }
    if (this.bigCard2 != null) {
      data['bigCard2'] = this.bigCard2.toJson();
    }
    if (this.smallCard1 != null) {
      data['smallCard1'] = this.smallCard1.toJson();
    }
    if (this.smallCard2 != null) {
      data['smallCard2'] = this.smallCard2.toJson();
    }
    if (this.smallCard3 != null) {
      data['smallCard3'] = this.smallCard3.toJson();
    }
    if (this.smallCard4 != null) {
      data['smallCard4'] = this.smallCard4.toJson();
    }
    return data;
  }
}

class BigCard1 {
  String icon;
  String url;
  bool hideAppBar;

  BigCard1({this.icon, this.url, this.hideAppBar});

  BigCard1.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

/*
{
  "config": {
    "searchUrl": "https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword="
  },
  "searchPlaceHolderList": [
    {
      "text": "超值星期三"
    },
    {
      "text": "攻略·景点·酒店"
    },
    {
      "text": "缤纷6月，门票低至5折起！"
    },
    {
      "text": "欢乐谷"
    },
    {
      "text": "餐馆·游记"
    },
    {
      "text": "出游福利计划"
    }
  ],
  "bannerList": [
    {
      "icon": "https://dimg04.c-ctrip.com/images/zg041h000001hoqla603F.jpg",
      "sIcon": "https://cdn.lishaoy.net/ctrip/banner1.jpg",
      "url": "https://m.ctrip.com/webapp/you/gspoi/sight/0/5356386.html?seo=0"
    },
    {
      "icon": "https://dimg04.c-ctrip.com/images/zg0l1g000001hg8q2E0D1.jpg",
      "sIcon": "https://cdn.lishaoy.net/ctrip/banner2.jpg",
      "url": "https://m.ctrip.com/tangram/NjQ2MQ==?ctm_ref=vactang_page_6461&isHideNavBar=YES"
    },
    {
      "icon": "https://dimg04.c-ctrip.com/images/zg0i1g000001h9oh9009F.jpg",
      "sIcon": "https://cdn.lishaoy.net/ctrip/banner3.jpg",
      "url": "https://contents.ctrip.com/activitysetupapp/mkt/index/clwyky?ctm_ref=vdc_ctm_3642"
    },
    {
      "icon": "https://dimg04.c-ctrip.com/images/zg0a1h000001hr5gy3D2D.jpg",
      "sIcon": "https://cdn.lishaoy.net/ctrip/banner4.jpg",
      "url": "https://m.ctrip.com/tangram/NjM0Ng==?ctm_ref=vactang_page_6346&isHideNavBar=YES"
    },
    {
      "icon": "https://dimg04.c-ctrip.com/images/zg0p1h000001hlzdt606F.jpg",
      "sIcon": "https://cdn.lishaoy.net/ctrip/banner5.jpg",
      "url": "https://m.ctrip.com/webapp/you/gspoi/sight/0/50102.html?seo=0"
    },
    {
      "icon": "https://dimg04.c-ctrip.com/images/zg0c1h000001hrqn4997E.jpg",
      "sIcon": "https://cdn.lishaoy.net/ctrip/banner6.jpg",
      "url": "https://m.ctrip.com/tangram/NjU3Ng==?ctm_ref=vactang_page_6576&isHideNavBar=YES"
    }
  ],
  "localNavList": [
    {
      "icon": "https://cdn.lishaoy.net/ctrip/lbsguide.png",
      "title": "攻略·景点",
      "url": "https://m.ctrip.com/webapp/you/place/2.html?ishideheader=true&secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "statusBarColor": "ffffff",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/piao.png",
      "title": "门票·玩乐",
      "url": "https://dp.ctrip.com/webapp/ticket/tickethttps://m.ctrip.com/webapp/ticket/ticket?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "statusBarColor": "ffffff",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/food.png",
      "title": "美食林",
      "url": "https://m.ctrip.com/webapp/you/foods/address.html?new=1&ishideheader=true&secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "statusBarColor": "ffffff",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/around.png",
      "title": "周边游",
      "url": "https://m.ctrip.com/webapp/vacations/tour/around?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "statusBarColor": "ffffff",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/onedaytravel.png",
      "title": "一日游",
      "url": "https://m.ctrip.com/webapp/activity/daytour?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "statusBarColor": "ffffff",
      "hideAppBar": true
    }
  ],
  "gridNav": {
    "hotel": {
      "startColor": "fa5956",
      "endColor": "fa9b4d",
      "mainItem": {
        "title": "酒店",
        "icon": "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel.png",
        "url": "https://m.ctrip.com/webapp/hotel/",
        "statusBarColor": "4289ff"
      },
      "item1": {
        "title": "酒店",
        "url": "https://m.ctrip.com/webapp/hotel/?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "statusBarColor": "4289ff"
      },
      "item2": {
        "title": "民宿·客栈",
        "url": "https://m.ctrip.com/webapp/inn-v2/home?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
      },
      "item3": {
        "title": "特价·爆款",
        "url": "https://m.ctrip.com/webapp/cw/hotel/instoreflagship/productHome.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "hideAppBar": true
      },
      "item4": {
        "title": "民宿 客栈",
        "url": "https://m.ctrip.com/webapp/inn/index",
        "hideAppBar": true
      }
    },
    "flight": {
      "startColor": "4b8fed",
      "endColor": "53bced",
      "mainItem": {
        "title": "机票",
        "icon": "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-flight.png",
        "url": "https://m.ctrip.com/html5/flight/swift/index"
      },
      "item1": {
        "title": "机票",
        "url": "https://m.ctrip.com/html5/flight/swift/index?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "hideAppBar": true
      },
      "item2": {
        "title": "火车票",
        "url": "https://m.ctrip.com/webapp/train/?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=35f3baea"
      },
      "item3": {
        "title": "汽车·船票",
        "url": "https://m.ctrip.com/webapp/bus/?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "hideAppBar": true
      },
      "item4": {
        "title": "专车·租车",
        "url": "https://m.ctrip.com/webapp/car/index?s=ctrip&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "hideAppBar": true
      }
    },
    "travel": {
      "startColor": "34c2aa",
      "endColor": "6cd557",
      "mainItem": {
        "title": "旅游",
        "icon": "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-travel.png",
        "url": "https://m.ctrip.com/webapp/vacations/tour/vacations",
        "hideAppBar": true,
        "statusBarColor": "19A0F0"
      },
      "item1": {
        "title": "旅游",
        "url": "https://m.ctrip.com/webapp/vacations/tour/vacations?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "statusBarColor": "19A0F0",
        "hideAppBar": true
      },
      "item2": {
        "title": "高铁游",
        "url": "https://m.ctrip.com/webapp/train/crh/plan/crhList.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "statusBarColor": "19A0F0",
        "hideAppBar": true
      },
      "item3": {
        "title": "邮轮游",
        "url": "https://m.ctrip.com/webapp/cruise/index?ctm_ref=C_vac_cruise&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "hideAppBar": true
      },
      "item4": {
        "title": "定制游",
        "url": "https://m.ctrip.com/webapp/dingzhi/index?ctm_ref=C_vac_custom&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "hideAppBar": true
      }
    }
  },
  "subNavList": [
    {
      "icon": "https://cdn.lishaoy.net/ctrip/freetravel.png",
      "title": "自由行",
      "url": "https://m.ctrip.com/tangram/MjczNQ==?ctm_ref=vactang_page_2735&navBarStyle=white&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/wifi.png",
      "title": "WiFi电话卡",
      "url": "https://m.ctrip.com/webapp/activity/wifi?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/visa.png",
      "title": "保险·签证",
      "url": "https://m.ctrip.com/visa/extend/entry?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/globalshop.png",
      "title": "换钞·购物",
      "url": "https://m.ctrip.com/webapp/fshome/crnweb/home.html?bid=2&cid=3&pid=3&ctm_ref=M_ps_1home_gg_mh&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/hpgsguild.png",
      "title": "当地向导",
      "url": "https://m.ctrip.com/webapp/vacations/pguider/homepage?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/flight.png",
      "title": "特价机票",
      "url": "https://m.ctrip.com/webapp/flightactivity/muse/index.html?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https://m.ctrip.com/html5/&dCityCode=SHA&dCityName=%E4%B8%8A%E6%B5%B7&dCityType=1",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/card.png",
      "title": "礼品卡",
      "url": "https://m.ctrip.com/webapp/lipin/money?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/creditCard.png",
      "title": "申卡·借钱",
      "url": "https://jr.ctrip.com/m/finweb/page/financeCenter?from=financeCenter&clientSource=CTRIP",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/yiriyou1.png",
      "title": "境外玩乐",
      "url": "https://dp.ctrip.com/webapp/activity/overseasindex",
      "hideAppBar": true
    },
    {
      "icon": "https://cdn.lishaoy.net/ctrip/more.png",
      "title": "更多",
      "url": "https://m.ctrip.com/webapp/more/?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      "hideAppBar": true
    }
  ],
  "salesBox": {
    "icon": "https://www.devio.org/io/flutter_app/img/sales_box_huodong.png",
    "moreUrl": "https://contents.ctrip.com/activitysetupapp/mkt/index/moreact?popup=close&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F&secondwakeup=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
    "bigCard1": {
      "icon": "https://cdn.lishaoy.net/ctrip/yyfl.jpg",
      "url": "https://m.ctrip.com/webapp/membercenter/medical?pushcode=sy_rm1020",
      "hideAppBar": true
    },
    "bigCard2": {
      "icon": "https://cdn.lishaoy.net/ctrip/bydlb.jpg",
      "url": "https://contents.ctrip.com/activitysetupapp/mkt/index/2020qyhbmfl?popup=close&pushcode=nn2025",
      "title": "活动"
    },
    "smallCard1": {
      "icon": "https://cdn.lishaoy.net/ctrip/lxypth.png",
      "url": "https://m.ctrip.com/webapp/mall/index",
      "hideAppBar": true
    },
    "smallCard2": {
      "icon": "https://cdn.lishaoy.net/ctrip/yqzx.jpg",
      "url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
      "hideAppBar": true
    },
    "smallCard3": {
      "icon": "https://cdn.lishaoy.net/ctrip/yqbzzc.jpg",
      "url": "https://contents.ctrip.com/activitysetupapp/mkt/index/end",
      "title": "活动"
    },
    "smallCard4": {
      "icon": "https://cdn.lishaoy.net/ctrip/jxtjmp.jpg",
      "url": "https://m.ctrip.com/webapp/ticket/index",
      "hideAppBar": true
    }
  }
}
*/
