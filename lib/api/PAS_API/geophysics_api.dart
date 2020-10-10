
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/Geophysics.dart';
import '../../notifier/PAS_NOTIFIER/geophysics_graduates_notifier.dart';

getGeophysics(GeophysicsNotifier geophysicsNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('Geophysics').orderBy("name").getDocuments();

  List<Geophysics> _geophysicsList = [];

  snapshot.documents.forEach((document) {
    Geophysics geophysics = Geophysics.fromMap(document.data);
    _geophysicsList.add(geophysics);
  });

  geophysicsNotifier.geophysicsList = _geophysicsList;
}