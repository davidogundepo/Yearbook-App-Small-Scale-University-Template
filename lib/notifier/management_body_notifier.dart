
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/ManagementBody.dart';

class ManagementBodyNotifier with ChangeNotifier {
  List<ManagementBody> _managementBodyList = [];
  ManagementBody _currentManagementBody;

  UnmodifiableListView<ManagementBody> get managementBodyList => UnmodifiableListView(_managementBodyList);

  ManagementBody get currentManagementBody => _currentManagementBody;

  set managementBodyList(List<ManagementBody> managementBodyList) {
    _managementBodyList = managementBodyList;
    notifyListeners();
  }

  set currentManagementBody(ManagementBody managementBody) {
    _currentManagementBody = managementBody;
    notifyListeners();
  }

}