
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/PAS/IndustrialPhysics.dart';

class IndustrialPhysicsNotifier with ChangeNotifier {
  List<IndustrialPhysics> _industrialPhysicsList = [];
  IndustrialPhysics _currentIndustrialPhysics;

  UnmodifiableListView<IndustrialPhysics> get industrialPhysicsList => UnmodifiableListView(_industrialPhysicsList);

  IndustrialPhysics get currentIndustrialPhysics => _currentIndustrialPhysics;

  set industrialPhysicsList(List<IndustrialPhysics> industrialPhysicsList) {
    _industrialPhysicsList = industrialPhysicsList;
    notifyListeners();
  }

  set currentIndustrialPhysics(IndustrialPhysics industrialPhysics) {
    _currentIndustrialPhysics = industrialPhysics;
    notifyListeners();
  }

}