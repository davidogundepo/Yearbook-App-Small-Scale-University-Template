import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CBS/PoliticalScience.dart';
import '../../notifier/CBS_NOTIFIER/political_science_graduates_notifier.dart';

Future<void> getPoliticalScience(PoliticalScienceNotifier politicalScienceNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('PoliticalScience').orderBy("name").get();

  List<PoliticalScience> _politicalScienceList = [];

  for (var document in snapshot.docs) {
    PoliticalScience politicalScience = PoliticalScience.fromMap(document.data() as Map<String, dynamic>);
    _politicalScienceList.add(politicalScience);
  }

  politicalScienceNotifier.politicalScienceList = _politicalScienceList;
}
