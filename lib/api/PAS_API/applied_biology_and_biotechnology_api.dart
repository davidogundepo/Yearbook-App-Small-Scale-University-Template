
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/AppliedBiologyAndBiotechnology.dart';
import '../../notifier/PAS_NOTIFIER/applied_biology_and_biotechnology_graduates_notifier.dart';

getAppliedBiologyAndBiotechnology(AppliedBiologyAndBiotechnologyNotifier appliedBiologyAndBiotechnologyNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('AppliedBiologyAndBiotechnology').orderBy("name").get();

  List<AppliedBiologyAndBiotechnology> _appliedBiologyAndBiotechnologyList = [];

  snapshot.docs.forEach((document) {
    AppliedBiologyAndBiotechnology appliedBiologyAndBiotechnology = AppliedBiologyAndBiotechnology.fromMap(document.data());
    _appliedBiologyAndBiotechnologyList.add(appliedBiologyAndBiotechnology);
  });

  appliedBiologyAndBiotechnologyNotifier.appliedBiologyAndBiotechnologyList = _appliedBiologyAndBiotechnologyList;
}