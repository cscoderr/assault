import 'dart:async';

import 'package:assault/models/complaint_model.dart';
import 'package:assault/providers/complaint_provider.dart';
import 'package:assault/ui/core/custom_appbar.dart';
import 'package:assault/ui/core/dialogs.dart';
import 'package:assault/ui/core/input_box.dart';
import 'package:assault/ui/core/show_snicks.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/solid_button.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddComplaintScreenTwo extends StatefulWidget {
  final ComplaintModel complaintModel;
  AddComplaintScreenTwo({this.complaintModel});

  @override
  _AddComplaintScreenTwoState createState() => _AddComplaintScreenTwoState();
}

class _AddComplaintScreenTwoState extends State<AddComplaintScreenTwo> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _townController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _dialogKey = new GlobalKey<State>();

  bool _serviceEnabled;

  @override
  void initState() {
    super.initState();
    print(widget.complaintModel.fullName);
  }

  @override
  Widget build(BuildContext context) {
    final complaintProvider = Provider.of<ComplaintProvider>(context);
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
                title: 'Add Location',
              ),
              SizedBox(
                height: SizeConfig.minBlockVertical * 3.0,
              ),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    InputBox(
                      controller: _townController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'Full Name cannot be empty';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'Town',
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    InputBox(
                      controller: _cityController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'Neighbourhood cannot be empty';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'Neighbourhood',
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    InputBox(
                      controller: _stateController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'State cannot be empty';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'State',
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    InputBox(
                      controller: _descriptionController,
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'More Description',
                      inputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    SolidButton(
                      text: 'Submit',
                      onPressed: () async {
                        if (_formState.currentState.validate()) {
                          widget.complaintModel.date =
                              DateTime.now().toString();
                          widget.complaintModel.town = _townController.text;
                          widget.complaintModel.city = _cityController.text;
                          widget.complaintModel.state = _stateController.text;
                          widget.complaintModel.description =
                              _descriptionController.text;
                          Dialogs.showLoadingDialog(context, key: _dialogKey);
                          final _response = await complaintProvider
                              .fileComplaint(widget.complaintModel);
                          if (_response.status == true) {
                            Timer(Duration(seconds: 1), () {
                              displaySuccessSnick(
                                text: _response.message,
                                context: _dialogKey.currentContext,
                                scaffoldKey: _scaffoldKey,
                              );
                              Timer(Duration(seconds: 2), () {
                                ExtendedNavigator.of(context)
                                    .pushAndRemoveUntil(
                                        Routes.homeScreen, (route) => false);
                              });
                            });
                          } else {
                            Timer(Duration(seconds: 1), () {
                              displayErrorSnick(
                                error: _response.message,
                                context: _dialogKey.currentContext,
                                scaffoldKey: _scaffoldKey,
                              );
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
