import 'package:assault/providers/user_provider.dart';
import 'package:assault/ui/core/custom_appbar.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplaintScreen extends StatefulWidget {
  ComplaintScreen({Key key}) : super(key: key);

  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 50.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
            title: 'Complaints',
            hasBack: false,
          ),
          SizedBox(
            height: SizeConfig.minBlockVertical * 3.0,
          ),
          GestureDetector(
            onTap: () {
              ExtendedNavigator.of(context).push(Routes.addComplaintScreen);
            },
            child: Container(
              height: 120.0,
              decoration: BoxDecoration(
                color: Color(0xFFFA6A22),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: kWhiteColor,
                    size: 30.0,
                  ),
                  SizedBox(
                    height: SizeConfig.minBlockVertical,
                  ),
                  Text(
                    'Add complaint',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!_userProvider.isAnonymousLogin) ...[
            SizedBox(
              height: SizeConfig.minBlockVertical * 2.0,
            ),
            GestureDetector(
              onTap: () {
                ExtendedNavigator.of(context).push(Routes.listComplaintScreen);
              },
              child: Container(
                height: 120.0,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.list,
                      color: kWhiteColor,
                      size: 30.0,
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical,
                    ),
                    Text(
                      'My complaint',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
