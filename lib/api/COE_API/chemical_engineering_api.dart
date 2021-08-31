
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/COE/ChemicalEngineering.dart';
import '../../notifier/COE_NOTIFIER/chemical_engineering_graduates_notifier.dart';

getChemicalEngineering(ChemicalEngineeringNotifier chemicalEngineeringNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('ChemicalEngineering').orderBy("name").get();

  List<ChemicalEngineering> _chemicalEngineeringList = [];

  snapshot.docs.forEach((document) {
    ChemicalEngineering chemicalEngineering = ChemicalEngineering.fromMap(document.data());
    _chemicalEngineeringList.add(chemicalEngineering);
  });

  chemicalEngineeringNotifier.chemicalEngineeringList = _chemicalEngineeringList;
}