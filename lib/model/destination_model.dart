class DestinationModel {
  List<NavigationPopList> navigationPopList;

  DestinationModel({this.navigationPopList});

  DestinationModel.fromJson(Map<String, dynamic> json) {
    if (json['navigationPopList'] != null) {
      navigationPopList = new List<NavigationPopList>();
      json['navigationPopList'].forEach((v) {
        navigationPopList.add(new NavigationPopList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.navigationPopList != null) {
      data['navigationPopList'] =
          this.navigationPopList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NavigationPopList {
  int category;
  String categoryName;
  List<DestAreaList> destAreaList;

  NavigationPopList({this.category, this.categoryName, this.destAreaList});

  NavigationPopList.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryName = json['categoryName'];
    if (json['destAreaList'] != null) {
      destAreaList = new List<DestAreaList>();
      json['destAreaList'].forEach((v) {
        destAreaList.add(new DestAreaList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['categoryName'] = this.categoryName;
    if (this.destAreaList != null) {
      data['destAreaList'] = this.destAreaList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DestAreaList {
  int id;
  String text;
  List<Child> child;

  DestAreaList({this.id, this.text, this.child});

  DestAreaList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    if (json['child'] != null) {
      child = new List<Child>();
      json['child'].forEach((v) {
        child.add(new Child.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    if (this.child != null) {
      data['child'] = this.child.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Child {
  int id;
  String text;
  String picUrl;
  String kwd;
  List<TagList> tagList;
  String poiType;

  Child(
      {this.id, this.text, this.picUrl, this.kwd, this.tagList, this.poiType});

  Child.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    picUrl = json['picUrl'];
    kwd = json['kwd'];
    if (json['tagList'] != null) {
      tagList = new List<TagList>();
      json['tagList'].forEach((v) {
        tagList.add(new TagList.fromJson(v));
      });
    }
    poiType = json['poiType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['picUrl'] = this.picUrl;
    data['kwd'] = this.kwd;
    if (this.tagList != null) {
      data['tagList'] = this.tagList.map((v) => v.toJson()).toList();
    }
    data['poiType'] = this.poiType;
    return data;
  }
}

class TagList {
  int type;
  String tagName;

  TagList({this.type, this.tagName});

  TagList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    tagName = json['tagName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['tagName'] = this.tagName;
    return data;
  }
}

/*
  navigationPopList: [
    {
        category: 1,
        categoryName: 热门,
        destAreaList: [
            {
                id: 1001,
                text: 热门目的地,
                child: [
                    {
                        id: 104,
                        text: 成都,
                        picUrl: https: //dimg08.c-ctrip.com/images/100r1f000001gon9mBC5D_C_250_250.jpg,
                        kwd: 成都,
                        tagList: [
                            {
                                type: 1,
                                tagName: 美食
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 158,
                        text: 重庆,
                        picUrl: https: //dimg05.c-ctrip.com/images/100f180000013p2c086E4_C_250_250.jpg,
                        kwd: 重庆,
                        tagList: [
                            {
                                type: 1,
                                tagName: 美食
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 7,
                        text: 西安,
                        picUrl: https: //dimg02.c-ctrip.com/images/1001180000015ht5s1FBE_C_250_250.jpg,
                        kwd: 西安,
                        tagList: [
                            {
                                type: 1,
                                tagName: 兵马俑
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 21,
                        text: 厦门,
                        picUrl: https: //dimg01.c-ctrip.com/images/100w1f000001gwb0k4589_C_250_250.jpg,
                        kwd: 厦门,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 17,
                        text: 千岛湖,
                        picUrl: https: //dimg06.c-ctrip.com/images/10051f000001gsrop80DA_C_250_250.jpg,
                        kwd: 千岛湖,
                        tagList: [
                            {
                                type: 1,
                                tagName: 亲水
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 23,
                        text: 张家界,
                        picUrl: https: //dimg01.c-ctrip.com/images/100p0y000000m0n4d5A06_C_250_250.jpg,
                        kwd: 张家界,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120061,
                        text: 黄山,
                        picUrl: https: //dimg01.c-ctrip.com/images/100l0g000000884py6BDE_C_250_250.jpg,
                        kwd: 黄山,
                        tagList: [
                            {
                                type: 1,
                                tagName: 登高
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 5,
                        text: 青岛,
                        picUrl: https: //dimg06.c-ctrip.com/images/100i0m000000dp8mc69DB_C_250_250.jpg,
                        kwd: 青岛,
                        tagList: [
                            {
                                type: 1,
                                tagName: 啤酒节
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 2,
                        text: 上海,
                        picUrl: https: //dimg07.c-ctrip.com/images/100e0h0000008rp39A12F_C_250_250.jpg,
                        kwd: 上海,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 61,
                        text: 三亚,
                        picUrl: https: //dimg07.c-ctrip.com/images/100o1f000001gp6di1DB0_C_250_250.jpg,
                        kwd: 三亚,
                        tagList: [
                            {
                                type: 1,
                                tagName: 人气
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 25,
                        text: 九寨沟,
                        picUrl: https: //dimg01.c-ctrip.com/images/fd/tg/g2/M02/88/E8/Cghzf1WwvRuAe2puAA0StCMWUV0813_C_250_250.jpg,
                        kwd: 九寨沟,
                        tagList: [
                            {
                                type: 1,
                                tagName: 人气
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 152,
                        text: 广州,
                        picUrl: https: //dimg06.c-ctrip.com/images/100c180000014rkpq4C68_C_250_250.jpg,
                        kwd: 广州,
                        tagList: [
                            {
                                type: 1,
                                tagName: 美食
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 100003,
                        text: 西藏,
                        picUrl: https: //dimg03.c-ctrip.com/images/fd/tg/g1/M07/C8/8F/CghzflWwvgaAFa90AAg0qoIWSkI373_C_250_250.jpg,
                        kwd: 西藏,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 9,
                        text: 南京,
                        picUrl: https: //dimg08.c-ctrip.com/images/100j0w000000kci7s4D24_C_250_250.jpg,
                        kwd: 南京,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 30,
                        text: 西双版纳,
                        picUrl: https: //dimg01.c-ctrip.com/images/fd/tg/g4/M06/9C/D8/CggYHFXRUw2AAJrSABIhk3trj7Y885_C_250_250.jpg,
                        kwd: 西双版纳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 36,
                        text: 拉萨,
                        picUrl: https: //dimg05.c-ctrip.com/images/100b11000000r48we269D_C_250_250.jpg,
                        kwd: 拉萨,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            }
        ]
    },
    {
        category: 2,
        categoryName: 周边,
        destAreaList: [
            {
                id: 2001,
                text: 热门目的地,
                child: [
                    {
                        id: 17,
                        text: 千岛湖,
                        picUrl: https: //dimg06.c-ctrip.com/images/10051f000001gsrop80DA_C_250_250.jpg,
                        kwd: 千岛湖,
                        tagList: [
                            {
                                type: 1,
                                tagName: 亲水
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 120061,
                        text: 黄山,
                        picUrl: https: //dimg01.c-ctrip.com/images/100l0g000000884py6BDE_C_250_250.jpg,
                        kwd: 黄山,
                        tagList: [
                            {
                                type: 1,
                                tagName: 登高
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 2,
                        text: 上海,
                        picUrl: https: //dimg07.c-ctrip.com/images/100e0h0000008rp39A12F_C_250_250.jpg,
                        kwd: 上海,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 9,
                        text: 南京,
                        picUrl: https: //dimg08.c-ctrip.com/images/100j0w000000kci7s4D24_C_250_250.jpg,
                        kwd: 南京,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10,
                        text: 无锡,
                        picUrl: https: //dimg03.c-ctrip.com/images/fd/tg/g4/M0A/37/F6/CggYHlXDMiqAI6rxACq6bSHMh-k887_C_250_250.jpg,
                        kwd: 无锡,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 508,
                        text: 乌镇,
                        picUrl: https: //dimg07.c-ctrip.com/images/10081f000001gqideDD5C_C_250_250.jpg,
                        kwd: 乌镇,
                        tagList: [
                            {
                                type: 1,
                                tagName: 古镇
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 479,
                        text: 舟山,
                        picUrl: https: //dimg07.c-ctrip.com/images/100j1f000001gpsvo23F2_C_250_250.jpg,
                        kwd: 舟山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 686,
                        text: 安吉,
                        picUrl: https: //dimg04.c-ctrip.com/images/100a1f000001grmbd39CE_C_250_250.jpg,
                        kwd: 安吉,
                        tagList: [
                            {
                                type: 1,
                                tagName: 漂流
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 87,
                        text: 莫干山,
                        picUrl: https: //dimg01.c-ctrip.com/images/100g13000000txh35ACD5_C_250_250.jpg,
                        kwd: 莫干山,
                        tagList: [
                            {
                                type: 1,
                                tagName: 避暑
                            }
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 2002,
                text: 周边经典目的地,
                child: [
                    {
                        id: 83,
                        text: 宁波,
                        picUrl: ,
                        kwd: 宁波,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 82,
                        text: 嵊泗,
                        picUrl: ,
                        kwd: 嵊泗,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 12,
                        text: 扬州,
                        picUrl: ,
                        kwd: 扬州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 68,
                        text: 湖州,
                        picUrl: ,
                        kwd: 湖州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 18,
                        text: 绍兴,
                        picUrl: ,
                        kwd: 绍兴,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 206,
                        text: 常州,
                        picUrl: ,
                        kwd: 常州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 22,
                        text: 武夷山,
                        picUrl: ,
                        kwd: 武夷山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 688,
                        text: 桐庐,
                        picUrl: ,
                        kwd: 桐庐,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 272,
                        text: 嘉兴,
                        picUrl: ,
                        kwd: 嘉兴,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 446,
                        text: 婺源,
                        picUrl: ,
                        kwd: 婺源,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 598,
                        text: 溧阳,
                        picUrl: ,
                        kwd: 溧阳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 153,
                        text: 温州,
                        picUrl: ,
                        kwd: 温州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 196,
                        text: 合肥,
                        picUrl: ,
                        kwd: 合肥,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 238,
                        text: 连云港,
                        picUrl: ,
                        kwd: 连云港,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 402,
                        text: 台州,
                        picUrl: ,
                        kwd: 台州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 98,
                        text: 余姚,
                        picUrl: ,
                        kwd: 余姚,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 13,
                        text: 镇江,
                        picUrl: ,
                        kwd: 镇江,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 723,
                        text: 象山,
                        picUrl: ,
                        kwd: 象山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 227,
                        text: 宜兴,
                        picUrl: ,
                        kwd: 宜兴,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 457,
                        text: 芜湖,
                        picUrl: ,
                        kwd: 芜湖,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 77,
                        text: 昆山,
                        picUrl: ,
                        kwd: 昆山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 219,
                        text: 金华,
                        picUrl: ,
                        kwd: 金华,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 543,
                        text: 慈溪,
                        picUrl: ,
                        kwd: 慈溪,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 220,
                        text: 桐乡,
                        picUrl: ,
                        kwd: 桐乡,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 441,
                        text: 丽水,
                        picUrl: ,
                        kwd: 丽水,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 494,
                        text: 泰州,
                        picUrl: ,
                        kwd: 泰州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1011,
                        text: 德清,
                        picUrl: ,
                        kwd: 德清,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1832,
                        text: 长兴,
                        picUrl: ,
                        kwd: 长兴,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 547,
                        text: 上饶,
                        picUrl: ,
                        kwd: 上饶,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 493,
                        text: 盐城,
                        picUrl: ,
                        kwd: 盐城,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 2003,
                text: 周边热门景点,
                child: [
                    {
                        id: 16,
                        text: 普陀山,
                        picUrl: ,
                        kwd: 普陀山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 85619,
                        text: 枸杞岛,
                        picUrl: ,
                        kwd: 枸杞岛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 120416,
                        text: 东极岛,
                        picUrl: ,
                        kwd: 东极岛,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 15,
                        text: 西塘,
                        picUrl: ,
                        kwd: 西塘,
                        tagList: [
                            {
                                type: 1,
                                tagName: 古镇
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 1096,
                        text: 横店影视城,
                        picUrl: ,
                        kwd: 横店影视城,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 159,
                        text: 三清山,
                        picUrl: ,
                        kwd: 三清山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 182,
                        text: 九华山,
                        picUrl: ,
                        kwd: 九华山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1437,
                        text: 天目湖,
                        picUrl: ,
                        kwd: 天目湖,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 81,
                        text: 周庄,
                        picUrl: ,
                        kwd: 周庄,
                        tagList: [
                            {
                                type: 1,
                                tagName: 第一水乡
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 23822661,
                        text: 拈花湾,
                        picUrl: ,
                        kwd: 拈花湾,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 80871,
                        text: 花鸟岛,
                        picUrl: ,
                        kwd: 花鸟岛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 120496,
                        text: 宏村,
                        picUrl: ,
                        kwd: 宏村,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1446916,
                        text: 迪士尼度假区,
                        picUrl: ,
                        kwd: 迪士尼度假区,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 256,
                        text: 朱家尖,
                        picUrl: ,
                        kwd: 朱家尖,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 246,
                        text: 天台山,
                        picUrl: ,
                        kwd: 天台山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 80,
                        text: 南浔古镇,
                        picUrl: ,
                        kwd: 南浔古镇,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 79311,
                        text: 中华恐龙园,
                        picUrl: ,
                        kwd: 中华恐龙园,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 2603,
                        text: 太湖,
                        picUrl: ,
                        kwd: 太湖,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 95,
                        text: 同里,
                        picUrl: ,
                        kwd: 同里,
                        tagList: [
                            {
                                type: 1,
                                tagName: 水乡
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 120550,
                        text: 大明山,
                        picUrl: ,
                        kwd: 大明山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 56555162,
                        text: 太湖龙之梦乐园,
                        picUrl: ,
                        kwd: 太湖龙之梦乐园,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 120535,
                        text: 灵山景区,
                        picUrl: ,
                        kwd: 灵山景区,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 75721,
                        text: 灵山大佛,
                        picUrl: ,
                        kwd: 灵山大佛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 63611171,
                        text: 云上草原,
                        picUrl: ,
                        kwd: 云上草原,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 52075446,
                        text: 上海海昌海洋公园,
                        picUrl: ,
                        kwd: 上海海昌海洋公园,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 160,
                        text: 龙虎山,
                        picUrl: ,
                        kwd: 龙虎山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10559163,
                        text: 金鸡湖,
                        picUrl: ,
                        kwd: 金鸡湖,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 94,
                        text: 甪直古镇,
                        picUrl: ,
                        kwd: 甪直古镇,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 80578,
                        text: 太平湖,
                        picUrl: ,
                        kwd: 太平湖,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 225,
                        text: 仙都景区,
                        picUrl: ,
                        kwd: 仙都景区,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            }
        ]
    },
    {
        category: 3,
        categoryName: 境内,
        destAreaList: [
            {
                id: 3001,
                text: 热门目的地,
                child: [
                    {
                        id: 104,
                        text: 成都,
                        picUrl: https: //dimg08.c-ctrip.com/images/100r1f000001gon9mBC5D_C_250_250.jpg,
                        kwd: 成都,
                        tagList: [
                            {
                                type: 1,
                                tagName: 美食
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 158,
                        text: 重庆,
                        picUrl: https: //dimg05.c-ctrip.com/images/100f180000013p2c086E4_C_250_250.jpg,
                        kwd: 重庆,
                        tagList: [
                            {
                                type: 1,
                                tagName: 美食
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 7,
                        text: 西安,
                        picUrl: https: //dimg02.c-ctrip.com/images/1001180000015ht5s1FBE_C_250_250.jpg,
                        kwd: 西安,
                        tagList: [
                            {
                                type: 1,
                                tagName: 兵马俑
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 21,
                        text: 厦门,
                        picUrl: https: //dimg01.c-ctrip.com/images/100w1f000001gwb0k4589_C_250_250.jpg,
                        kwd: 厦门,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 17,
                        text: 千岛湖,
                        picUrl: https: //dimg06.c-ctrip.com/images/10051f000001gsrop80DA_C_250_250.jpg,
                        kwd: 千岛湖,
                        tagList: [
                            {
                                type: 1,
                                tagName: 亲水
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 23,
                        text: 张家界,
                        picUrl: https: //dimg01.c-ctrip.com/images/100p0y000000m0n4d5A06_C_250_250.jpg,
                        kwd: 张家界,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120061,
                        text: 黄山,
                        picUrl: https: //dimg01.c-ctrip.com/images/100l0g000000884py6BDE_C_250_250.jpg,
                        kwd: 黄山,
                        tagList: [
                            {
                                type: 1,
                                tagName: 登高
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 5,
                        text: 青岛,
                        picUrl: https: //dimg06.c-ctrip.com/images/100i0m000000dp8mc69DB_C_250_250.jpg,
                        kwd: 青岛,
                        tagList: [
                            {
                                type: 1,
                                tagName: 啤酒节
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 2,
                        text: 上海,
                        picUrl: https: //dimg07.c-ctrip.com/images/100e0h0000008rp39A12F_C_250_250.jpg,
                        kwd: 上海,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 3002,
                text: 云南,
                child: [
                    {
                        id: 30,
                        text: 西双版纳,
                        picUrl: ,
                        kwd: 西双版纳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 106,
                        text: 香格里拉,
                        picUrl: ,
                        kwd: 香格里拉,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120055,
                        text: 普者黑,
                        picUrl: ,
                        kwd: 普者黑,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 32,
                        text: 丽江,
                        picUrl: ,
                        kwd: 丽江,
                        tagList: [
                            {
                                type: 1,
                                tagName: 人气
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 696,
                        text: 腾冲,
                        picUrl: ,
                        kwd: 腾冲,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10558734,
                        text: 腾冲热海风景区,
                        picUrl: ,
                        kwd: 腾冲热海风景区,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 31,
                        text: 大理,
                        picUrl: ,
                        kwd: 大理,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1342,
                        text: 弥勒,
                        picUrl: ,
                        kwd: 弥勒,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 29,
                        text: 昆明,
                        picUrl: ,
                        kwd: 昆明,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 928,
                        text: 普洱,
                        picUrl: ,
                        kwd: 普洱,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 510,
                        text: 楚雄,
                        picUrl: ,
                        kwd: 楚雄,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 420,
                        text: 保山,
                        picUrl: ,
                        kwd: 保山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 509,
                        text: 曲靖,
                        picUrl: ,
                        kwd: 曲靖,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 477,
                        text: 玉溪,
                        picUrl: ,
                        kwd: 玉溪,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 75908,
                        text: 西双版纳傣族园,
                        picUrl: ,
                        kwd: 西双版纳傣族园,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 2032,
                        text: 元阳,
                        picUrl: ,
                        kwd: 元阳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1446279,
                        text: 玉龙,
                        picUrl: ,
                        kwd: 玉龙,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 512,
                        text: 红河,
                        picUrl: ,
                        kwd: 红河,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 3003,
                text: 青海,
                child: [
                    {
                        id: 237,
                        text: 西宁,
                        picUrl: ,
                        kwd: 西宁,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 281,
                        text: 青海湖,
                        picUrl: ,
                        kwd: 青海湖,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 78544,
                        text: 茶卡盐湖,
                        picUrl: ,
                        kwd: 茶卡盐湖,
                        tagList: [
                            {
                                type: 1,
                                tagName: 天空之境
                            }
                        ],
                        poiType: SS
                    },
                    {
                        id: 95343,
                        text: 可可西里自然保护区,
                        picUrl: ,
                        kwd: 可可西里自然保护区,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 332,
                        text: 格尔木,
                        picUrl: ,
                        kwd: 格尔木,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 56806647,
                        text: 东台吉乃尔湖,
                        picUrl: ,
                        kwd: 东台吉乃尔湖,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 48265518,
                        text: 翡翠湖,
                        picUrl: ,
                        kwd: 翡翠湖,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 120012,
                        text: 海西,
                        picUrl: ,
                        kwd: 海西,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 77994,
                        text: 塔尔寺,
                        picUrl: ,
                        kwd: 塔尔寺,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 896,
                        text: 玉树,
                        picUrl: ,
                        kwd: 玉树,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120123,
                        text: 祁连,
                        picUrl: ,
                        kwd: 祁连,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10523779,
                        text: 卓尔山,
                        picUrl: ,
                        kwd: 卓尔山,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 891,
                        text: 德令哈,
                        picUrl: ,
                        kwd: 德令哈,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 22866354,
                        text: 祁连山草原,
                        picUrl: ,
                        kwd: 祁连山草原,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 82823,
                        text: 昆仑山口,
                        picUrl: ,
                        kwd: 昆仑山口,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 2636,
                        text: 贵德,
                        picUrl: ,
                        kwd: 贵德,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1446317,
                        text: 门源,
                        picUrl: ,
                        kwd: 门源,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 33348855,
                        text: 青海湖骑行,
                        picUrl: ,
                        kwd: 青海湖骑行,
                        tagList: [
                            
                        ],
                        poiType: SS
                    }
                ]
            },
            {
                id: 3004,
                text: 四川,
                child: [
                    {
                        id: 25,
                        text: 九寨沟,
                        picUrl: ,
                        kwd: 九寨沟,
                        tagList: [
                            {
                                type: 1,
                                tagName: 人气
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 342,
                        text: 稻城,
                        picUrl: ,
                        kwd: 稻城,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 78572,
                        text: 稻城亚丁,
                        picUrl: ,
                        kwd: 稻城亚丁,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 24,
                        text: 峨眉山,
                        picUrl: ,
                        kwd: 峨眉山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120478,
                        text: 色达,
                        picUrl: ,
                        kwd: 色达,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 3165,
                        text: 若尔盖,
                        picUrl: ,
                        kwd: 若尔盖,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 911,
                        text: 都江堰,
                        picUrl: ,
                        kwd: 都江堰,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 744,
                        text: 阿坝,
                        picUrl: ,
                        kwd: 阿坝,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 103,
                        text: 乐山,
                        picUrl: ,
                        kwd: 乐山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 143879,
                        text: 青城山,
                        picUrl: ,
                        kwd: 青城山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 754,
                        text: 甘孜,
                        picUrl: ,
                        kwd: 甘孜,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 89964,
                        text: 毕棚沟,
                        picUrl: ,
                        kwd: 毕棚沟,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 917,
                        text: 雅安,
                        picUrl: ,
                        kwd: 雅安,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 344,
                        text: 康定,
                        picUrl: ,
                        kwd: 康定,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 592,
                        text: 西昌,
                        picUrl: ,
                        kwd: 西昌,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 915,
                        text: 绵阳,
                        picUrl: ,
                        kwd: 绵阳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 278,
                        text: 宜宾,
                        picUrl: ,
                        kwd: 宜宾,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1484,
                        text: 西岭雪山,
                        picUrl: ,
                        kwd: 西岭雪山,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 3005,
                text: 江苏,
                child: [
                    {
                        id: 9,
                        text: 南京,
                        picUrl: ,
                        kwd: 南京,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10,
                        text: 无锡,
                        picUrl: ,
                        kwd: 无锡,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 12,
                        text: 扬州,
                        picUrl: ,
                        kwd: 扬州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 206,
                        text: 常州,
                        picUrl: ,
                        kwd: 常州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1437,
                        text: 天目湖,
                        picUrl: ,
                        kwd: 天目湖,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 81,
                        text: 周庄,
                        picUrl: ,
                        kwd: 周庄,
                        tagList: [
                            {
                                type: 1,
                                tagName: 第一水乡
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 598,
                        text: 溧阳,
                        picUrl: ,
                        kwd: 溧阳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 23822661,
                        text: 拈花湾,
                        picUrl: ,
                        kwd: 拈花湾,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 13,
                        text: 镇江,
                        picUrl: ,
                        kwd: 镇江,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 77,
                        text: 昆山,
                        picUrl: ,
                        kwd: 昆山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 79311,
                        text: 中华恐龙园,
                        picUrl: ,
                        kwd: 中华恐龙园,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 493,
                        text: 盐城,
                        picUrl: ,
                        kwd: 盐城,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 11,
                        text: 苏州,
                        picUrl: ,
                        kwd: 苏州,
                        tagList: [
                            {
                                type: 1,
                                tagName: 园林
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 120535,
                        text: 灵山景区,
                        picUrl: ,
                        kwd: 灵山景区,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 75721,
                        text: 灵山大佛,
                        picUrl: ,
                        kwd: 灵山大佛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 10758646,
                        text: 天目湖御水温泉,
                        picUrl: ,
                        kwd: 天目湖御水温泉,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 817,
                        text: 句容,
                        picUrl: ,
                        kwd: 句容,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 75733,
                        text: 瘦西湖,
                        picUrl: ,
                        kwd: 瘦西湖,
                        tagList: [
                            
                        ],
                        poiType: SS
                    }
                ]
            },
            {
                id: 3006,
                text: 湖南,
                child: [
                    {
                        id: 148,
                        text: 长沙,
                        picUrl: ,
                        kwd: 长沙,
                        tagList: [
                            {
                                type: 1,
                                tagName: 小龙虾
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 10558753,
                        text: 凤凰古城,
                        picUrl: ,
                        kwd: 凤凰古城,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 988,
                        text: 凤凰,
                        picUrl: ,
                        kwd: 凤凰,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10558754,
                        text: 芙蓉镇,
                        picUrl: ,
                        kwd: 芙蓉镇,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 336,
                        text: 郴州,
                        picUrl: ,
                        kwd: 郴州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 496,
                        text: 湘西,
                        picUrl: ,
                        kwd: 湘西,
                        tagList: [
                            {
                                type: 1,
                                tagName: 漂流
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 287,
                        text: 岳阳,
                        picUrl: ,
                        kwd: 岳阳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 277,
                        text: 衡山,
                        picUrl: ,
                        kwd: 衡山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 417,
                        text: 常德,
                        picUrl: ,
                        kwd: 常德,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 864,
                        text: 衡阳,
                        picUrl: ,
                        kwd: 衡阳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 655,
                        text: 怀化,
                        picUrl: ,
                        kwd: 怀化,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 22544507,
                        text: 张家界大峡谷玻璃桥,
                        picUrl: ,
                        kwd: 张家界大峡谷玻璃桥,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 1174,
                        text: 株洲,
                        picUrl: ,
                        kwd: 株洲,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10558650,
                        text: 天门山国家森林公园,
                        picUrl: ,
                        kwd: 天门山国家森林公园,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 346,
                        text: 韶山,
                        picUrl: ,
                        kwd: 韶山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 867,
                        text: 邵阳,
                        picUrl: ,
                        kwd: 邵阳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1417,
                        text: 湘潭,
                        picUrl: ,
                        kwd: 湘潭,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 77604,
                        text: 橘子洲,
                        picUrl: ,
                        kwd: 橘子洲,
                        tagList: [
                            
                        ],
                        poiType: SS
                    }
                ]
            },
            {
                id: 3007,
                text: 福建,
                child: [
                    {
                        id: 22,
                        text: 武夷山,
                        picUrl: ,
                        kwd: 武夷山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120058,
                        text: 鼓浪屿,
                        picUrl: ,
                        kwd: 鼓浪屿,
                        tagList: [
                            {
                                type: 1,
                                tagName: 小清新
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 164,
                        text: 福州,
                        picUrl: ,
                        kwd: 福州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 243,
                        text: 泉州,
                        picUrl: ,
                        kwd: 泉州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 334,
                        text: 漳州,
                        picUrl: ,
                        kwd: 漳州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1154,
                        text: 霞浦,
                        picUrl: ,
                        kwd: 霞浦,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 2652,
                        text: 平潭,
                        picUrl: ,
                        kwd: 平潭,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 2662,
                        text: 东山,
                        picUrl: ,
                        kwd: 东山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 79480,
                        text: 东山岛,
                        picUrl: ,
                        kwd: 东山岛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 490,
                        text: 宁德,
                        picUrl: ,
                        kwd: 宁德,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 366,
                        text: 龙岩,
                        picUrl: ,
                        kwd: 龙岩,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 620,
                        text: 三明,
                        picUrl: ,
                        kwd: 三明,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 90729,
                        text: 云水谣古镇,
                        picUrl: ,
                        kwd: 云水谣古镇,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 10521073,
                        text: 平潭岛,
                        picUrl: ,
                        kwd: 平潭岛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 317,
                        text: 莆田,
                        picUrl: ,
                        kwd: 莆田,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 2678,
                        text: 泰宁,
                        picUrl: ,
                        kwd: 泰宁,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1445940,
                        text: 湄洲岛,
                        picUrl: ,
                        kwd: 湄洲岛,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 675,
                        text: 晋江,
                        picUrl: ,
                        kwd: 晋江,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 3008,
                text: 广西,
                child: [
                    {
                        id: 140,
                        text: 北海,
                        picUrl: ,
                        kwd: 北海,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 166,
                        text: 南宁,
                        picUrl: ,
                        kwd: 南宁,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120063,
                        text: 涠洲岛,
                        picUrl: ,
                        kwd: 涠洲岛,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 28,
                        text: 桂林,
                        picUrl: ,
                        kwd: 桂林,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 143,
                        text: 柳州,
                        picUrl: ,
                        kwd: 柳州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 77487,
                        text: 德天跨国瀑布景区,
                        picUrl: ,
                        kwd: 德天跨国瀑布景区,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 698,
                        text: 防城港,
                        picUrl: ,
                        kwd: 防城港,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 3041,
                        text: 巴马,
                        picUrl: ,
                        kwd: 巴马,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 702,
                        text: 阳朔,
                        picUrl: ,
                        kwd: 阳朔,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120533,
                        text: 黄姚古镇,
                        picUrl: ,
                        kwd: 黄姚古镇,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 707,
                        text: 贺州,
                        picUrl: ,
                        kwd: 贺州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 524,
                        text: 百色,
                        picUrl: ,
                        kwd: 百色,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 77771,
                        text: 北海银滩旅游度假区,
                        picUrl: ,
                        kwd: 北海银滩旅游度假区,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 837,
                        text: 崇左,
                        picUrl: ,
                        kwd: 崇左,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 967,
                        text: 靖西,
                        picUrl: ,
                        kwd: 靖西,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 975,
                        text: 三江,
                        picUrl: ,
                        kwd: 三江,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 964,
                        text: 东兴,
                        picUrl: ,
                        kwd: 东兴,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 838,
                        text: 河池,
                        picUrl: ,
                        kwd: 河池,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 3009,
                text: 山东,
                child: [
                    {
                        id: 6,
                        text: 泰山,
                        picUrl: ,
                        kwd: 泰山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 128,
                        text: 济南,
                        picUrl: ,
                        kwd: 济南,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 169,
                        text: 威海,
                        picUrl: ,
                        kwd: 威海,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 170,
                        text: 烟台,
                        picUrl: ,
                        kwd: 烟台,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 622,
                        text: 日照,
                        picUrl: ,
                        kwd: 日照,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 746,
                        text: 泰安,
                        picUrl: ,
                        kwd: 泰安,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 168,
                        text: 蓬莱,
                        picUrl: ,
                        kwd: 蓬莱,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 480,
                        text: 临沂,
                        picUrl: ,
                        kwd: 临沂,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 656,
                        text: 枣庄,
                        picUrl: ,
                        kwd: 枣庄,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 505,
                        text: 长岛,
                        picUrl: ,
                        kwd: 长岛,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 226,
                        text: 潍坊,
                        picUrl: ,
                        kwd: 潍坊,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 899,
                        text: 荣成,
                        picUrl: ,
                        kwd: 荣成,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 129,
                        text: 曲阜,
                        picUrl: ,
                        kwd: 曲阜,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 93212,
                        text: 台儿庄古城,
                        picUrl: ,
                        kwd: 台儿庄古城,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 85745,
                        text: 崂山,
                        picUrl: ,
                        kwd: 崂山,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 658,
                        text: 济宁,
                        picUrl: ,
                        kwd: 济宁,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 78214,
                        text: 养马岛,
                        picUrl: ,
                        kwd: 养马岛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 78030,
                        text: 蓬莱阁,
                        picUrl: ,
                        kwd: 蓬莱阁,
                        tagList: [
                            
                        ],
                        poiType: SS
                    }
                ]
            },
            {
                id: 3010,
                text: 浙江,
                child: [
                    {
                        id: 16,
                        text: 普陀山,
                        picUrl: ,
                        kwd: 普陀山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 508,
                        text: 乌镇,
                        picUrl: ,
                        kwd: 乌镇,
                        tagList: [
                            {
                                type: 1,
                                tagName: 古镇
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 479,
                        text: 舟山,
                        picUrl: ,
                        kwd: 舟山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 686,
                        text: 安吉,
                        picUrl: ,
                        kwd: 安吉,
                        tagList: [
                            {
                                type: 1,
                                tagName: 漂流
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 87,
                        text: 莫干山,
                        picUrl: ,
                        kwd: 莫干山,
                        tagList: [
                            {
                                type: 1,
                                tagName: 避暑
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 83,
                        text: 宁波,
                        picUrl: ,
                        kwd: 宁波,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 82,
                        text: 嵊泗,
                        picUrl: ,
                        kwd: 嵊泗,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 68,
                        text: 湖州,
                        picUrl: ,
                        kwd: 湖州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 18,
                        text: 绍兴,
                        picUrl: ,
                        kwd: 绍兴,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 85619,
                        text: 枸杞岛,
                        picUrl: ,
                        kwd: 枸杞岛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 120416,
                        text: 东极岛,
                        picUrl: ,
                        kwd: 东极岛,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 15,
                        text: 西塘,
                        picUrl: ,
                        kwd: 西塘,
                        tagList: [
                            {
                                type: 1,
                                tagName: 古镇
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 688,
                        text: 桐庐,
                        picUrl: ,
                        kwd: 桐庐,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1096,
                        text: 横店影视城,
                        picUrl: ,
                        kwd: 横店影视城,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 272,
                        text: 嘉兴,
                        picUrl: ,
                        kwd: 嘉兴,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 402,
                        text: 台州,
                        picUrl: ,
                        kwd: 台州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 723,
                        text: 象山,
                        picUrl: ,
                        kwd: 象山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 219,
                        text: 金华,
                        picUrl: ,
                        kwd: 金华,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 3011,
                text: 新疆,
                child: [
                    {
                        id: 117,
                        text: 乌鲁木齐,
                        picUrl: ,
                        kwd: 乌鲁木齐,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 124,
                        text: 喀什,
                        picUrl: ,
                        kwd: 喀什,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 2025369,
                        text: 北疆,
                        picUrl: ,
                        kwd: 北疆,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 816,
                        text: 喀纳斯,
                        picUrl: ,
                        kwd: 喀纳斯,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 115,
                        text: 伊犁,
                        picUrl: ,
                        kwd: 伊犁,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 22865725,
                        text: 独库公路,
                        picUrl: ,
                        kwd: 独库公路,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 920,
                        text: 阿克苏,
                        picUrl: ,
                        kwd: 阿克苏,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 2025380,
                        text: 南疆,
                        picUrl: ,
                        kwd: 南疆,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 429,
                        text: 库尔勒,
                        picUrl: ,
                        kwd: 库尔勒,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 2058,
                        text: 伊宁市,
                        picUrl: ,
                        kwd: 伊宁市,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 557,
                        text: 和田,
                        picUrl: ,
                        kwd: 和田,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 76471,
                        text: 天山天池,
                        picUrl: ,
                        kwd: 天山天池,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 1345,
                        text: 库车,
                        picUrl: ,
                        kwd: 库车,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 567,
                        text: 哈密市,
                        picUrl: ,
                        kwd: 哈密市,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 924,
                        text: 塔城,
                        picUrl: ,
                        kwd: 塔城,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 82122,
                        text: 帕米尔高原,
                        picUrl: ,
                        kwd: 帕米尔高原,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 922,
                        text: 博乐,
                        picUrl: ,
                        kwd: 博乐,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 923,
                        text: 昌吉,
                        picUrl: ,
                        kwd: 昌吉,
                        tagList: [
                            
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 3012,
                text: 河南,
                child: [
                    {
                        id: 157,
                        text: 郑州,
                        picUrl: ,
                        kwd: 郑州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 198,
                        text: 洛阳,
                        picUrl: ,
                        kwd: 洛阳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 165,
                        text: 开封,
                        picUrl: ,
                        kwd: 开封,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120494,
                        text: 云台山,
                        picUrl: ,
                        kwd: 云台山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 474,
                        text: 新乡,
                        picUrl: ,
                        kwd: 新乡,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 663,
                        text: 焦作,
                        picUrl: ,
                        kwd: 焦作,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 412,
                        text: 安阳,
                        picUrl: ,
                        kwd: 安阳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10758165,
                        text: 清明上河园,
                        picUrl: ,
                        kwd: 清明上河园,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 89108,
                        text: 郭亮村,
                        picUrl: ,
                        kwd: 郭亮村,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 178,
                        text: 嵩山,
                        picUrl: ,
                        kwd: 嵩山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1890,
                        text: 林州,
                        picUrl: ,
                        kwd: 林州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1445029,
                        text: 万仙山,
                        picUrl: ,
                        kwd: 万仙山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1445019,
                        text: 少林寺,
                        picUrl: ,
                        kwd: 少林寺,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1930,
                        text: 栾川,
                        picUrl: ,
                        kwd: 栾川,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 2313,
                        text: 辉县,
                        picUrl: ,
                        kwd: 辉县,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1445188,
                        text: 龙门石窟,
                        picUrl: ,
                        kwd: 龙门石窟,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1014,
                        text: 登封,
                        picUrl: ,
                        kwd: 登封,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 36428655,
                        text: 洛邑古城,
                        picUrl: ,
                        kwd: 洛邑古城,
                        tagList: [
                            
                        ],
                        poiType: SS
                    }
                ]
            },
            {
                id: 3013,
                text: 甘肃,
                child: [
                    {
                        id: 8,
                        text: 敦煌,
                        picUrl: ,
                        kwd: 敦煌,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 231,
                        text: 兰州,
                        picUrl: ,
                        kwd: 兰州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 426,
                        text: 甘南,
                        picUrl: ,
                        kwd: 甘南,
                        tagList: [
                            {
                                type: 1,
                                tagName: 原始藏风
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 283,
                        text: 张掖,
                        picUrl: ,
                        kwd: 张掖,
                        tagList: [
                            {
                                type: 1,
                                tagName: 丹霞地貌
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 75693,
                        text: 莫高窟,
                        picUrl: ,
                        kwd: 莫高窟,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 285,
                        text: 天水,
                        picUrl: ,
                        kwd: 天水,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 284,
                        text: 嘉峪关,
                        picUrl: ,
                        kwd: 嘉峪关,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 1491,
                        text: 陇南,
                        picUrl: ,
                        kwd: 陇南,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 84153,
                        text: 张掖七彩丹霞旅游景区,
                        picUrl: ,
                        kwd: 张掖七彩丹霞旅游景区,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 290,
                        text: 武威,
                        picUrl: ,
                        kwd: 武威,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 282,
                        text: 酒泉,
                        picUrl: ,
                        kwd: 酒泉,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 75690,
                        text: 鸣沙山月牙泉,
                        picUrl: ,
                        kwd: 鸣沙山月牙泉,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 84274,
                        text: 扎尕那,
                        picUrl: ,
                        kwd: 扎尕那,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 78385,
                        text: 麦积山石窟,
                        picUrl: ,
                        kwd: 麦积山石窟,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 10521199,
                        text: 官鹅沟,
                        picUrl: ,
                        kwd: 官鹅沟,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 833,
                        text: 临夏,
                        picUrl: ,
                        kwd: 临夏,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 828,
                        text: 白银,
                        picUrl: ,
                        kwd: 白银,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 85710,
                        text: 崆峒山,
                        picUrl: ,
                        kwd: 崆峒山,
                        tagList: [
                            
                        ],
                        poiType: SS
                    }
                ]
            },
            {
                id: 3014,
                text: 海南,
                child: [
                    {
                        id: 61,
                        text: 三亚,
                        picUrl: ,
                        kwd: 三亚,
                        tagList: [
                            {
                                type: 1,
                                tagName: 人气
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 37,
                        text: 海口,
                        picUrl: ,
                        kwd: 海口,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 530,
                        text: 西沙群岛,
                        picUrl: ,
                        kwd: 西沙群岛,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 120101,
                        text: 三沙,
                        picUrl: ,
                        kwd: 三沙,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 846,
                        text: 万宁,
                        picUrl: ,
                        kwd: 万宁,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 88071,
                        text: 海棠湾,
                        picUrl: ,
                        kwd: 海棠湾,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 1007,
                        text: 文昌,
                        picUrl: ,
                        kwd: 文昌,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 843,
                        text: 琼海,
                        picUrl: ,
                        kwd: 琼海,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10559006,
                        text: 三亚湾,
                        picUrl: ,
                        kwd: 三亚湾,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 1509,
                        text: 陵水,
                        picUrl: ,
                        kwd: 陵水,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10558612,
                        text: 亚龙湾,
                        picUrl: ,
                        kwd: 亚龙湾,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 2078,
                        text: 博鳌,
                        picUrl: ,
                        kwd: 博鳌,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 44775645,
                        text: 三亚亚特兰蒂斯水世界,
                        picUrl: ,
                        kwd: 三亚亚特兰蒂斯水世界,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 10758497,
                        text: 分界洲岛,
                        picUrl: ,
                        kwd: 分界洲岛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 44773663,
                        text: 三亚亚特兰蒂斯失落的空间水族馆,
                        picUrl: ,
                        kwd: 三亚亚特兰蒂斯失落的空间水族馆,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 40035962,
                        text: 三亚亚特兰蒂斯度假区,
                        picUrl: ,
                        kwd: 三亚亚特兰蒂斯度假区,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 10523378,
                        text: 凤凰岛,
                        picUrl: ,
                        kwd: 凤凰岛,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 10759147,
                        text: 三亚千古情景区,
                        picUrl: ,
                        kwd: 三亚千古情景区,
                        tagList: [
                            
                        ],
                        poiType: SS
                    }
                ]
            },
            {
                id: 3015,
                text: 直辖市,
                child: [
                    {
                        id: 1,
                        text: 北京,
                        picUrl: ,
                        kwd: 北京,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 154,
                        text: 天津,
                        picUrl: ,
                        kwd: 天津,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 158,
                        text: 重庆,
                        picUrl: ,
                        kwd: 重庆,
                        tagList: [
                            {
                                type: 1,
                                tagName: 美食
                            }
                        ],
                        poiType: D
                    }
                ]
            },
            {
                id: 3016,
                text: 广东,
                child: [
                    {
                        id: 152,
                        text: 广州,
                        picUrl: ,
                        kwd: 广州,
                        tagList: [
                            {
                                type: 1,
                                tagName: 美食
                            }
                        ],
                        poiType: D
                    },
                    {
                        id: 26,
                        text: 深圳,
                        picUrl: ,
                        kwd: 深圳,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 27,
                        text: 珠海,
                        picUrl: ,
                        kwd: 珠海,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 213,
                        text: 惠州,
                        picUrl: ,
                        kwd: 惠州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 517,
                        text: 清远,
                        picUrl: ,
                        kwd: 清远,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 363,
                        text: 阳江,
                        picUrl: ,
                        kwd: 阳江,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 207,
                        text: 佛山,
                        picUrl: ,
                        kwd: 佛山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 215,
                        text: 汕头,
                        picUrl: ,
                        kwd: 汕头,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10762535,
                        text: 珠海长隆海洋王国,
                        picUrl: ,
                        kwd: 珠海长隆海洋王国,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 76896,
                        text: 长隆野生动物世界,
                        picUrl: ,
                        kwd: 长隆野生动物世界,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 467,
                        text: 潮州,
                        picUrl: ,
                        kwd: 潮州,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 233,
                        text: 中山,
                        picUrl: ,
                        kwd: 中山,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 362,
                        text: 江门,
                        picUrl: ,
                        kwd: 江门,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 83563,
                        text: 双月湾,
                        picUrl: ,
                        kwd: 双月湾,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 269,
                        text: 肇庆,
                        picUrl: ,
                        kwd: 肇庆,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 222,
                        text: 韶关,
                        picUrl: ,
                        kwd: 韶关,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 615,
                        text: 茂名,
                        picUrl: ,
                        kwd: 茂名,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 10558935,
                        text: 长隆欢乐世界,
                        picUrl: ,
                        kwd: 长隆欢乐世界,
                        tagList: [
                            
                        ],
                        poiType: SS
                    }
                ]
            },
            {
                id: 3017,
                text: 西藏,
                child: [
                    {
                        id: 36,
                        text: 拉萨,
                        picUrl: ,
                        kwd: 拉萨,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 75936,
                        text: 布达拉宫,
                        picUrl: ,
                        kwd: 布达拉宫,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 99,
                        text: 阿里,
                        picUrl: ,
                        kwd: 阿里,
                        tagList: [
                            
                        ],
                        poiType: D
                    },
                    {
                        id: 78547,
                        text: 纳木措,
                        picUrl: ,
                        kwd: 纳木措,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 95014,
                        text: 珠峰大本营,
                        picUrl: ,
                        kwd: 珠峰大本营,
                        tagList: [
                            
                        ],
                        poiType: SS
                    },
                    {
                        id: 126,
                        text: 林芝,
                        picUrl: ,
                        kwd: 林芝<…>
 */
