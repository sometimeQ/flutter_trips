import 'package:flutter/services.dart';

class AsrManager {
  // 定义接收的
  static const MethodChannel _channel = const MethodChannel('asr_plugin');

  // 开始录音
  static Future<String> start({Map params}) async {
    return await _channel.invokeMethod('start', params ?? {});
  }

  // 录音结束
  static Future<String> stop() async {
    return await _channel.invokeMethod('stop');
  }

  // 取消录音
  static Future<String> cancel() async {
    return await _channel.invokeMethod('cancel');
  }
}
