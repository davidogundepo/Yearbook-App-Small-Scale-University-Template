import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/PAS/Biochemistry.dart';
import '../../notifier/PAS_NOTIFIER/biochemistry_graduates_notifier.dart';

Future<void> getBiochemistry(BiochemistryNotifier biochemistryNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('Biochemistry').orderBy("name").get();

  List<Biochemistry> _biochemistryList = [];

  for (var document in snapshot.docs) {
    Biochemistry biochemistry = Biochemistry.fromMap(document.data() as Map<String, dynamic>);
    _biochemistryList.add(biochemistry);
  }

  biochemistryNotifier.biochemistryList = _biochemistryList;
}
