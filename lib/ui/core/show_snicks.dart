import 'package:assault/ui/core/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void displayErrorSnick(
    {@required String error,
    @required BuildContext context,
    @required scaffoldKey}) {
  //ExtendedNavigator.of(context).pop();
  Navigator.of(context, rootNavigator: true).pop();
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        error,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      duration: Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

void displaySuccessSnick(
    {@required String text, @required context, @required scaffoldKey}) {
  Navigator.of(context, rootNavigator: true).pop();
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      backgroundColor: kSuccessColor,
      content: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      duration: Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
