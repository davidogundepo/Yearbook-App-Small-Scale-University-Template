
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CBS/BankingAndFinance.dart';

class BankingAndFinanceNotifier with ChangeNotifier {
  List<BankingAndFinance> _bankingAndFinanceList = [];
  BankingAndFinance _currentBankingAndFinance;

  UnmodifiableListView<BankingAndFinance> get bankingAndFinanceList => UnmodifiableListView(_bankingAndFinanceList);

  BankingAndFinance get currentBankingAndFinance => _currentBankingAndFinance;

  set bankingAndFinanceList(List<BankingAndFinance> bankingAndFinanceList) {
    _bankingAndFinanceList = bankingAndFinanceList;
    notifyListeners();
  }

  set currentBankingAndFinance(BankingAndFinance bankingAndFinance) {
    _currentBankingAndFinance = bankingAndFinance;
    notifyListeners();
  }

}