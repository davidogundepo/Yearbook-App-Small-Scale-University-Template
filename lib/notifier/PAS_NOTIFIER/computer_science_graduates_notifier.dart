
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/PAS/ComputerScience.dart';

class ComputerScienceNotifier with ChangeNotifier {
  List<ComputerScience> _computerScienceList = [];
  ComputerScience _currentComputerScience;

  UnmodifiableListView<ComputerScience> get computerScienceList => UnmodifiableListView(_computerScienceList);

  ComputerScience get currentComputerScience => _currentComputerScience;

  set computerScienceList(List<ComputerScience> computerScienceList) {
    _computerScienceList = computerScienceList;
    notifyListeners();
  }

  set currentComputerScience(ComputerScience computerScience) {
    _currentComputerScience = computerScience;
    notifyListeners();
  }

}