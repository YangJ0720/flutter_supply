import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:fluwx/fluwx.dart';

class PayTools {
  ///
  static Future<void> payByAli(String content) async {
    AlipayResult result = await FlutterAlipay.pay(content);
    var status = result.resultStatus;
    print('status = $status');
  }

  ///
  static Future<void> payByWx() async {
    payWithWeChat(
      appId: null,
      partnerId: null,
      prepayId: null,
      packageValue: null,
      nonceStr: null,
      timeStamp: null,
      sign: null,
    );
  }
}
