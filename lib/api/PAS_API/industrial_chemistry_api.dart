
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/IndustrialChemistry.dart';
import '../../notifier/PAS_NOTIFIER/industrial_chemistry_graduates_notifier.dart';

getIndustrialChemistry(IndustrialChemistryNotifier industrialChemistryNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('IndustrialChemistry').orderBy("name").get();

  List<IndustrialChemistry> _industrialChemistryList = [];

  snapshot.docs.forEach((document) {
    IndustrialChemistry industrialChemistry = IndustrialChemistry.fromMap(document.data());
    _industrialChemistryList.add(industrialChemistry);
  });

  industrialChemistryNotifier.industrialChemistryList = _industrialChemistryList;
}