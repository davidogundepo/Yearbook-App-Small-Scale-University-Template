import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/COE/ChemicalEngineering.dart';
import '../../notifier/COE_NOTIFIER/chemical_engineering_graduates_notifier.dart';

Future<void> getChemicalEngineering(ChemicalEngineeringNotifier chemicalEngineeringNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('ChemicalEngineering').orderBy("name").get();

  List<ChemicalEngineering> _chemicalEngineeringList = [];

  for (var document in snapshot.docs) {
    ChemicalEngineering chemicalEngineering = ChemicalEngineering.fromMap(document.data() as Map<String, dynamic>);
    _chemicalEngineeringList.add(chemicalEngineering);
  }

  chemicalEngineeringNotifier.chemicalEngineeringList = _chemicalEngineeringList;
}
