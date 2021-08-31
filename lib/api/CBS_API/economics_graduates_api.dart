
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/Economics.dart';
import '../../notifier/CBS_NOTIFIER/economics_graduates_notifier.dart';

getEconomics(EconomicsNotifier economicsNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Economics').orderBy("name").get();

  List<Economics> _economicsList = [];

  snapshot.docs.forEach((document) {
    Economics economics = Economics.fromMap(document.data());
    _economicsList.add(economics);
  });

  economicsNotifier.economicsList = _economicsList;
}