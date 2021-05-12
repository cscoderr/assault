import 'package:assault/models/complaint_model.dart';
import 'package:assault/models/response_message_model.dart';
import 'package:assault/services/network_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComplaintProvider with ChangeNotifier {
  ComplaintModel _complaintModel;
  bool _isSearchDone = false;
  bool _isRequestCompleted = false;
  String _searchString = "Enter your search";
  SharedPreferences prefs;
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();
  String _gender = 'Gender';
  String _eyeColor = 'Eye Color';
  String _hairColor = 'Hair Color';
  String _skinColor = 'Skin Color';
  String _ageApprox = 'Age';
  String _ethnicity = 'Ethnicity';
  bool _hasTatoo = false;
  bool _facialHair = false;
  int _numOfComplaint = 0;
  final List<String> _ageApproxList = [
    'Age',
    '18-25',
    '26-30',
    '31-45',
    '46-60',
    '61+',
  ];

  final List<String> _genderList = <String>[
    'Gender',
    'Male',
    'Female',
  ];

  final List<String> _eyeColorList = <String>[
    'Eye Color',
    'Black',
    'Brown',
    'Blue',
    'Green',
    'Others'
  ];

  final List<String> _hairColorList = <String>[
    'Hair Color',
    'Black',
    'Blonde',
    'Red',
    'Others'
  ];

  final List<String> _skinColorList = <String>[
    'Skin Color',
    'Dark',
    'Brown',
    'Light-Skinned',
    'White',
    'Others'
  ];

  final List<String> _ethnicityList = <String>[
    'Ethnicity',
    'White/European',
    'Black/African',
    'American_Indian',
    'Alaska_Native',
    'Asian_American',
    'Native_Hawalian',
    'Hispanic/Latino'
  ];

  ComplaintModel get complaintModel => _complaintModel;

  bool get isSearchDone => _isSearchDone;

  bool get isRequestCompleted => _isRequestCompleted;

  String get isSearchString => _searchString;

  List<String> get genderList => _genderList;

  List<String> get eyeColorList => _eyeColorList;

  List<String> get hairColorList => _hairColorList;

  List<String> get skinColorList => _skinColorList;

  List<String> get ageApproxList => _ageApproxList;

  List<String> get ethnicityList => _ethnicityList;

  bool get hasTatoo => _hasTatoo;

  bool get facialHair => _facialHair;

  String get gender => _gender;
  String get eyeColor => _eyeColor;
  String get hairColor => _hairColor;
  String get skinColor => _skinColor;
  String get ageApprox => _ageApprox;
  String get ethnicity => _ethnicity;
  int get numOfComplaint => _numOfComplaint;
  // set setSearchDone(bool value) => _isSearchDone = value;
  //
  // set setRequestCompleted(bool value) => _isRequestCompleted = value;
  //
  // set setsearchString(String value) => _searchString = value;

  set searchDone(bool value) {
    _isSearchDone = value;
    notifyListeners();
  }

  set requestCompleted(bool value) {
    _isRequestCompleted = value;
    notifyListeners();
  }

  set searchString(String value) {
    _searchString = value;
    notifyListeners();
  }

  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  set eyeColor(String value) {
    _eyeColor = value;
    notifyListeners();
  }

  set hairColor(String value) {
    _hairColor = value;
    notifyListeners();
  }

  set skinColor(String value) {
    _skinColor = value;
    notifyListeners();
  }

  set ageApprox(String value) {
    _ageApprox = value;
    notifyListeners();
  }

  set hasTatoo(bool value) {
    _hasTatoo = value;
    notifyListeners();
  }

  set facialHair(bool value) {
    _facialHair = value;
    notifyListeners();
  }

  set ethnicity(String value) {
    _ethnicity = value;
    notifyListeners();
  }

  ComplaintProvider.initialize() {
    _complaintModel = ComplaintModel();
    _isSearchDone = false;
  }

  Future<dynamic> fileComplaint(ComplaintModel complaintModel) async {
    prefs = await _sharedPreferences;
    String token = prefs.getString("access_token");
    final _responseMessageModel =
        await NetworkServices.fileComplaint(complaintModel, token: token);
    return _responseMessageModel;
  }

  Future<ComplaintModel> myComplaint() async {
    prefs = await _sharedPreferences;
    String token = prefs.getString("access_token");
    final _complaintModel = await NetworkServices.complaintList(token: token);
    return _complaintModel;
  }

  Future<ComplaintModel> complaintDetails(String complaintId) async {
    prefs = await _sharedPreferences;
    String token = prefs.getString("access_token");
    final _complaintDetailsModel =
        await NetworkServices.complaintDetails(complaintId, token: token);
    return _complaintDetailsModel;
  }

  totalComplaint() async {
    prefs = await _sharedPreferences;
    String token = prefs.getString("access_token");
    print(prefs.getString('access_token'));
    final _responseMessageModel =
        await NetworkServices.totalComplaint(token: token);
    if (_responseMessageModel.status == true &&
        _responseMessageModel.data != null) {
      _numOfComplaint =
          int.parse(_responseMessageModel.data['count'].toString());
      notifyListeners();
    } else {
      _numOfComplaint = 0;
      notifyListeners();
    }
  }

  Future<ComplaintModel> searchComplaint(String keyword) async {
    prefs = await _sharedPreferences;
    String token = prefs.getString("access_token").toString();
    final _complaintModel =
        await NetworkServices.searchComplaint(keyword: keyword, token: token);
    return _complaintModel;
  }
}
