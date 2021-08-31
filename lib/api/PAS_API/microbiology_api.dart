
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/Microbiology.dart';
import '../../notifier/PAS_NOTIFIER/microbiology_graduates_notifier.dart';

getMicrobiology(MicrobiologyNotifier microbiologyNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Microbiology').orderBy("name").get();

  List<Microbiology> _microbiologyList = [];

  snapshot.docs.forEach((document) {
    Microbiology microbiology = Microbiology.fromMap(document.data());
    _microbiologyList.add(microbiology);
  });

  microbiologyNotifier.microbiologyList = _microbiologyList;
}