import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  // 工厂方法
  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchUrl'] = this.searchUrl;
    return data;
  }
}
