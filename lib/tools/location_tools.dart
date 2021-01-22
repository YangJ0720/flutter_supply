import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_android_option.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_ios_option.dart';

/// 百度定位工具类
class LocationTools {

  LocationFlutterPlugin _plugin;

  /// 初始化
  void initialize() {
    // 配置Android定位参数
    BaiduLocationAndroidOption androidOption = BaiduLocationAndroidOption();

    androidOption.setCoorType("bd09ll");

    /// 可选，设置返回经纬度坐标类型，默认gcj02
    /// gcj02：国测局坐标；
    /// bd09ll：百度经纬度坐标；
    /// bd09：百度墨卡托坐标；
    /// 海外地区定位，无需设置坐标类型，统一返回wgs84类型坐标

    androidOption.setIsNeedAltitude(false);

    /// 可选，设置是否需要返回海拔高度信息，true为需要返回

    androidOption.setIsNeedAddres(true);

    /// 可选，设置是否需要返回地址信息，true为需要返回

    androidOption.setIsNeedLocationPoiList(false);

    /// 可选，设置是否需要返回周边poi信息，true为需要返回

    androidOption.setIsNeedNewVersionRgc(true);

    /// 可选，设置是否需要返回新版本rgc信息，true为需要返回

    androidOption.setIsNeedLocationDescribe(true);

    /// 可选，设置是否需要返回位置描述信息，true为需要返回

    androidOption.setOpenGps(true);

    /// 可选，设置是否需要使用gps，true为需要使用

    androidOption.setLocationMode(LocationMode.Hight_Accuracy);

    /// 可选，设置定位模式，可选的模式有高精度、低功耗、仅设备，默认为高精度模式，可选值如下：
    /// 高精度模式: LocationMode.Hight_Accuracy
    /// 低功耗模式：LocationMode.Battery_Saving
    /// 仅设备(Gps)模式：LocationMode.Device_Sensors

    androidOption.setScanspan(1000);

    /// 可选，设置发起定位请求的间隔，int类型，单位ms
    /// 如果设置为0，则代表单次定位，即仅定位一次，默认为0
    /// 如果设置非0，需设置1000ms以上才有效

    androidOption.setLocationPurpose(BDLocationPurpose.SignIn);

    /// 可选，设置场景定位参数，包括签到场景、运动场景、出行场景，可选值如下：
    /// 签到场景: BDLocationPurpose.SignIn
    /// 运动场景: BDLocationPurpose.Transport
    /// 出行场景: BDLocationPurpose.Sport

    Map androidMap = androidOption.getMap();
    // 配置iOS定位参数
    BaiduLocationIOSOption iosOption = BaiduLocationIOSOption();

    iosOption.setIsNeedNewVersionRgc(true);

    /// 可选，设置是否需要返回新版本rgc信息，true为需要返回

    iosOption.setBMKLocationCoordinateType("BMKLocationCoordinateTypeBMK09LL");

    ///  可选，设置返回位置的坐标系类型 ，参数为String类型，可选值如下：
    /// "BMKLocationCoordinateTypeBMK09LL" 百度经纬度坐标
    /// "BMKLocationCoordinateTypeBMK09MC" 百度墨卡托坐标
    /// "BMKLocationCoordinateTypeWGS84"  gps坐标
    /// "BMKLocationCoordinateTypeGCJ02" 国测局坐标

    iosOption.setActivityType("CLActivityTypeAutomotiveNavigation");

    /// 可选，设置应用位置类型，参数为String类型，可选值如下：
    /// "CLActivityTypeOther"
    /// "CLActivityTypeAutomotiveNavigation"
    /// "CLActivityTypeFitness"
    /// "CLActivityTypeOtherNavigation"

    iosOption.setDesiredAccuracy("kCLLocationAccuracyBest");

    /// 可选，设置期望定位精度，参数为String类型，可选值如下：
    /// "kCLLocationAccuracyBest"
    /// "kCLLocationAccuracyNearestTenMeters"
    /// "kCLLocationAccuracyHundredMeters"
    /// "kCLLocationAccuracyKilometer"

    iosOption.setLocationTimeout(10);

    /// 可选，设置位置获取超时时间，参数为int类型

    iosOption.setReGeocodeTimeout(10);

    /// 可选，设置获取rgc信息超时时间，参数为int类型

    iosOption.setPauseLocUpdateAutomatically(true);

    /// 可选，指定定位是否会被系统自动暂停，参数为bool类型
    /// true表示定位会被系统自动暂停，false表示不会

    iosOption.setAllowsBackgroundLocationUpdates(false);

    /// 可选，设置是否允许后台定位，参数为bool类型
    /// true表示允许后台定位，false表示不允许后台定位

    iosOption.setDistanceFilter(10);

    /// 可选，设置定位的最小更新距离，参数为double类型
    Map iosMap = iosOption.getMap();
    //
    var plugin = LocationFlutterPlugin();
    plugin.prepareLoc(androidMap, iosMap);
    plugin.onResultCallback().listen((event) => print('event = $event'));
    //
    this._plugin = plugin;
  }

  ///
  void start() {
    _plugin.startLocation();
    // print('开始定位');
  }

  ///
  void stop() {
    _plugin.stopLocation();
    // print('结束定位');
  }

  ///
  Stream<Map<String, Object>> getLocationResult() {
    return _plugin.onResultCallback();
  }
}
