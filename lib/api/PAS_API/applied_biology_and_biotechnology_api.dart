
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/AppliedBiologyAndBiotechnology.dart';
import '../../notifier/PAS_NOTIFIER/applied_biology_and_biotechnology_graduates_notifier.dart';

getAppliedBiologyAndBiotechnology(AppliedBiologyAndBiotechnologyNotifier appliedBiologyAndBiotechnologyNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('AppliedBiologyAndBiotechnology').orderBy("name").getDocuments();

  List<AppliedBiologyAndBiotechnology> _appliedBiologyAndBiotechnologyList = [];

  snapshot.documents.forEach((document) {
    AppliedBiologyAndBiotechnology appliedBiologyAndBiotechnology = AppliedBiologyAndBiotechnology.fromMap(document.data);
    _appliedBiologyAndBiotechnologyList.add(appliedBiologyAndBiotechnology);
  });

  appliedBiologyAndBiotechnologyNotifier.appliedBiologyAndBiotechnologyList = _appliedBiologyAndBiotechnologyList;
}