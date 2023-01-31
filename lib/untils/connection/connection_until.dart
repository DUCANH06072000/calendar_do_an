import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionUntil {
  /// kết nối internet
  static Future<bool> isNetworkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
