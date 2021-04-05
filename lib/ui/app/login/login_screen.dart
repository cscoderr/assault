import 'package:assault/providers/user_provider.dart';
import 'package:assault/ui/core/input_box.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/solid_button.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _dialogLoginCodeKeyLoader = new GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    final UserProvider userProvider = Provider.of<UserProvider>(context);

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
                  'Login account',
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
                      InputBox(
                        controller: _passwordController,
                        validator: (value) {
                          if (value.trim().isEmpty)
                            return 'Password cannot be empty';
                          if (value.trim().length < 5)
                            return 'Password cannot be less than 5 characters';
                          return null;
                        },
                        borderSide: BorderSide(
                          color: kSecondaryBorder,
                        ),
                        labelText: 'Password',
                        isPassword: true,
                      ),
                      SizedBox(
                        height: SizeConfig.minBlockVertical,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            text: "Forgot your password? ",
                            style: TextStyle(
                              color: kPrimaryTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: "Reset it",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // ExtendedNavigator.of(context)
                                    //     .push(Routes.forgotPasswordScreen);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.minBlockVertical * 5.0,
                      ),
                      SolidButton(
                        text: 'Login',
                        onPressed: () {
                          // if (_formState.currentState.validate()) {
                          //   // userProvider
                          //   _formState.currentState.save();
                          //   // print(_firstNameController.text);
                          //   LoadingIndicator.isLoadingInd(context,
                          //       key: _dialogLoginCodeKeyLoader);
                          //   userProvider
                          //       .signIn(
                          //           email: _emailController.text,
                          //           password: _passwordController.text)
                          //       .then((value) {
                          //     // if (value['success'] == false &&
                          //     //     value['data'] == null) {
                          //       // displayErrorSnick(
                          //       //     error: value['error'].toString(),
                          //       //     context: _dialogLoginCodeKeyLoader,
                          //       //     scaffoldKey: _scaffoldKey);
                          //     // } else {
                          //     //   Navigator.of(
                          //     //           _dialogLoginCodeKeyLoader
                          //     //               .currentContext,
                          //     //           rootNavigator: true)
                          //     //       .pop();
                          //     //   ExtendedNavigator.of(context)
                          //     //       .push(Routes.homeScreen);
                          //     // }
                          //   });
                          // }
                        },
                        color: kPrimaryColor,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.minBlockVertical * 5.0,
                ),
                Align(
                  child: RichText(
                    text: TextSpan(
                      text: "Don\'t have an account? ",
                      style: TextStyle(
                        color: kPrimaryTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Signup",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ExtendedNavigator.of(context)
                                  .popAndPush(Routes.registerScreen);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
