
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterUnionPay {
  static const MethodChannel _channel =
      const MethodChannel('flutter_union_pay');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> get installed async{
    return await _channel.invokeMethod('installed');
  }

  static Future<bool>  pay({@required String tn,@required String mode}) async{
    return await _channel.invokeMethod('pay',{'tn':tn,'env':mode});
  }
}
