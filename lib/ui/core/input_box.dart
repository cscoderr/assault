import 'package:assault/ui/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputBox extends StatelessWidget {
  TextEditingController controller;
  FormFieldValidator<String> validator;
  final String hintText;
  final String labelText;
  final IconData icon;
  int maxLength;
  List<TextInputFormatter> inputFormat;
  final TextInputType inputType;
  final bool isPassword;
  final double raduis;
  final BorderSide borderSide;
  final double iconSize;
  final bool isWritable;
  final VoidCallback onIconClick;
  InputBox(
      {this.controller,
      this.validator,
      this.hintText,
      this.labelText,
      this.icon,
      this.maxLength,
      this.inputFormat,
      this.inputType,
      this.isPassword = false,
      this.raduis = 15.0,
      this.borderSide = BorderSide.none,
      this.iconSize = 24.0,
      this.isWritable = true,
      this.onIconClick});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      enabled: isWritable,
      validator: validator,
      inputFormatters: inputFormat,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      maxLength: maxLength,
      obscureText: isPassword,
      style: TextStyle(
        color: kBlackColor,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: kBlackColor,
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: kSecondaryColor,
        ),
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            this.raduis,
          ),
          borderSide: this.borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            this.raduis,
          ),
          borderSide: this.borderSide,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            this.raduis,
          ),
          borderSide: this.borderSide,
        ),
        contentPadding: EdgeInsets.only(
          left: 25.0,
          bottom: 20.0,
          top: 20.0,
          right: 25.0,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: 25.0,
          ),
          child: GestureDetector(
            onTap: onIconClick,
            child: Icon(
              icon,
              color: Colors.grey,
              size: this.iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
