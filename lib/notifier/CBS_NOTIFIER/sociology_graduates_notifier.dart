
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CBS/Sociology.dart';

class SociologyNotifier with ChangeNotifier {
  List<Sociology> _sociologyList = [];
  Sociology _currentSociology;

  UnmodifiableListView<Sociology> get sociologyList => UnmodifiableListView(_sociologyList);

  Sociology get currentSociology => _currentSociology;

  set sociologyList(List<Sociology> sociologyList) {
    _sociologyList = sociologyList;
    notifyListeners();
  }

  set currentSociology(Sociology sociology) {
    _currentSociology = sociology;
    notifyListeners();
  }

}