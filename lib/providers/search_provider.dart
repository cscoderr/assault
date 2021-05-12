import 'package:flutter/cupertino.dart';

class SearchProvider with ChangeNotifier {
  bool _isSearchDone = false;
  bool _isRequestCompleted = false;

  bool get isSearchDone => _isSearchDone;
  bool get isRequestCompleted => _isRequestCompleted;

  set setSearchDone(bool value) => _isSearchDone = value;

  SearchProvider.initialize();
}
