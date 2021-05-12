import 'package:assault/ui/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String hintText;
  final String labelText;
  final IconData icon;
  final int maxLength;
  final List<TextInputFormatter> inputFormat;
  final ValueChanged<String> onSubmit;
  final TextInputType inputType;
  final bool isPassword;
  final double raduis;
  final BorderSide borderSide;
  final double iconSize;
  final bool isWritable;
  SearchBox(
      {this.controller,
      this.validator,
      this.hintText,
      this.labelText,
      this.icon,
      this.maxLength,
      this.inputFormat,
      this.onSubmit,
      this.inputType,
      this.isPassword = false,
      this.raduis = 15.0,
      this.borderSide = BorderSide.none,
      this.iconSize = 24.0,
      this.isWritable = true});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      enabled: isWritable,
      validator: validator,
      onFieldSubmitted: onSubmit,
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
          left: 20.0,
          bottom: 20.0,
          top: 10.0,
          right: 10.0,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: 25.0,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: this.iconSize,
          ),
        ),
      ),
    );
  }
}
