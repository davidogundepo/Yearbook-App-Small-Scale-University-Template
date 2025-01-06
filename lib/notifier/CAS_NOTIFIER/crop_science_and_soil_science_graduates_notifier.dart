import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/CAS/CropScienceAndSoilScience.dart';

class CropScienceAndSoilScienceNotifier with ChangeNotifier {
  List<CropScienceAndSoilScience> _cropScienceAndSoilScienceList = [];
  late CropScienceAndSoilScience _currentCropScienceAndSoilScience;

  UnmodifiableListView<CropScienceAndSoilScience> get cropScienceAndSoilScienceList => UnmodifiableListView(_cropScienceAndSoilScienceList);

  CropScienceAndSoilScience get currentCropScienceAndSoilScience => _currentCropScienceAndSoilScience;

  set cropScienceAndSoilScienceList(List<CropScienceAndSoilScience> cropScienceAndSoilScienceList) {
    _cropScienceAndSoilScienceList = cropScienceAndSoilScienceList;
    notifyListeners();
  }

  set currentCropScienceAndSoilScience(CropScienceAndSoilScience cropScienceAndSoilScience) {
    _currentCropScienceAndSoilScience = cropScienceAndSoilScience;
    notifyListeners();
  }
}
