
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/PoliticalScience.dart';
import '../../notifier/CBS_NOTIFIER/political_science_graduates_notifier.dart';

getPoliticalScience(PoliticalScienceNotifier politicalScienceNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PoliticalScience').orderBy("name").get();

  List<PoliticalScience> _politicalScienceList = [];

  snapshot.docs.forEach((document) {
    PoliticalScience politicalScience = PoliticalScience.fromMap(document.data());
    _politicalScienceList.add(politicalScience);
  });

  politicalScienceNotifier.politicalScienceList = _politicalScienceList;
}