
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/Geophysics.dart';
import '../../notifier/PAS_NOTIFIER/geophysics_graduates_notifier.dart';

getGeophysics(GeophysicsNotifier geophysicsNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Geophysics').orderBy("name").get();

  List<Geophysics> _geophysicsList = [];

  snapshot.docs.forEach((document) {
    Geophysics geophysics = Geophysics.fromMap(document.data());
    _geophysicsList.add(geophysics);
  });

  geophysicsNotifier.geophysicsList = _geophysicsList;
}