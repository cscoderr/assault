import 'dart:io';

import 'package:assault/ui/core/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const iOSLocalizedLabels = false;

class Dialogs {
  static Future<void> showLoadingDialog(BuildContext context,
      {GlobalKey key}) async {
    return showDialog<void>(
      context: context,
      // for testing, for now this will be true, should be changed to false later
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          // for testing, for now this will be true, should be changed to false later
          onWillPop: () async => true,
          child: SimpleDialog(
            key: key ?? Key('0'),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              (Platform.isIOS)
                  ? Center(
                      child: Theme(
                        data: ThemeData(
                          cupertinoOverrideTheme:
                              CupertinoThemeData(brightness: Brightness.dark),
                        ),
                        child: CupertinoActivityIndicator(
                          radius: 18,
                          animating: true,
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        backgroundColor: kPrimaryColor,
                        strokeWidth: 1.3,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
