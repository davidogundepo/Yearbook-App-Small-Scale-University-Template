
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/PAS/Geophysics.dart';

class GeophysicsNotifier with ChangeNotifier {
  List<Geophysics> _geophysicsList = [];
  Geophysics _currentGeophysics;

  UnmodifiableListView<Geophysics> get geophysicsList => UnmodifiableListView(_geophysicsList);

  Geophysics get currentGeophysics => _currentGeophysics;

  set geophysicsList(List<Geophysics> geophysicsList) {
    _geophysicsList = geophysicsList;
    notifyListeners();
  }

  set currentGeophysics(Geophysics geophysics) {
    _currentGeophysics = geophysics;
    notifyListeners();
  }

}