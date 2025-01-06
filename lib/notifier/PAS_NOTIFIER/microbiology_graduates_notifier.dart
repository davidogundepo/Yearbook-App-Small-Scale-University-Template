import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/PAS/Microbiology.dart';

class MicrobiologyNotifier with ChangeNotifier {
  List<Microbiology> _microbiologyList = [];
  late Microbiology _currentMicrobiology;

  UnmodifiableListView<Microbiology> get microbiologyList => UnmodifiableListView(_microbiologyList);

  Microbiology get currentMicrobiology => _currentMicrobiology;

  set microbiologyList(List<Microbiology> microbiologyList) {
    _microbiologyList = microbiologyList;
    notifyListeners();
  }

  set currentMicrobiology(Microbiology microbiology) {
    _currentMicrobiology = microbiology;
    notifyListeners();
  }
}
