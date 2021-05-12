import 'package:assault/models/intro_model.dart';
import 'package:flutter/cupertino.dart';

class IntroProvider with ChangeNotifier {
  List<IntroModel> _introModel;
  int _currentIndex;

  get introModel => _introModel;

  get currentIndex => _currentIndex;

  IntroProvider.initialize() {
    _currentIndex = 0;
    _introModel = [
      IntroModel(
          imagePath: 'assets/svgs/splash-save.svg',
          title: 'Rape',
          content: 'According to report rape is one of the crime'),
      IntroModel(
          imagePath: 'assets/svgs/splash-speed.svg',
          title: 'Human Trafficking',
          content: 'Human Trafficking is an act of traffickkdls'),
      IntroModel(
          imagePath: 'assets/svgs/splash-security.svg',
          title: 'Arrazement',
          content: 'Man women sl lsk skdjksdi osds posd so'),
    ];
  }

  setIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
