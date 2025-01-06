import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/COE/ChemicalEngineering.dart';

class ChemicalEngineeringNotifier with ChangeNotifier {
  List<ChemicalEngineering> _chemicalEngineeringList = [];
  late ChemicalEngineering _currentChemicalEngineering;

  UnmodifiableListView<ChemicalEngineering> get chemicalEngineeringList => UnmodifiableListView(_chemicalEngineeringList);

  ChemicalEngineering get currentChemicalEngineering => _currentChemicalEngineering;

  set chemicalEngineeringList(List<ChemicalEngineering> chemicalEngineeringList) {
    _chemicalEngineeringList = chemicalEngineeringList;
    notifyListeners();
  }

  set currentChemicalEngineering(ChemicalEngineering chemicalEngineering) {
    _currentChemicalEngineering = chemicalEngineering;
    notifyListeners();
  }
}
