import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CBS/Accounting.dart';
import '../../notifier/CBS_NOTIFIER/accounting_graduates_notifier.dart';

Future<void> getAccounting(AccountingNotifier accountingNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('Accounting').orderBy("name").get();

  List<Accounting> _accountingList = [];

  for (var document in snapshot.docs) {
    Accounting accounting = Accounting.fromMap(document.data() as Map<String, dynamic>);
    _accountingList.add(accounting);
  }

  accountingNotifier.accountingList = _accountingList;
}
