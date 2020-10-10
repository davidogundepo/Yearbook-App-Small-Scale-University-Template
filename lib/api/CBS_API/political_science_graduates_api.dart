
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/PoliticalScience.dart';
import '../../notifier/CBS_NOTIFIER/political_science_graduates_notifier.dart';

getPoliticalScience(PoliticalScienceNotifier politicalScienceNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('PoliticalScience').orderBy("name").getDocuments();

  List<PoliticalScience> _politicalScienceList = [];

  snapshot.documents.forEach((document) {
    PoliticalScience politicalScience = PoliticalScience.fromMap(document.data);
    _politicalScienceList.add(politicalScience);
  });

  politicalScienceNotifier.politicalScienceList = _politicalScienceList;
}