
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/Sociology.dart';
import '../../notifier/CBS_NOTIFIER/sociology_graduates_notifier.dart';

getSociology(SociologyNotifier sociologyNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('Sociology').orderBy("name").getDocuments();

  List<Sociology> _sociologyList = [];

  snapshot.documents.forEach((document) {
    Sociology sociology = Sociology.fromMap(document.data);
    _sociologyList.add(sociology);
  });

  sociologyNotifier.sociologyList = _sociologyList;
}