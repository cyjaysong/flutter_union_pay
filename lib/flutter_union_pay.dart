import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_union_pay/enums/union_pay_enum.dart';
import 'package:flutter_union_pay/models/payment_result_model.dart';

export 'package:flutter_union_pay/enums/union_pay_enum.dart';
export 'package:flutter_union_pay/models/payment_result_model.dart';

class FlutterUnionPay {
  static const _PACKAGE_NAME = 'flutter_union_pay';
  static const _MESSAGE_CHANNEL_NAME = 'flutter_union_pay.message';
  static const MethodChannel _channel = const MethodChannel(_PACKAGE_NAME);

  ///## 获取云闪付控件版本号
  static Future<String> get version async {
    final String version = await _channel.invokeMethod('version');
    return version;
  }

  ///## 判断是否安装云闪付App
  static Future<bool> get installed async {
    return await _channel.invokeMethod('installed');
  }

  ///## 开始支付
  ///
  /// `tn`订单流水号
  ///
  /// `mode(PaymentEnv)` 开发环境
  ///
  /// `scheme` ios scheme,需要在info.plist中添加
  ///
  /// PaymentEnv.Development 测试环境
  ///
  /// PaymentEnv.PRODUCT 生产环境
  ///
  /// 监听支付结果
  ///```dart
  ///FlutterUnionPay.listenMessage((result) {
  /// //place your code here.
  ///});
  ///```
  static Future<bool> pay(
      {@required String tn, @required PaymentEnv mode, String scheme}) async {
    return await _channel.invokeMethod('pay', {
      'tn': tn,
      'env': _getEnvString(mode),
      'scheme': scheme,
    });
  }

  /// ## 监听支付结果
  ///```dart
  ///FlutterUnionPay.listen((result) {
  /// //place your code here.
  ///});
  ///```
  static listen(Function(PaymentResult result) onListener) {
    var channel = BasicMessageChannel(_MESSAGE_CHANNEL_NAME, StringCodec());
    channel.setMessageHandler(
        (message) => onListener(PaymentResult.fromJson(message)));
  }

  static String _getEnvString(PaymentEnv env) {
    switch (env) {
      case PaymentEnv.PRODUCT:
        return "00";
        break;
      case PaymentEnv.DEVELOPMENT:
        return "01";
        break;
    }
    return "00";
  }
}
