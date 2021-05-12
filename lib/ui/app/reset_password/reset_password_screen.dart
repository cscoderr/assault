import 'dart:async';

import 'package:assault/providers/user_provider.dart';
import 'package:assault/ui/core/constants.dart';
import 'package:assault/ui/core/dialogs.dart';
import 'package:assault/ui/core/input_box.dart';
import 'package:assault/ui/core/show_snicks.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/solid_button.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen();

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final _dialogKey = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.minBlockVertical * 5.0,
                ),
                Form(
                  key: _formState,
                  child: Column(
                    children: [
                      InputBox(
                        controller: _emailController,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp myReg = new RegExp(pattern);
                          if (value.trim().isEmpty)
                            return 'Email cannot be empty';
                          if (value.trim().length < 4)
                            return 'Invalid email supplied';
                          if (!myReg.hasMatch(value.trim()))
                            return 'Invalid email supplied';
                          return null;
                        },
                        borderSide: BorderSide(
                          color: kSecondaryBorder,
                        ),
                        labelText: 'Email Address',
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: SizeConfig.minBlockVertical * 5.0,
                      ),
                      SolidButton(
                        text: 'Reset',
                        onPressed: () async {
                          if (_formState.currentState.validate()) {
                            _formState.currentState.save();
                            Dialogs.showLoadingDialog(context, key: _dialogKey);
                            final _response = await userProvider.resetPassword(
                                email: _emailController.text);
                            if (_response.status == false &&
                                _response.data == null) {
                              Timer(Duration(seconds: 1), () {
                                displayErrorSnick(
                                    error: _response.message,
                                    context: _dialogKey.currentContext,
                                    scaffoldKey: _scaffoldKey);
                              });
                            } else {
                              Timer(Duration(seconds: 1), () {
                                displaySuccessSnick(
                                  text: _response.message,
                                  context: context,
                                  scaffoldKey: _scaffoldKey,
                                );
                                Timer(Duration(seconds: 2), () {
                                  Navigator.of(_dialogKey.currentContext,
                                          rootNavigator: true)
                                      .pop();
                                  ExtendedNavigator.of(context)
                                      .push(Routes.resetPasswordOtpScreen);
                                });
                              });
                            }
                          }
                        },
                        color: kPrimaryColor,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: SizeConfig.minBlockVertical,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.minBlockVertical * 5.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
