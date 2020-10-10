
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CAS/AgriculturalExtensionAndRuralDevelopment.dart';

class AgriculturalExtensionAndRuralDevelopmentNotifier with ChangeNotifier {
  List<AgriculturalExtensionAndRuralDevelopment> _agriculturalExtensionAndRuralDevelopmentList = [];
  AgriculturalExtensionAndRuralDevelopment _currentAgriculturalExtensionAndRuralDevelopment;

  UnmodifiableListView<AgriculturalExtensionAndRuralDevelopment> get agriculturalExtensionAndRuralDevelopmentList => UnmodifiableListView(_agriculturalExtensionAndRuralDevelopmentList);

  AgriculturalExtensionAndRuralDevelopment get currentAgriculturalExtensionAndRuralDevelopment => _currentAgriculturalExtensionAndRuralDevelopment;

  set agriculturalExtensionAndRuralDevelopmentList(List<AgriculturalExtensionAndRuralDevelopment> agriculturalExtensionAndRuralDevelopmentList) {
    _agriculturalExtensionAndRuralDevelopmentList = agriculturalExtensionAndRuralDevelopmentList;
    notifyListeners();
  }

  set currentAgriculturalExtensionAndRuralDevelopment(AgriculturalExtensionAndRuralDevelopment agriculturalExtensionAndRuralDevelopment) {
    _currentAgriculturalExtensionAndRuralDevelopment = agriculturalExtensionAndRuralDevelopment;
    notifyListeners();
  }

}