
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/ComputerScience.dart';
import '../../notifier/PAS_NOTIFIER/computer_science_graduates_notifier.dart';

getComputerScience(ComputerScienceNotifier computerScienceNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('ComputerScience').orderBy("name").getDocuments();

  List<ComputerScience> _computerScienceList = [];

  snapshot.documents.forEach((document) {
    ComputerScience computerScience = ComputerScience.fromMap(document.data);
    _computerScienceList.add(computerScience);
  });

  computerScienceNotifier.computerScienceList = _computerScienceList;
}