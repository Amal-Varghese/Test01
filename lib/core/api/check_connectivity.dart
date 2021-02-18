import 'package:connectivity/connectivity.dart';

class CheckConnection {
  const CheckConnection._();
  static CheckConnection _instance;

  factory CheckConnection() {
    if (_instance == null) {
      _instance = CheckConnection._();
    }

    return _instance;
  }

  Future<bool> checkIsInternet() async {
    final _connectivity = await (Connectivity().checkConnectivity());
    if (_connectivity == ConnectivityResult.mobile ||
        _connectivity == ConnectivityResult.wifi) {
      return true;
    } else
      return false;
  }
}
