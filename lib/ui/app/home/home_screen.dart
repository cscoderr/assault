import 'package:assault/providers/navigation_provider.dart';
import 'package:assault/providers/user_provider.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAnonymousLogin = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      Provider.of<NavigationProvider>(context, listen: false)
          .setCurrentIndex(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final navigationProvider = Provider.of<NavigationProvider>(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationProvider.currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kBackgroundColor,
        unselectedLabelStyle: TextStyle(color: kBackgroundColor),
        showUnselectedLabels: true,
        onTap: (index) {
          navigationProvider.setCurrentIndex(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_in_talk), label: 'Complaint'),
          if (!userProvider.isAnonymousLogin)
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      body: SafeArea(
        child: navigationProvider.currentPage,
      ),
    );
  }
}
