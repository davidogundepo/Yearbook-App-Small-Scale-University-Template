import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/COE/MechanicalEngineering.dart';
import '../../notifier/COE_NOTIFIER/mechanical_engineering_graduates_notifier.dart';

Future<void> getMechanicalEngineering(MechanicalEngineeringNotifier mechanicalEngineeringNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('MechanicalEngineering').orderBy("name").get();

  List<MechanicalEngineering> _mechanicalEngineeringList = [];

  for (var document in snapshot.docs) {
    MechanicalEngineering mechanicalEngineering = MechanicalEngineering.fromMap(document.data() as Map<String, dynamic>);
    _mechanicalEngineeringList.add(mechanicalEngineering);
  }

  mechanicalEngineeringNotifier.mechanicalEngineeringList = _mechanicalEngineeringList;
}
