import 'package:assault/ui/core/input_box.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/solid_button.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen();

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _fullNameController = TextEditingController();
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
                  'Register account',
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
                        // validator: (value) {},
                        borderSide: BorderSide(
                          color: kSecondaryBorder,
                        ),
                        labelText: 'First Name',
                        inputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: SizeConfig.minBlockVertical * 5.0,
                      ),
                      InputBox(
                        controller: _emailController,
                        // validator: (value) {

                        // },
                        borderSide: BorderSide(
                          color: kSecondaryBorder,
                        ),
                        labelText: 'Last Name',
                        inputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: SizeConfig.minBlockVertical * 5.0,
                      ),
                      InputBox(
                        controller: _emailController,
                        // validator: (value) {},
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
                        text: 'Register',
                        onPressed: () {},
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
                              // ExtendedNavigator.of(context)
                              //     .popAndPush(Routes.registerScreen);
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
