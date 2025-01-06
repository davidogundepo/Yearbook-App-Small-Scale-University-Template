import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CBS/Economics.dart';
import '../../notifier/CBS_NOTIFIER/economics_graduates_notifier.dart';

Future<void> getEconomics(EconomicsNotifier economicsNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('Economics').orderBy("name").get();

  List<Economics> _economicsList = [];

  for (var document in snapshot.docs) {
    Economics economics = Economics.fromMap(document.data() as Map<String, dynamic>);
    _economicsList.add(economics);
  }

  economicsNotifier.economicsList = _economicsList;
}
