import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CBS/BankingAndFinance.dart';
import '../../notifier/CBS_NOTIFIER/banking_and_finance_graduates_notifier.dart';

Future<void> getBankingAndFinance(BankingAndFinanceNotifier bankingAndFinanceNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('BankingAndFinance').orderBy("name").get();

  List<BankingAndFinance> _bankingAndFinanceList = [];

  for (var document in snapshot.docs) {
    BankingAndFinance bankingAndFinance = BankingAndFinance.fromMap(document.data() as Map<String, dynamic>);
    _bankingAndFinanceList.add(bankingAndFinance);
  }

  bankingAndFinanceNotifier.bankingAndFinanceList = _bankingAndFinanceList;
}
