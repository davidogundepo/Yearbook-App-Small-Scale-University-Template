import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/COE/CivilEngineering.dart';
import '../../notifier/COE_NOTIFIER/civil_engineering_graduates_notifier.dart';

Future<void> getCivilEngineering(CivilEngineeringNotifier civilEngineeringNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('CivilEngineering').orderBy("name").get();

  List<CivilEngineering> _civilEngineeringList = [];

  for (var document in snapshot.docs) {
    CivilEngineering civilEngineering = CivilEngineering.fromMap(document.data() as Map<String, dynamic>);
    _civilEngineeringList.add(civilEngineering);
  }

  civilEngineeringNotifier.civilEngineeringList = _civilEngineeringList;
}
