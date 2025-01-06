import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/PAS/AppliedBiologyAndBiotechnology.dart';
import '../../notifier/PAS_NOTIFIER/applied_biology_and_biotechnology_graduates_notifier.dart';

Future<void> getAppliedBiologyAndBiotechnology(AppliedBiologyAndBiotechnologyNotifier appliedBiologyAndBiotechnologyNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('AppliedBiologyAndBiotechnology').orderBy("name").get();

  List<AppliedBiologyAndBiotechnology> _appliedBiologyAndBiotechnologyList = [];

  for (var document in snapshot.docs) {
    AppliedBiologyAndBiotechnology appliedBiologyAndBiotechnology = AppliedBiologyAndBiotechnology.fromMap(document.data() as Map<String, dynamic>);
    _appliedBiologyAndBiotechnologyList.add(appliedBiologyAndBiotechnology);
  }

  appliedBiologyAndBiotechnologyNotifier.appliedBiologyAndBiotechnologyList = _appliedBiologyAndBiotechnologyList;
}
