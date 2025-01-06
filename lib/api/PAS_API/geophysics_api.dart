import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/PAS/Geophysics.dart';
import '../../notifier/PAS_NOTIFIER/geophysics_graduates_notifier.dart';

Future<void> getGeophysics(GeophysicsNotifier geophysicsNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('Geophysics').orderBy("name").get();

  List<Geophysics> _geophysicsList = [];

  for (var document in snapshot.docs) {
    Geophysics geophysics = Geophysics.fromMap(document.data() as Map<String, dynamic>);
    _geophysicsList.add(geophysics);
  }

  geophysicsNotifier.geophysicsList = _geophysicsList;
}
