import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/COE/AgriculturalAndBiosystemEngineering.dart';
import '../../notifier/COE_NOTIFIER/agricultural_and_biosystem_engineering_graduates_notifier.dart';

Future<void> getAgriculturalAndBiosystemEngineering(
    AgriculturalAndBiosystemEngineeringNotifier agriculturalAndBiosystemEngineeringNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('AgriculturalAndBiosystemEngineering').orderBy("name").get();

  List<AgriculturalAndBiosystemEngineering> _agriculturalAndBiosystemEngineeringList = [];

  for (var document in snapshot.docs) {
    AgriculturalAndBiosystemEngineering agriculturalAndBiosystemEngineering =
        AgriculturalAndBiosystemEngineering.fromMap(document.data() as Map<String, dynamic>);
    _agriculturalAndBiosystemEngineeringList.add(agriculturalAndBiosystemEngineering);
  }

  agriculturalAndBiosystemEngineeringNotifier.agriculturalAndBiosystemEngineeringList = _agriculturalAndBiosystemEngineeringList;
}
