import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/COE/CivilEngineering.dart';

class CivilEngineeringNotifier with ChangeNotifier {
  List<CivilEngineering> _civilEngineeringList = [];
  late CivilEngineering _currentCivilEngineering;

  UnmodifiableListView<CivilEngineering> get civilEngineeringList => UnmodifiableListView(_civilEngineeringList);

  CivilEngineering get currentCivilEngineering => _currentCivilEngineering;

  set civilEngineeringList(List<CivilEngineering> civilEngineeringList) {
    _civilEngineeringList = civilEngineeringList;
    notifyListeners();
  }

  set currentCivilEngineering(CivilEngineering civilEngineering) {
    _currentCivilEngineering = civilEngineering;
    notifyListeners();
  }
}
