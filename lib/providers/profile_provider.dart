import 'package:assault/models/response_message_model.dart';
import 'package:assault/models/user_model.dart';
import 'package:assault/services/network_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier {
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();
  SharedPreferences _prefs;

  ProfileProvider.initialize();

  Future<ResponseMessageModel> editProfile(
      {String firstName, String lastName, String email}) async {
    _prefs = await _sharedPreferences;
    final userModel =
        UserModel(firstName: firstName, lastName: lastName, email: email);
    final _responseMessageModel = await NetworkServices.editProfile(userModel,
        token: _prefs?.getString("access_token").toString());
    // if (_responseMessageModel.data != null &&
    //     _responseMessageModel.status == true) {
    //   notifyListeners();
    // }
    return _responseMessageModel;
  }

  Future<ResponseMessageModel> changePassword(
      {String oldPassword, String newPassword}) async {
    _prefs = await _sharedPreferences;
    final _responseMessageModel = await NetworkServices.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        token: _prefs?.getString("access_token").toString());
    return _responseMessageModel;
  }
}
