
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/IndustrialChemistry.dart';
import '../../notifier/PAS_NOTIFIER/industrial_chemistry_graduates_notifier.dart';

getIndustrialChemistry(IndustrialChemistryNotifier industrialChemistryNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('IndustrialChemistry').orderBy("name").getDocuments();

  List<IndustrialChemistry> _industrialChemistryList = [];

  snapshot.documents.forEach((document) {
    IndustrialChemistry industrialChemistry = IndustrialChemistry.fromMap(document.data);
    _industrialChemistryList.add(industrialChemistry);
  });

  industrialChemistryNotifier.industrialChemistryList = _industrialChemistryList;
}