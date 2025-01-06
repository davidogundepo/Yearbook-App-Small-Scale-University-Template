import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/COE/MechatronicsEngineering.dart';
import '../../notifier/COE_NOTIFIER/mechatronics_engineering_graduates_notifier.dart';

Future<void> getMechatronicsEngineering(MechatronicsEngineeringNotifier mechatronicsEngineeringNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('MechatronicsEngineering').orderBy("name").get();

  List<MechatronicsEngineering> _mechatronicsEngineeringList = [];

  for (var document in snapshot.docs) {
    MechatronicsEngineering mechatronicsEngineering = MechatronicsEngineering.fromMap(document.data() as Map<String, dynamic>);
    _mechatronicsEngineeringList.add(mechatronicsEngineering);
  }

  mechatronicsEngineeringNotifier.mechatronicsEngineeringList = _mechatronicsEngineeringList;
}
