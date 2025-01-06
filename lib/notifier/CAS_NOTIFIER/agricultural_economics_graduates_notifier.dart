import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/CAS/AgriculturalEconomics.dart';

class AgriculturalEconomicsNotifier with ChangeNotifier {
  List<AgriculturalEconomics> _agriculturalEconomicsList = [];
  late AgriculturalEconomics _currentAgriculturalEconomics;

  UnmodifiableListView<AgriculturalEconomics> get agriculturalEconomicsList => UnmodifiableListView(_agriculturalEconomicsList);

  AgriculturalEconomics get currentAgriculturalEconomics => _currentAgriculturalEconomics;

  set agriculturalEconomicsList(List<AgriculturalEconomics> agriculturalEconomicsList) {
    _agriculturalEconomicsList = agriculturalEconomicsList;
    notifyListeners();
  }

  set currentAgriculturalEconomics(AgriculturalEconomics agriculturalEconomics) {
    _currentAgriculturalEconomics = agriculturalEconomics;
    notifyListeners();
  }
}
