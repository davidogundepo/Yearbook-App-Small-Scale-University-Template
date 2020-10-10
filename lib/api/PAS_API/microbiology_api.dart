
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/Microbiology.dart';
import '../../notifier/PAS_NOTIFIER/microbiology_graduates_notifier.dart';

getMicrobiology(MicrobiologyNotifier microbiologyNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('Microbiology').orderBy("name").getDocuments();

  List<Microbiology> _microbiologyList = [];

  snapshot.documents.forEach((document) {
    Microbiology microbiology = Microbiology.fromMap(document.data);
    _microbiologyList.add(microbiology);
  });

  microbiologyNotifier.microbiologyList = _microbiologyList;
}