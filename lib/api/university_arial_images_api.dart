
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/UniversityArial.dart';
import '../notifier/university_arial_images_notifier.dart';

getUniversityArial(UniversityArialNotifier universityArialNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('UniversityArial').getDocuments();

  List<UniversityArial> _universityArialList = [];

  snapshot.documents.forEach((document) {
    UniversityArial universityArial = UniversityArial.fromMap(document.data);
    _universityArialList.add(universityArial);
  });

  universityArialNotifier.universityArialList = _universityArialList;
}