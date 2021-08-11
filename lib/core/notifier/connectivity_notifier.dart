import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityProvider with ChangeNotifier {
  Connectivity _connectivity = new Connectivity();

  bool? _isConnected;
  bool? get isConnected => _isConnected ?? null;
  set setIsConnected(bool isConnect) {
    _isConnected = isConnect;
    notifyListeners();
  }

  Future<void> listenConnectivity() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((
      ConnectivityResult result,
    ) async {
      if (result == ConnectivityResult.none) {
        setIsConnected = false;
      } else {
        await _updateConnectionStatus(result).then((bool isConnect) {
          setIsConnected = isConnect;
        });
      }
    });
  }

  Future<void> initConnectivity() async {
    //platform exception catch
    ConnectivityResult connectionStatus = ConnectivityResult.none;
    try {
      connectionStatus = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print("PlatformException: " + e.toString());
    }
  }

  Future<bool> _updateConnectionStatus(
      ConnectivityResult connectionStatus) async {
    //check which way for internet connection mobile or wifi
    if (connectionStatus == ConnectivityResult.none) {
      setIsConnected = false;
    } else {
      setIsConnected = true;
    }

    return isConnected!;
  }
}
