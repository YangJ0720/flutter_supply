/// 日期格式化工具类
class DateFormatTools {
  ///
  static String convertDateFormat(DateTime dateTime) {
    var month = dateTime.month ~/ 10 == 0 ? '0${dateTime.month}' : '${dateTime.month}';
    var day = dateTime.day ~/ 10 == 0 ? '0${dateTime.day}' : '${dateTime.day}';
    var hour = dateTime.hour ~/ 10 == 0 ? '0${dateTime.hour}' : '${dateTime.hour}';
    var minute = dateTime.minute ~/ 10 == 0 ? '0${dateTime.minute}' : '${dateTime.minute}';
    return '$month月$day日\t$hour:$minute';
  }
}
