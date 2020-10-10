
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/PAS/IndustrialMathematics.dart';

class IndustrialMathematicsNotifier with ChangeNotifier {
  List<IndustrialMathematics> _industrialMathematicsList = [];
  IndustrialMathematics _currentIndustrialMathematics;

  UnmodifiableListView<IndustrialMathematics> get industrialMathematicsList => UnmodifiableListView(_industrialMathematicsList);

  IndustrialMathematics get currentIndustrialMathematics => _currentIndustrialMathematics;

  set industrialMathematicsList(List<IndustrialMathematics> industrialMathematicsList) {
    _industrialMathematicsList = industrialMathematicsList;
    notifyListeners();
  }

  set currentIndustrialMathematics(IndustrialMathematics industrialMathematics) {
    _currentIndustrialMathematics = industrialMathematics;
    notifyListeners();
  }

}