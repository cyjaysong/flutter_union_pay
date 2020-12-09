
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterUnionPay {
  static const MethodChannel _channel =
      const MethodChannel('flutter_union_pay');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
