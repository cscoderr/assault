import 'package:assault/models/analytic_model.dart';
import 'package:assault/providers/user_provider.dart';
import 'package:assault/services/network_services.dart';
import 'package:assault/ui/app/complaint/complaint_screen.dart';
import 'package:assault/ui/app/home/home_screen_body.dart';
import 'package:assault/ui/app/profile/profile_screen.dart';
import 'package:assault/ui/app/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex;
  List _pageList;
  final UserProvider _userProvider;
  Map<String, double> _analyticMapModel;
  SharedPreferences prefs;
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  int get currentIndex => _currentIndex;
  get currentPage => _pageList[_currentIndex];
  get analyticMapModel => _analyticMapModel;

  NavigationProvider(this._userProvider) {
    _currentIndex = 0;
    if (_userProvider != null) {
      print(_userProvider.isAnonymousLogin);
      if (!_userProvider.isAnonymousLogin) {
        _pageList = [
          HomeScreenBody(),
          ComplaintScreen(),
          SearchScreen(),
          ProfileScreen(),
        ];
      } else {
        _pageList = [
          HomeScreenBody(),
          ComplaintScreen(),
          ProfileScreen(),
        ];
      }
    } else {
      _pageList = [
        HomeScreenBody(),
        ComplaintScreen(),
        SearchScreen(),
        ProfileScreen(),
      ];
    }
  }

  // NavigationProvider.initialize() {
  //   _currentIndex = 1;
  //   _pageList = [
  //     SearchScreen(),
  //     HomeScreenBody(),
  //     ComplaintScreen(),
  //     ProfileScreen(),
  //   ];
  // }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  getChart() async {
    prefs = await _sharedPreferences;
    String token = prefs.getString("access_token").toString();
    final _analyticModel = await NetworkServices.getAnalytics(token: token);
    if (_analyticModel != null && _analyticModel.data != null) {
      _analyticMapModel = Map.fromIterable(_analyticModel.data,
          key: (key) => key.state,
          value: (value) => double.parse(value.count.toString()));
      notifyListeners();
    }
  }
}
