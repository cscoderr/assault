import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final double textSize;
  final double elevation;
  final BorderSide border;
  SolidButton({
    this.text,
    this.onPressed,
    this.color,
    this.textColor = Colors.black,
    this.textSize = 20.0,
    this.elevation = 5.0,
    this.border = BorderSide.none,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      minWidth: double.infinity,
      onPressed: onPressed,
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.all(
          10.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w400,
            fontSize: textSize,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        side: border,
      ),
    );
  }
}
