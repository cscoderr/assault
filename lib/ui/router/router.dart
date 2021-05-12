import 'package:assault/ui/app/change_password/change_password_screen.dart';
import 'package:assault/ui/app/complaint/add_complaint_screen.dart';
import 'package:assault/ui/app/complaint/add_complaint_screen_two.dart';
import 'package:assault/ui/app/edit_profile/edit_profile_screen.dart';
import 'package:assault/ui/app/home/home_screen.dart';
import 'package:assault/ui/app/complaint_details/complaint_details_screen.dart';
import 'package:assault/ui/app/list_complaint/list_complaint_screen.dart';
import 'package:assault/ui/app/login/login_screen.dart';
import 'package:assault/ui/app/register/register_otp_screen.dart';
import 'package:assault/ui/app/register/register_screen.dart';
import 'package:assault/ui/app/reset_password/reset_password_otp_screen.dart';
import 'package:assault/ui/app/reset_password/reset_password_screen.dart';
import 'package:assault/ui/app/search/search_result_screen.dart';
import 'package:assault/ui/app/splash/splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: SplashScreen, initial: true),
    CustomRoute(
        page: LoginScreen, transitionsBuilder: TransitionsBuilders.slideBottom),
    CustomRoute(
        page: RegisterScreen,
        transitionsBuilder: TransitionsBuilders.slideBottom),
    CustomRoute(
        page: HomeScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: AddComplaintScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: AddComplaintScreenTwo,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ListComplaintScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: EditProfileScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ChangePasswordScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: RegisterOtpScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ResetPasswordScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ResetPasswordOtpScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: SearchResultScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ComplaintDetailsScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)
class $AutoRouter {}
