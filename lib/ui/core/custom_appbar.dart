import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool hasBack;
  CustomAppBar({this.title, this.hasBack = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (hasBack)
            ? GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 5.0,
                    top: 5.0,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 30.0,
                    minHeight: 30.0,
                    maxWidth: 50.0,
                    maxHeight: 50.0,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    border: Border.all(color: kPrimaryBorder),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.navigate_before,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              )
            : Container(),
        SizedBox(
          width: SizeConfig.minBlockHorizontal * 5.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
