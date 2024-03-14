import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

enum NetworkStatus { Online, Offline }

class NetworkController {
  StreamController<NetworkStatus> networkStatusController =
      StreamController<NetworkStatus>();

  NetworkController() {
    Connectivity().onConnectivityChanged.listen((status) {
      networkStatusController.add(_getNetworkStatus(status));
    });
  }

  NetworkStatus _getNetworkStatus(ConnectivityResult status) {
    return status == ConnectivityResult.mobile ||
            status == ConnectivityResult.wifi
        ? NetworkStatus.Online
        : NetworkStatus.Offline;
  }

  Future<NetworkStatus> getCurrentNetworkStatus(
      {required BuildContext context}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    NetworkStatus status = _getNetworkStatus(connectivityResult);

    if (status == NetworkStatus.Offline) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "You are now offline and the data is being loaded from local storage.",
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      }
    }

    return status;
  }
}
