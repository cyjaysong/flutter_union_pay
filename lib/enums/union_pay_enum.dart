///支付结果状态
///
/// ```
/// CANCEL = 0;
/// SUCCESS=1;
/// FAIL = 2;
/// ```
enum PaymentStatus {
  ///支付取消
  CANCEL,

  ///支付成功
  SUCCESS,

  ///支付失败
  FAIL,
}

///支付环境
///
///```
///   PRODUCT = '00';
///   DEVELOPMENT ='01';
///```
enum PaymentEnv {
  ///生产环境
  PRODUCT,

  ///测试环境
  ///
  /// 测试环境测试需要卸载设备中的App
  DEVELOPMENT,
}
