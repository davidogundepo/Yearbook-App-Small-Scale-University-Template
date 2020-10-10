
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CAS/AquacultureAndFisheriesManagement.dart';

class AquacultureAndFisheriesManagementNotifier with ChangeNotifier {
  List<AquacultureAndFisheriesManagement> _aquacultureAndFisheriesManagementList = [];
  AquacultureAndFisheriesManagement _currentAquacultureAndFisheriesManagement;

  UnmodifiableListView<AquacultureAndFisheriesManagement> get aquacultureAndFisheriesManagementList => UnmodifiableListView(_aquacultureAndFisheriesManagementList);

  AquacultureAndFisheriesManagement get currentAquacultureAndFisheriesManagement => _currentAquacultureAndFisheriesManagement;

  set aquacultureAndFisheriesManagementList(List<AquacultureAndFisheriesManagement> aquacultureAndFisheriesManagementList) {
    _aquacultureAndFisheriesManagementList = aquacultureAndFisheriesManagementList;
    notifyListeners();
  }

  set currentAquacultureAndFisheriesManagement(AquacultureAndFisheriesManagement aquacultureAndFisheriesManagement) {
    _currentAquacultureAndFisheriesManagement = aquacultureAndFisheriesManagement;
    notifyListeners();
  }

}