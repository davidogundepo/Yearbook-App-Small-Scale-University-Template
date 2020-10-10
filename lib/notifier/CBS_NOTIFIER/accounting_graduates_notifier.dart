
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CBS/Accounting.dart';

class AccountingNotifier with ChangeNotifier {
  List<Accounting> _accountingList = [];
  Accounting _currentAccounting;

  UnmodifiableListView<Accounting> get accountingList => UnmodifiableListView(_accountingList);

  Accounting get currentAccounting => _currentAccounting;

  set accountingList(List<Accounting> accountingList) {
    _accountingList = accountingList;
    notifyListeners();
  }

  set currentAccounting(Accounting accounting) {
    _currentAccounting = accounting;
    notifyListeners();
  }

}