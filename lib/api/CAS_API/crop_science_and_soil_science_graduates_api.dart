import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CAS/CropScienceAndSoilScience.dart';
import '../../notifier/CAS_NOTIFIER/crop_science_and_soil_science_graduates_notifier.dart';

Future<void> getCropScienceAndSoilScience(CropScienceAndSoilScienceNotifier cropScienceAndSoilScienceNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('CropScienceAndSoilScience').orderBy("name").get();

  List<CropScienceAndSoilScience> _cropScienceAndSoilScienceList = [];

  for (var document in snapshot.docs) {
    CropScienceAndSoilScience cropScienceAndSoilScience = CropScienceAndSoilScience.fromMap(document.data() as Map<String, dynamic>);
    _cropScienceAndSoilScienceList.add(cropScienceAndSoilScience);
  }

  cropScienceAndSoilScienceNotifier.cropScienceAndSoilScienceList = _cropScienceAndSoilScienceList;
}
