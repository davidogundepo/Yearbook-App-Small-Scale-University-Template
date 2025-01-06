import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/PAS/Biochemistry.dart';

class BiochemistryNotifier with ChangeNotifier {
  List<Biochemistry> _biochemistryList = [];
  late Biochemistry _currentBiochemistry;

  UnmodifiableListView<Biochemistry> get biochemistryList => UnmodifiableListView(_biochemistryList);

  Biochemistry get currentBiochemistry => _currentBiochemistry;

  set biochemistryList(List<Biochemistry> biochemistryList) {
    _biochemistryList = biochemistryList;
    notifyListeners();
  }

  set currentBiochemistry(Biochemistry biochemistry) {
    _currentBiochemistry = biochemistry;
    notifyListeners();
  }
}
