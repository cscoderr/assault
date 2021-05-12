import 'dart:convert';

import 'package:assault/models/analytic_model.dart';
import 'package:assault/models/complaint_model.dart';
import 'package:assault/models/response_message_model.dart';
import 'package:assault/models/user_model.dart';
import 'package:assault/ui/core/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkServices {
  static Future<ResponseMessageModel> register(UserModel userModel) async {
    try {
      final data = userModel.toJson();
      final response = await http.post(Constants.REGISTER, body: data);
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      } else {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      }
    } catch (error) {
      print(error);
      ResponseMessageModel _responseMessageModel = ResponseMessageModel(
        status: false,
        message: "An error occur",
        data: null,
      );
      return _responseMessageModel;
    }
  }

  static Future<ResponseMessageModel> verify({String otp, String email}) async {
    try {
      final data = {'otp': otp, 'email': email};
      final response = await http.post(Constants.VERIFY, body: data);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      } else {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      }
    } catch (error) {
      ResponseMessageModel _responseMessageModel = ResponseMessageModel(
        status: false,
        message: "An error occur",
      );
      return _responseMessageModel;
    }
  }

  static Future<ResponseMessageModel> forgot_verify_otp(
      {String otp, String email}) async {
    try {
      final data = {'otp': otp, 'email': email};
      final response =
          await http.post(Constants.FORGOT_PASSWORD_OTP, body: data);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      } else {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      }
    } catch (error) {
      ResponseMessageModel _responseMessageModel = ResponseMessageModel(
        status: false,
        message: "An error occur",
      );
      return _responseMessageModel;
    }
  }

  static Future<ResponseMessageModel> login(
      {String email, String password}) async {
    try {
      final data = {'email': email, 'password': password};
      final response = await http.post(Constants.LOGIN, body: data);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      } else {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      }
    } catch (error) {
      ResponseMessageModel _responseMessageModel = ResponseMessageModel(
        status: false,
        message: "An error occur",
      );
      return _responseMessageModel;
    }
  }

  static Future<ResponseMessageModel> resetPassword({String email}) async {
    try {
      final data = {'email': email};
      final response = await http.post(Constants.FORGOT_PASSWORD, body: data);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      } else {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      }
    } catch (error) {
      ResponseMessageModel _responseMessageModel = ResponseMessageModel(
        status: false,
        message: "An error occur",
      );
      return _responseMessageModel;
    }
  }

  static Future<ResponseMessageModel> fileComplaint(
      ComplaintModel complaintModel,
      {String token}) async {
    try {
      final body = jsonEncode(complaintModel.toJson());
      print(body);
      final response = await http.post(
        Constants.FILE_COMPLAINT,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      } else {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      }
    } catch (error) {
      print(error.toString());
      ResponseMessageModel _responseMessageModel = ResponseMessageModel(
        status: false,
        message: "An error occur",
      );
      return _responseMessageModel;
    }
  }

  static Future<ResponseMessageModel> totalComplaint({String token}) async {
    try {
      final response = await http.get(
        Constants.TOTAL_COMPLAINT,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      } else {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      }
    } catch (error) {
      print(error.toString());
      ResponseMessageModel _responseMessageModel = ResponseMessageModel(
        status: false,
        message: "An error occur",
      );
      return _responseMessageModel;
    }
  }

  static Future<AnalyticModel> getAnalytics({String token}) async {
    try {
      final response = await http.get(
        Constants.ANALYTICS,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        AnalyticModel _analyticModel = AnalyticModel.fromJson(responseData);
        return _analyticModel;
      } else {
        final responseData = jsonDecode(response.body);
        AnalyticModel _analyticModel = AnalyticModel.fromJson(responseData);
        return _analyticModel;
      }
    } catch (error) {
      print(error.toString());
      AnalyticModel _analyticModel = AnalyticModel(
        status: false,
        message: "An error occur",
      );
      return _analyticModel;
    }
  }

  static Future<ComplaintModel> complaintList({String token}) async {
    try {
      final response = await http.get(
        Constants.LIST_COMPLAINT,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ComplaintModel _complaintModel = ComplaintModel.fromJson(responseData);
        return _complaintModel;
      } else {
        final responseData = jsonDecode(response.body);
        ComplaintModel _complaintModel = ComplaintModel.fromJson(responseData);
        return _complaintModel;
      }
    } catch (error) {
      ComplaintModel _complaintModel =
          ComplaintModel(status: false, message: "An error occur");
      return _complaintModel;
    }
  }

  static Future<ComplaintModel> complaintDetails(String complaintId,
      {String token}) async {
    try {
      final response = await http.get(
        Constants.COMPLAINT_DETAILS + complaintId,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ComplaintModel _complaintModel = ComplaintModel.convert(responseData);
        return _complaintModel;
      } else {
        final responseData = jsonDecode(response.body);
        ComplaintModel _complaintModel = ComplaintModel.fromJson(responseData);
        return _complaintModel;
      }
    } catch (error) {
      ComplaintModel _complaintModel =
          ComplaintModel(status: false, message: "An error occur");
      return _complaintModel;
    }
  }

  static Future<ComplaintModel> searchComplaint(
      {String keyword, String token}) async {
    try {
      final response = await http.get(
        Constants.SEARCH_COMPLAINT + '?keyword=$keyword',
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ComplaintModel _complaintModel = ComplaintModel.fromJson(responseData);
        return _complaintModel;
      } else {
        final responseData = jsonDecode(response.body);
        ComplaintModel _complaintModel = ComplaintModel.fromJson(responseData);
        return _complaintModel;
      }
    } catch (error) {
      ComplaintModel _complaintModel =
          ComplaintModel(status: false, message: "An error occur");
      return _complaintModel;
    }
  }

  static Future<ResponseMessageModel> editProfile(UserModel userModel,
      {String token}) async {
    try {
      final data = userModel.toJson();
      final response = await http.post(
        Constants.EDIT_PROFILE,
        headers: {
          'Authorization': 'Bearer $token',
          // 'Content-Type': 'application/json',
        },
        body: data,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      } else {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      }
    } catch (error) {
      print(error);
      ResponseMessageModel _responseMessageModel = ResponseMessageModel(
        status: false,
        message: "An error occur",
        data: null,
      );
      return _responseMessageModel;
    }
  }

  static Future<ResponseMessageModel> changePassword(
      {String oldPassword, String newPassword, String token}) async {
    try {
      final data = jsonEncode(
          {'current_password': oldPassword, 'new_password': newPassword});
      final response = await http.post(
        Constants.CHANGE_PASSWORD,
        body: data,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      } else {
        final responseData = jsonDecode(response.body);
        ResponseMessageModel _responseMessageModel =
            ResponseMessageModel.fromJson(responseData);
        return _responseMessageModel;
      }
    } catch (error) {
      ResponseMessageModel _responseMessageModel = ResponseMessageModel(
        status: false,
        message: "An error occur",
        data: null,
      );
      return _responseMessageModel;
    }
  }
}
