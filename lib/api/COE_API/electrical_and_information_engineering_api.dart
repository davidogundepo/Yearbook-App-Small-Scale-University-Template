import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/COE/ElectricalAndInformationEngineering.dart';
import '../../notifier/COE_NOTIFIER/electrical_and_information_engineering_graduates_notifier.dart';

Future<void> getElectricalAndInformationEngineering(
    ElectricalAndInformationEngineeringNotifier electricalAndInformationEngineeringNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('ElectricalAndInformationEngineering').orderBy("name").get();

  List<ElectricalAndInformationEngineering> _electricalAndInformationEngineeringList = [];

  for (var document in snapshot.docs) {
    ElectricalAndInformationEngineering electricalAndInformationEngineering =
        ElectricalAndInformationEngineering.fromMap(document.data() as Map<String, dynamic>);
    _electricalAndInformationEngineeringList.add(electricalAndInformationEngineering);
  }

  electricalAndInformationEngineeringNotifier.electricalAndInformationEngineeringList = _electricalAndInformationEngineeringList;
}
