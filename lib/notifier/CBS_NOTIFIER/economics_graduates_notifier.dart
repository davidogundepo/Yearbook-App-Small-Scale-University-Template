import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/CBS/Economics.dart';

class EconomicsNotifier with ChangeNotifier {
  List<Economics> _economicsList = [];
  late Economics _currentEconomics;

  UnmodifiableListView<Economics> get economicsList => UnmodifiableListView(_economicsList);

  Economics get currentEconomics => _currentEconomics;

  set economicsList(List<Economics> economicsList) {
    _economicsList = economicsList;
    notifyListeners();
  }

  set currentEconomics(Economics economics) {
    _currentEconomics = economics;
    notifyListeners();
  }
}
