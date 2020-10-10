
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/UniversityArial.dart';

class UniversityArialNotifier with ChangeNotifier {
  List<UniversityArial> _universityArialList = [];
  UniversityArial _currentUniversityArial;

  UnmodifiableListView<UniversityArial> get universityArialList => UnmodifiableListView(_universityArialList);

  UniversityArial get currentUniversityArial => _currentUniversityArial;

  set universityArialList(List<UniversityArial> universityArialList) {
    _universityArialList = universityArialList;
    notifyListeners();
  }

  set currentUniversityArial(UniversityArial universityArial) {
    _currentUniversityArial = universityArial;
    notifyListeners();
  }

}