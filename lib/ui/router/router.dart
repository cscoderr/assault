import 'package:assault/ui/app/login/login_screen.dart';
import 'package:assault/ui/app/register/register_screen.dart';
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
  ],
)
class $AutoRouter {}
