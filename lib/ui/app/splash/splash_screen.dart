import 'package:assault/providers/user_provider.dart';
import 'package:assault/ui/app/welcome/welcome_screen.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    SizeConfig().init(context);
    switch (userProvider.status) {
      case UserStatus.Uninitialized:
        return Material(
            child: Center(child: Container(child: Text('Loading App'))));
      case UserStatus.Authenticating:
      // return LoginScreen();
      case UserStatus.Authenticated:
      // return HomeScreen();
      case UserStatus.Unauthorized:
        return WelcomeScreen();
      default:
        return WelcomeScreen();
    }
  }
}
