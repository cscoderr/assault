import 'dart:async';

import 'package:assault/providers/profile_provider.dart';
import 'package:assault/ui/core/custom_appbar.dart';
import 'package:assault/ui/core/dialogs.dart';
import 'package:assault/ui/core/input_box.dart';
import 'package:assault/ui/core/select_box.dart';
import 'package:assault/ui/core/show_snicks.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/solid_button.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen();

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _dialogKey = new GlobalKey<State>();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordAgainController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 50.0,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Change Password',
              ),
              SizedBox(
                height: SizeConfig.minBlockVertical * 3.0,
              ),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    InputBox(
                      controller: _oldPasswordController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'Old Password cannot be empty';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'Old Password',
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    InputBox(
                      controller: _newPasswordController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'New Password cannot be empty';
                        else if (value.trim().length < 8)
                          return 'New Password cannot be less than 8 characters';
                        else if (value.trim() !=
                            _newPasswordAgainController.text)
                          return 'New Password does not match';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'New Password',
                      inputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    InputBox(
                      controller: _newPasswordAgainController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'New Password Again cannot be empty';
                        else if (value.trim() != _newPasswordController.text)
                          return 'New Password does not match';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'New Password Again',
                      inputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    SolidButton(
                      text: 'Submit',
                      onPressed: () {
                        if (_formState.currentState.validate()) {
                          Dialogs.showLoadingDialog(context, key: _dialogKey);
                          profileProvider
                              .changePassword(
                            oldPassword: _oldPasswordController.text,
                            newPassword: _newPasswordController.text,
                          )
                              .then((response) {
                            if (response.status == true) {
                              Timer(Duration(seconds: 2), () {
                                displaySuccessSnick(
                                    text: response.message,
                                    context: _dialogKey.currentContext,
                                    scaffoldKey: _scaffoldKey);
                                Timer(Duration(seconds: 2), () {
                                  ExtendedNavigator.of(context).pop();
                                });
                              });
                              // ExtendedNavigator.of(context).pushAndRemoveUntil(
                              //     Routes.registerOtpScreen, (route) => false);
                            } else {
                              Timer(Duration(seconds: 2), () {
                                displayErrorSnick(
                                    error: response.message,
                                    context: _dialogKey.currentContext,
                                    scaffoldKey: _scaffoldKey);
                              });
                            }
                          });
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
            ],
          ),
        ),
      )),
    );
  }
}
