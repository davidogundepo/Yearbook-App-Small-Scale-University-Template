
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/COE/AgriculturalAndBiosystemEngineering.dart';

class AgriculturalAndBiosystemEngineeringNotifier with ChangeNotifier {
  List<AgriculturalAndBiosystemEngineering> _agriculturalAndBiosystemEngineeringList = [];
  AgriculturalAndBiosystemEngineering _currentAgriculturalAndBiosystemEngineering;

  UnmodifiableListView<AgriculturalAndBiosystemEngineering> get agriculturalAndBiosystemEngineeringList => UnmodifiableListView(_agriculturalAndBiosystemEngineeringList);

  AgriculturalAndBiosystemEngineering get currentAgriculturalAndBiosystemEngineering => _currentAgriculturalAndBiosystemEngineering;

  set agriculturalAndBiosystemEngineeringList(List<AgriculturalAndBiosystemEngineering> agriculturalAndBiosystemEngineeringList) {
    _agriculturalAndBiosystemEngineeringList = agriculturalAndBiosystemEngineeringList;
    notifyListeners();
  }

  set currentAgriculturalAndBiosystemEngineering(AgriculturalAndBiosystemEngineering agriculturalAndBiosystemEngineering) {
    _currentAgriculturalAndBiosystemEngineering = agriculturalAndBiosystemEngineering;
    notifyListeners();
  }

}