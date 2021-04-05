import 'package:assault/ui/core/appConfig.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator.builder<AutoRouter>(router: AutoRouter()),
      title: AppConfig.app_name,
      theme: ThemeData.light().copyWith(
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'DMSans',
            ),
      ),
    );
  }
}
