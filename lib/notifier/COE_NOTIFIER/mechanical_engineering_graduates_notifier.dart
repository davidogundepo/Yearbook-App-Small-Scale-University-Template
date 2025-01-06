import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/COE/MechanicalEngineering.dart';

class MechanicalEngineeringNotifier with ChangeNotifier {
  List<MechanicalEngineering> _mechanicalEngineeringList = [];
  late MechanicalEngineering _currentMechanicalEngineering;

  UnmodifiableListView<MechanicalEngineering> get mechanicalEngineeringList => UnmodifiableListView(_mechanicalEngineeringList);

  MechanicalEngineering get currentMechanicalEngineering => _currentMechanicalEngineering;

  set mechanicalEngineeringList(List<MechanicalEngineering> mechanicalEngineeringList) {
    _mechanicalEngineeringList = mechanicalEngineeringList;
    notifyListeners();
  }

  set currentMechanicalEngineering(MechanicalEngineering mechanicalEngineering) {
    _currentMechanicalEngineering = mechanicalEngineering;
    notifyListeners();
  }
}
