
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/PAS/IndustrialChemistry.dart';

class IndustrialChemistryNotifier with ChangeNotifier {
  List<IndustrialChemistry> _industrialChemistryList = [];
  IndustrialChemistry _currentIndustrialChemistry;

  UnmodifiableListView<IndustrialChemistry> get industrialChemistryList => UnmodifiableListView(_industrialChemistryList);

  IndustrialChemistry get currentIndustrialChemistry => _currentIndustrialChemistry;

  set industrialChemistryList(List<IndustrialChemistry> industrialChemistryList) {
    _industrialChemistryList = industrialChemistryList;
    notifyListeners();
  }

  set currentIndustrialChemistry(IndustrialChemistry industrialChemistry) {
    _currentIndustrialChemistry = industrialChemistry;
    notifyListeners();
  }

}