import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/PAS/Microbiology.dart';
import '../../notifier/PAS_NOTIFIER/microbiology_graduates_notifier.dart';

Future<void> getMicrobiology(MicrobiologyNotifier microbiologyNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('Microbiology').orderBy("name").get();

  List<Microbiology> _microbiologyList = [];

  for (var document in snapshot.docs) {
    Microbiology microbiology = Microbiology.fromMap(document.data() as Map<String, dynamic>);
    _microbiologyList.add(microbiology);
  }

  microbiologyNotifier.microbiologyList = _microbiologyList;
}
