import 'package:assault/ui/core/appConfig.dart';
import 'package:flutter/material.dart';

enum UserStatus { Uninitialized, Unauthorized, Authenticating, Authenticated }

class UserProvider extends ChangeNotifier {
  UserStatus status;
  String _local = AppConfig.app_endpoint_url;
  bool isFirstLaunch;

  UserProvider.initialize() {
    status = UserStatus.Unauthorized;
    notifyListeners();
  }
}
