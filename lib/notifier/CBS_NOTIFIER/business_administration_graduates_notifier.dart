
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CBS/BusinessAdministration.dart';

class BusinessAdministrationNotifier with ChangeNotifier {
  List<BusinessAdministration> _businessAdministrationList = [];
  BusinessAdministration _currentBusinessAdministration;

  UnmodifiableListView<BusinessAdministration> get businessAdministrationList => UnmodifiableListView(_businessAdministrationList);

  BusinessAdministration get currentBusinessAdministration => _currentBusinessAdministration;

  set businessAdministrationList(List<BusinessAdministration> businessAdministrationList) {
    _businessAdministrationList = businessAdministrationList;
    notifyListeners();
  }

  set currentBusinessAdministration(BusinessAdministration businessAdministration) {
    _currentBusinessAdministration = businessAdministration;
    notifyListeners();
  }

}