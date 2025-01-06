import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CBS/Sociology.dart';
import '../../notifier/CBS_NOTIFIER/sociology_graduates_notifier.dart';

Future<void> getSociology(SociologyNotifier sociologyNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('Sociology').orderBy("name").get();

  List<Sociology> _sociologyList = [];

  for (var document in snapshot.docs) {
    Sociology sociology = Sociology.fromMap(document.data() as Map<String, dynamic>);
    _sociologyList.add(sociology);
  }

  sociologyNotifier.sociologyList = _sociologyList;
}
