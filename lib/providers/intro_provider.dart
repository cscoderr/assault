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
          imagePath: 'tommy',
          title: 'Report any assualt',
          content: 'Report yes yes yes'),
      IntroModel(
          imagePath: 'tommy',
          title: 'Report any assualt',
          content: 'Report yes yes yes'),
    ];
  }

  setIndex(index) {
    _currentIndex = index;
  }
}
