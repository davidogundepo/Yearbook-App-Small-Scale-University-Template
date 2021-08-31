
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/COE/ElectricalAndInformationEngineering.dart';
import '../../notifier/COE_NOTIFIER/electrical_and_information_engineering_graduates_notifier.dart';

getElectricalAndInformationEngineering(ElectricalAndInformationEngineeringNotifier electricalAndInformationEngineeringNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('ElectricalAndInformationEngineering').orderBy("name").get();

  List<ElectricalAndInformationEngineering> _electricalAndInformationEngineeringList = [];

  snapshot.docs.forEach((document) {
    ElectricalAndInformationEngineering electricalAndInformationEngineering = ElectricalAndInformationEngineering.fromMap(document.data());
    _electricalAndInformationEngineeringList.add(electricalAndInformationEngineering);
  });

  electricalAndInformationEngineeringNotifier.electricalAndInformationEngineeringList = _electricalAndInformationEngineeringList;
}