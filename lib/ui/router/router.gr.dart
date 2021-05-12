// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../models/complaint_model.dart';
import '../app/change_password/change_password_screen.dart';
import '../app/complaint/add_complaint_screen.dart';
import '../app/complaint/add_complaint_screen_two.dart';
import '../app/complaint_details/complaint_details_screen.dart';
import '../app/edit_profile/edit_profile_screen.dart';
import '../app/home/home_screen.dart';
import '../app/list_complaint/list_complaint_screen.dart';
import '../app/login/login_screen.dart';
import '../app/register/register_otp_screen.dart';
import '../app/register/register_screen.dart';
import '../app/reset_password/reset_password_otp_screen.dart';
import '../app/reset_password/reset_password_screen.dart';
import '../app/search/search_result_screen.dart';
import '../app/splash/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  static const String homeScreen = '/home-screen';
  static const String addComplaintScreen = '/add-complaint-screen';
  static const String addComplaintScreenTwo = '/add-complaint-screen-two';
  static const String listComplaintScreen = '/list-complaint-screen';
  static const String editProfileScreen = '/edit-profile-screen';
  static const String changePasswordScreen = '/change-password-screen';
  static const String registerOtpScreen = '/register-otp-screen';
  static const String resetPasswordScreen = '/reset-password-screen';
  static const String resetPasswordOtpScreen = '/reset-password-otp-screen';
  static const String searchResultScreen = '/search-result-screen';
  static const String complaintDetailsScreen = '/complaint-details-screen';
  static const all = <String>{
    splashScreen,
    loginScreen,
    registerScreen,
    homeScreen,
    addComplaintScreen,
    addComplaintScreenTwo,
    listComplaintScreen,
    editProfileScreen,
    changePasswordScreen,
    registerOtpScreen,
    resetPasswordScreen,
    resetPasswordOtpScreen,
    searchResultScreen,
    complaintDetailsScreen,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.registerScreen, page: RegisterScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.addComplaintScreen, page: AddComplaintScreen),
    RouteDef(Routes.addComplaintScreenTwo, page: AddComplaintScreenTwo),
    RouteDef(Routes.listComplaintScreen, page: ListComplaintScreen),
    RouteDef(Routes.editProfileScreen, page: EditProfileScreen),
    RouteDef(Routes.changePasswordScreen, page: ChangePasswordScreen),
    RouteDef(Routes.registerOtpScreen, page: RegisterOtpScreen),
    RouteDef(Routes.resetPasswordScreen, page: ResetPasswordScreen),
    RouteDef(Routes.resetPasswordOtpScreen, page: ResetPasswordOtpScreen),
    RouteDef(Routes.searchResultScreen, page: SearchResultScreen),
    RouteDef(Routes.complaintDetailsScreen, page: ComplaintDetailsScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
    RegisterScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RegisterScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
    HomeScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    AddComplaintScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddComplaintScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    AddComplaintScreenTwo: (data) {
      final args = data.getArgs<AddComplaintScreenTwoArguments>(
        orElse: () => AddComplaintScreenTwoArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddComplaintScreenTwo(complaintModel: args.complaintModel),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    ListComplaintScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ListComplaintScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    EditProfileScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            EditProfileScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    ChangePasswordScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ChangePasswordScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    RegisterOtpScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RegisterOtpScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    ResetPasswordScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ResetPasswordScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    ResetPasswordOtpScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ResetPasswordOtpScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    SearchResultScreen: (data) {
      final args = data.getArgs<SearchResultScreenArguments>(
        orElse: () => SearchResultScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SearchResultScreen(searchQuery: args.searchQuery),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    ComplaintDetailsScreen: (data) {
      final args = data.getArgs<ComplaintDetailsScreenArguments>(
        orElse: () => ComplaintDetailsScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ComplaintDetailsScreen(complaintId: args.complaintId),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AddComplaintScreenTwo arguments holder class
class AddComplaintScreenTwoArguments {
  final ComplaintModel complaintModel;
  AddComplaintScreenTwoArguments({this.complaintModel});
}

/// SearchResultScreen arguments holder class
class SearchResultScreenArguments {
  final String searchQuery;
  SearchResultScreenArguments({this.searchQuery});
}

/// ComplaintDetailsScreen arguments holder class
class ComplaintDetailsScreenArguments {
  final String complaintId;
  ComplaintDetailsScreenArguments({this.complaintId});
}
