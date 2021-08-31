
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/COE/ElectricalAndInformationEngineering.dart';

class ElectricalAndInformationEngineeringNotifier with ChangeNotifier {
  List<ElectricalAndInformationEngineering> _electricalAndInformationEngineeringList = [];
  ElectricalAndInformationEngineering _currentElectricalAndInformationEngineering;

  UnmodifiableListView<ElectricalAndInformationEngineering> get electricalAndInformationEngineeringList => UnmodifiableListView(_electricalAndInformationEngineeringList);

  ElectricalAndInformationEngineering get currentElectricalAndInformationEngineering => _currentElectricalAndInformationEngineering;

  set electricalAndInformationEngineeringList(List<ElectricalAndInformationEngineering> electricalAndInformationEngineeringList) {
    _electricalAndInformationEngineeringList = electricalAndInformationEngineeringList;
    notifyListeners();
  }

  set currentElectricalAndInformationEngineering(ElectricalAndInformationEngineering electricalAndInformationEngineering) {
    _currentElectricalAndInformationEngineering = electricalAndInformationEngineering;
    notifyListeners();
  }

}