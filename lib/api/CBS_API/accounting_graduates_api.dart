
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/Accounting.dart';
import '../../notifier/CBS_NOTIFIER/accounting_graduates_notifier.dart';

getAccounting(AccountingNotifier accountingNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Accounting').orderBy("name").get();

  List<Accounting> _accountingList = [];

  snapshot.docs.forEach((document) {
    Accounting accounting = Accounting.fromMap(document.data());
    _accountingList.add(accounting);
  });

  accountingNotifier.accountingList = _accountingList;
}