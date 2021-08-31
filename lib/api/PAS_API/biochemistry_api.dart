
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/Biochemistry.dart';
import '../../notifier/PAS_NOTIFIER/biochemistry_graduates_notifier.dart';

getBiochemistry(BiochemistryNotifier biochemistryNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Biochemistry').orderBy("name").get();

  List<Biochemistry> _biochemistryList = [];

  snapshot.docs.forEach((document) {
    Biochemistry biochemistry = Biochemistry.fromMap(document.data());
    _biochemistryList.add(biochemistry);
  });

  biochemistryNotifier.biochemistryList = _biochemistryList;
}