import 'package:flutter/material.dart';

class CityModel with ChangeNotifier {
  String _cityName = '';

  String get cityName => _cityName;

  void updateData(String newData) {
    _cityName = newData;
    notifyListeners();
  }

}
