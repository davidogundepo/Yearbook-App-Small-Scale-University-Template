import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/UniversityArial.dart';
import '../notifier/university_arial_images_notifier.dart';

Future<void> getUniversityArial(UniversityArialNotifier universityArialNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('UniversityArialViews').get();

  List<UniversityArial> _universityArialList = [];

  for (var document in snapshot.docs) {
    UniversityArial universityArial = UniversityArial.fromMap(document.data() as Map<String, dynamic>);
    _universityArialList.add(universityArial);
  }

  universityArialNotifier.universityArialList = _universityArialList;
}
