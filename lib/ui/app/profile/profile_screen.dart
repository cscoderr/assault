import 'package:assault/providers/user_provider.dart';
import 'package:assault/ui/core/show_snicks.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 50.0,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.person,
                size: 50.0,
              ),
            ),
            SizedBox(
              height: SizeConfig.minBlockVertical * 3.0,
            ),
            Text(
              '${_userProvider.user.firstName.toUpperCase()}',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            Text(
              '${_userProvider.user.email}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Divider(),
            if (!_userProvider.isAnonymousLogin) ...[
              SizedBox(
                height: SizeConfig.minBlockVertical * 5.0,
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    ExtendedNavigator.of(context)
                        .push(Routes.editProfileScreen);
                  },
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    ExtendedNavigator.of(context)
                        .push(Routes.changePasswordScreen);
                  },
                  title: Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
            SizedBox(
              height: SizeConfig.minBlockVertical * 5.0,
            ),
            Card(
              child: ListTile(
                onTap: () {
                  _userProvider.logout().then((value) {
                    if (value) {
                      ExtendedNavigator.of(context).pushAndRemoveUntil(
                          Routes.loginScreen, (route) => false);
                    }
                  });
                },
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
