import 'dart:math';

import 'package:assault/models/response_message_model.dart';
import 'package:assault/models/user_model.dart';
import 'package:assault/services/network_services.dart';
import 'package:assault/ui/core/appConfig.dart';
import 'package:assault/ui/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserStatus { Uninitialized, Unauthorized, Authenticating, Authenticated }

class UserProvider extends ChangeNotifier {
  UserStatus status;
  String _local = AppConfig.app_endpoint_url;
  bool isFirstLaunch;
  UserModel _user = UserModel();
  SharedPreferences _prefs;
  bool _isAnonymousLogin = false;
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  UserModel get user => _user;
  bool get isAnonymousLogin => _isAnonymousLogin;

  UserProvider.initialize() {
    //load();
    status = UserStatus.Unauthorized;
    _isAnonymousLogin = false;
    notifyListeners();
  }

  UserProvider() {
    // load();
    status = UserStatus.Unauthorized;
    _isAnonymousLogin = false;
    notifyListeners();
  }

  // load() async {
  //   _prefs = await _sharedPreferences;
  // }

  Future<ResponseMessageModel> register(
      {String firstName,
      String lastName,
      String email,
      String password}) async {
    final userModel = UserModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    final _responseMessageModel = await NetworkServices.register(userModel);
    if (_responseMessageModel.data != null &&
        _responseMessageModel.status == true) {
      _user = UserModel.fromJson(_responseMessageModel.data['user']);
      notifyListeners();
    }
    return _responseMessageModel;
  }

  Future<ResponseMessageModel> login({String email, String password}) async {
    _prefs = await _sharedPreferences;
    final _responseMessageModel =
        await NetworkServices.login(email: email, password: password);
    if (_responseMessageModel.status && _responseMessageModel.data != null) {
      _user = UserModel.fromJson(_responseMessageModel.data['user']);
      _prefs.setString('access_token',
          _responseMessageModel.data['access_token'].toString());
      notifyListeners();
    }

    _isAnonymousLogin = false;
    return _responseMessageModel;
  }

  Future<ResponseMessageModel> verifyOtp({String otp, String email}) async {
    _prefs = await _sharedPreferences;
    final _responseMessageModel =
        await NetworkServices.verify(otp: otp, email: email);
    if (_responseMessageModel.status && _responseMessageModel.data != null) {
      _user = UserModel?.fromJson(_responseMessageModel.data['user']);
      _prefs.setString("access_token",
          _responseMessageModel.data['access_token'].toString());
      notifyListeners();
    }
    return _responseMessageModel;
  }

  Future<ResponseMessageModel> verifyResetOtp(
      {String otp, String email}) async {
    final _responseMessageModel =
        await NetworkServices.forgot_verify_otp(otp: otp, email: email);
    return _responseMessageModel;
  }

  Future<bool> loginAnonymously() async {
    final random = Random.secure();
    print(random.nextInt(100000).toString());
    _user = UserModel(
      firstName: random.nextInt(100000000).toString(),
      lastName: random.nextInt(100000000).toString(),
      email: random.nextInt(1000000000).toString() + "@gmail.com",
    );
    _isAnonymousLogin = true;
    notifyListeners();
    return true;
  }

  Future<ResponseMessageModel> resetPassword({String email}) async {
    final _responseMessageModel =
        await NetworkServices.resetPassword(email: email);
    return _responseMessageModel;
  }

  Future<bool> logout() async {
    try {
      _prefs.remove("access_token");
      return true;
    } catch (error) {
      return false;
    }
  }
}
