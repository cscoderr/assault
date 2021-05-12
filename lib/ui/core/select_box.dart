import 'package:assault/ui/core/styles.dart';
import 'package:flutter/material.dart';

class SelectBox extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final FormFieldValidator<dynamic> validator;
  final double radius;
  final dynamic value;
  final ValueChanged onChanged;
  final BorderSide borderSide;
  SelectBox({
    @required this.items,
    this.validator,
    this.radius = 15.0,
    this.value,
    this.onChanged,
    this.borderSide = BorderSide.none,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: this.value,
      items: this.items,
      isExpanded: true,
      validator: this.validator,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: kBlackColor,
        ),
        labelStyle: TextStyle(
          color: kSecondaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            this.radius,
          ),
          borderSide: this.borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            this.radius,
          ),
          borderSide: this.borderSide,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            this.radius,
          ),
          borderSide: this.borderSide,
        ),
        contentPadding: EdgeInsets.only(
          left: 25.0,
          bottom: 20.0,
          top: 20.0,
          right: 25.0,
        ),
      ),
      onChanged: onChanged,
      dropdownColor: kWhiteColor,
      style: TextStyle(
        color: kSecondaryTextColorColor2,
      ),
      iconEnabledColor: kSecondaryTextColorColor2,
    );
  }
}
