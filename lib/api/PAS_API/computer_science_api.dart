import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/PAS/ComputerScience.dart';
import '../../notifier/PAS_NOTIFIER/computer_science_graduates_notifier.dart';

Future<void> getComputerScience(ComputerScienceNotifier computerScienceNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('ComputerScience').orderBy("name").get();

  List<ComputerScience> _computerScienceList = [];

  for (var document in snapshot.docs) {
    ComputerScience computerScience = ComputerScience.fromMap(document.data() as Map<String, dynamic>);
    _computerScienceList.add(computerScience);
  }

  computerScienceNotifier.computerScienceList = _computerScienceList;
}
