import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/PAS/IndustrialChemistry.dart';
import '../../notifier/PAS_NOTIFIER/industrial_chemistry_graduates_notifier.dart';

Future<void> getIndustrialChemistry(IndustrialChemistryNotifier industrialChemistryNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('IndustrialChemistry').orderBy("name").get();

  List<IndustrialChemistry> _industrialChemistryList = [];

  for (var document in snapshot.docs) {
    IndustrialChemistry industrialChemistry = IndustrialChemistry.fromMap(document.data() as Map<String, dynamic>);
    _industrialChemistryList.add(industrialChemistry);
  }

  industrialChemistryNotifier.industrialChemistryList = _industrialChemistryList;
}
