
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CAS/CropScienceAndSoilScience.dart';
import '../../notifier/CAS_NOTIFIER/crop_science_and_soil_science_graduates_notifier.dart';

getCropScienceAndSoilScience(CropScienceAndSoilScienceNotifier cropScienceAndSoilScienceNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('CropScienceAndSoilScience').orderBy("name").get();

  List<CropScienceAndSoilScience> _cropScienceAndSoilScienceList = [];

  snapshot.docs.forEach((document) {
    CropScienceAndSoilScience cropScienceAndSoilScience = CropScienceAndSoilScience.fromMap(document.data());
    _cropScienceAndSoilScienceList.add(cropScienceAndSoilScience);
  });

  cropScienceAndSoilScienceNotifier.cropScienceAndSoilScienceList = _cropScienceAndSoilScienceList;
}