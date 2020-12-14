# flutter_union_pay

![Pub Version](https://img.shields.io/pub/v/flutter_union_pay)

A flutter union pay plugin.

云闪付支付插件。

## Dependencies

### Android

[![union_paySDK](https://img.shields.io/badge/union_pay_SDK_Doc-3.3.0-red)](https://open.unionpay.com/tjweb/acproduct/list?apiSvcId=450)
![flutter_plugin V2](https://img.shields.io/badge/flutter_plugin-V2-red)

### iOS

[![union_paySDK](https://img.shields.io/badge/union_pay_SDK_Doc-3.3.1-red)](https://open.unionpay.com/tjweb/acproduct/list?apiSvcId=450)

## Supported Platforms

* Android
* iOS

## Exmaple

see [exmaple folder](./example)

## Guide

### 判断是否安装云闪付App

```dart
bool checkUnionPayInstalled()async{
    return await FlutterUnionPay.installed;
}
```

### 获取云闪付控件版本号

```dart
String getUnionVersion()async{
    return await FlutterUnionPay.version;
}
```

注意，该值 *暂不支持iOS*

### 开始支付

```dart
startPay()async{
    await FlutterUnionPay.pay(
        tn: "YOUR TN CODE",
        mode: PaymentEnv.PRODUCT,
        scheme: "YOUR iOS SCHEME",
    )
}
```

| 属性名 | 属性描述 | 数据类型 | 备注 |
|---- | ---- | ----|----|
| tn | 订单号 | String |
| mode | 开发环境 | PaymentEnv |
| scheme | iOS Scheme | String | 仅iOS需要设置 |

### 监听支付结果

```dart
FlutterUnionPay.listenMessage((PaymentResult result) {
   //place your code here.
});
```

### 常量和模型

#### PaymentResult

```dart
class PaymentResult {
  int code = 0;
  PaymentStatus get status => PaymentStatus.values[code];
  PaymentResult.fromJson(String e) {
    dynamic json = jsonDecode(e);
    this.code = json['code'];
  }
}
```

#### PaymentStatus

```dart
enum PaymentStatus {
  ///支付取消
  CANCEL,

  ///支付成功
  SUCCESS,

  ///支付失败
  FAIL,
}
```

#### PaymentEnv

```dart
enum PaymentEnv {
  ///生产环境
  PRODUCT,

  ///测试环境
  ///
  /// 测试环境测试需要卸载设备中的App
  DEVELOPMENT,
}
```

## Author

[github@laiiihz](https://github.com/laiiihz)
