import 'dart:convert';

import 'package:flutter_union_pay/enums/union_pay_enum.dart';

class PaymentResult {
  int code = 0;
  PaymentStatus get status => PaymentStatus.values[code];
  PaymentResult.fromJson(String e) {
    dynamic json = jsonDecode(e);
    this.code = json['code'];
  }
}
