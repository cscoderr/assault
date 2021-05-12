import 'dart:async';

import 'package:assault/providers/profile_provider.dart';
import 'package:assault/providers/user_provider.dart';
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

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen();

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _dialogKey = new GlobalKey<State>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      final user = Provider.of<UserProvider>(context, listen: false).user;
      _firstNameController.text = user.firstName;
      _lastNameController.text = user.lastName;
      _emailController.text = user.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
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
                title: 'Edit Profile',
              ),
              SizedBox(
                height: SizeConfig.minBlockVertical * 3.0,
              ),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    InputBox(
                      controller: _firstNameController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'First Name cannot be empty';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'First Name',
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    InputBox(
                      controller: _lastNameController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'Last Name cannot be empty';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'Last Name',
                      inputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
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
                      text: 'Submit',
                      onPressed: () async {
                        if (_formState.currentState.validate()) {
                          Dialogs.showLoadingDialog(context, key: _dialogKey);
                          final _response = await profileProvider.editProfile(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text);
                          if (_response.status == true) {
                            Timer(Duration(seconds: 1), () {
                              displaySuccessSnick(
                                  text: _response.message,
                                  context: _dialogKey.currentContext,
                                  scaffoldKey: _scaffoldKey);
                              Timer(Duration(seconds: 2), () {
                                ExtendedNavigator.of(context).pop();
                              });
                            });
                          } else {
                            Timer(Duration(seconds: 1), () {
                              displayErrorSnick(
                                  error: _response.message,
                                  context: _dialogKey.currentContext,
                                  scaffoldKey: _scaffoldKey);
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
            ],
          ),
        ),
      )),
    );
  }
}
