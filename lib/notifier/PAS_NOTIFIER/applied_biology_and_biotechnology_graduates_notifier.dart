import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/PAS/AppliedBiologyAndBiotechnology.dart';

class AppliedBiologyAndBiotechnologyNotifier with ChangeNotifier {
  List<AppliedBiologyAndBiotechnology> _appliedBiologyAndBiotechnologyList = [];
  late AppliedBiologyAndBiotechnology _currentAppliedBiologyAndBiotechnology;

  UnmodifiableListView<AppliedBiologyAndBiotechnology> get appliedBiologyAndBiotechnologyList =>
      UnmodifiableListView(_appliedBiologyAndBiotechnologyList);

  AppliedBiologyAndBiotechnology get currentAppliedBiologyAndBiotechnology => _currentAppliedBiologyAndBiotechnology;

  set appliedBiologyAndBiotechnologyList(List<AppliedBiologyAndBiotechnology> appliedBiologyAndBiotechnologyList) {
    _appliedBiologyAndBiotechnologyList = appliedBiologyAndBiotechnologyList;
    notifyListeners();
  }

  set currentAppliedBiologyAndBiotechnology(AppliedBiologyAndBiotechnology appliedBiologyAndBiotechnology) {
    _currentAppliedBiologyAndBiotechnology = appliedBiologyAndBiotechnology;
    notifyListeners();
  }
}
