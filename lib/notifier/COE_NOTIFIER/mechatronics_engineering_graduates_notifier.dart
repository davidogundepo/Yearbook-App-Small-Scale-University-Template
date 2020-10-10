
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/COE/MechatronicsEngineering.dart';

class MechatronicsEngineeringNotifier with ChangeNotifier {
  List<MechatronicsEngineering> _mechatronicsEngineeringList = [];
  MechatronicsEngineering _currentMechatronicsEngineering;

  UnmodifiableListView<MechatronicsEngineering> get mechatronicsEngineeringList => UnmodifiableListView(_mechatronicsEngineeringList);

  MechatronicsEngineering get currentMechatronicsEngineering => _currentMechatronicsEngineering;

  set mechatronicsEngineeringList(List<MechatronicsEngineering> mechatronicsEngineeringList) {
    _mechatronicsEngineeringList = mechatronicsEngineeringList;
    notifyListeners();
  }

  set currentMechatronicsEngineering(MechatronicsEngineering mechatronicsEngineering) {
    _currentMechatronicsEngineering = mechatronicsEngineering;
    notifyListeners();
  }

}