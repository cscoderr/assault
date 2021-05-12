import 'package:assault/models/complaint_model.dart';
import 'package:assault/providers/complaint_provider.dart';
import 'package:assault/ui/core/custom_appbar.dart';
import 'package:assault/ui/core/input_box.dart';
import 'package:assault/ui/core/select_box.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/solid_button.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddComplaintScreen extends StatefulWidget {
  AddComplaintScreen();

  @override
  _AddComplaintScreenState createState() => _AddComplaintScreenState();
}

class _AddComplaintScreenState extends State<AddComplaintScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _tattoDescriptionController =
      TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  //final _dialogKey = new GlobalKey<State>();
  ComplaintModel _complaintModel = ComplaintModel();

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
                title: 'Add Complaint',
              ),
              SizedBox(
                height: SizeConfig.minBlockVertical * 3.0,
              ),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    InputBox(
                      controller: _nameController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'Full Name cannot be empty';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'Full Name',
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    SelectBox(
                      value: complaintProvider.gender,
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty ||
                            value.trim().toString() == "Gender")
                          return 'Gender cannot be empty';
                        return null;
                      },
                      onChanged: (value) {
                        complaintProvider.gender = value;
                      },
                      items: complaintProvider.genderList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: new Text(item),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    InputBox(
                      controller: _heightController,
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'Height cannot be empty';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      labelText: 'Height',
                      inputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    SelectBox(
                      value: complaintProvider.ageApprox,
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty ||
                            value.trim().toString() == "Age")
                          return 'Age cannot be empty';
                        return null;
                      },
                      onChanged: (value) {
                        complaintProvider.ageApprox = value;
                      },
                      items: complaintProvider.ageApproxList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: new Text(item),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    SelectBox(
                      value: complaintProvider.eyeColor,
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty ||
                            value.trim().toString() == "Eye Color")
                          return 'Eye Color cannot be empty';
                        return null;
                      },
                      onChanged: (value) {
                        complaintProvider.eyeColor = value;
                      },
                      items: complaintProvider.eyeColorList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: new Text(item),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    if (1 == 2)
                      SelectBox(
                        value: complaintProvider.skinColor,
                        validator: (value) {
                          if (value.trim().isEmpty ||
                              value.trim().toString() == "Skin Color")
                            return 'Skin Color cannot be empty';
                          return null;
                        },
                        borderSide: BorderSide(
                          color: kSecondaryBorder,
                        ),
                        onChanged: (value) {
                          complaintProvider.skinColor = value;
                        },
                        items: complaintProvider.skinColorList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: new Text(item),
                          );
                        }).toList(),
                      ),
                    SelectBox(
                      value: complaintProvider.ethnicity,
                      validator: (value) {
                        if (value.trim().isEmpty ||
                            value.trim().toString() == "Ethnicity")
                          return 'Ethnicity cannot be empty';
                        return null;
                      },
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      onChanged: (value) {
                        complaintProvider.ethnicity = value;
                      },
                      items: complaintProvider.ethnicityList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: new Text(item),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    SelectBox(
                      value: complaintProvider.hairColor,
                      borderSide: BorderSide(
                        color: kSecondaryBorder,
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty ||
                            value.trim().toString() == "Hair Color")
                          return 'Hair Color cannot be empty';
                        return null;
                      },
                      onChanged: (value) {
                        complaintProvider.hairColor = value;
                      },
                      items: complaintProvider.hairColorList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: new Text(item),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 2.0,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: complaintProvider.facialHair,
                          onChanged: (value) {
                            complaintProvider.facialHair = value;
                          },
                        ),
                        SizedBox(
                          width: SizeConfig.minBlockVertical * 2.0,
                        ),
                        Text(
                          'Facial Hair',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 2.0,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: complaintProvider.hasTatoo,
                          onChanged: (value) {
                            complaintProvider.hasTatoo = value;
                          },
                        ),
                        SizedBox(
                          width: SizeConfig.minBlockVertical * 2.0,
                        ),
                        Text(
                          'Has Tatto',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    if (complaintProvider.hasTatoo) ...[
                      SizedBox(
                        height: SizeConfig.minBlockVertical * 2.0,
                      ),
                      InputBox(
                        controller: _tattoDescriptionController,
                        validator: (value) {
                          if (value.trim().isEmpty)
                            return 'Tatto Description cannot be empty';
                          return null;
                        },
                        borderSide: BorderSide(
                          color: kSecondaryBorder,
                        ),
                        labelText: 'Tatto Description',
                        inputType: TextInputType.text,
                      ),
                    ] else
                      Container(),
                    SizedBox(
                      height: SizeConfig.minBlockVertical * 5.0,
                    ),
                    SolidButton(
                      text: 'Next',
                      onPressed: () {
                        if (_formState.currentState.validate()) {
                          _complaintModel.fullName = _nameController.text;
                          _complaintModel.gender = complaintProvider.gender;
                          _complaintModel.height =
                              double.parse(_heightController.text.toString());
                          _complaintModel.ageApprox =
                              complaintProvider.ageApprox;
                          _complaintModel.eyeColor = complaintProvider.eyeColor;
                          _complaintModel.skinColor =
                              complaintProvider.skinColor;
                          _complaintModel.ethnicity =
                              complaintProvider.ethnicity;
                          _complaintModel.hairColor =
                              complaintProvider.hairColor;
                          _complaintModel.tattoo = complaintProvider.hasTatoo;
                          _complaintModel.facialHair =
                              complaintProvider.facialHair;
                          _complaintModel.tattooDescription =
                              _tattoDescriptionController.text;
                          ExtendedNavigator.of(context).push(
                            Routes.addComplaintScreenTwo,
                            arguments: AddComplaintScreenTwoArguments(
                              complaintModel: _complaintModel,
                            ),
                          );
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
