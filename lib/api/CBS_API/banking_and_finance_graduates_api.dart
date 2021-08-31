
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/BankingAndFinance.dart';
import '../../notifier/CBS_NOTIFIER/banking_and_finance_graduates_notifier.dart';

getBankingAndFinance(BankingAndFinanceNotifier bankingAndFinanceNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('BankingAndFinance').orderBy("name").get();

  List<BankingAndFinance> _bankingAndFinanceList = [];

  snapshot.docs.forEach((document) {
    BankingAndFinance bankingAndFinance = BankingAndFinance.fromMap(document.data());
    _bankingAndFinanceList.add(bankingAndFinance);
  });

  bankingAndFinanceNotifier.bankingAndFinanceList = _bankingAndFinanceList;
}