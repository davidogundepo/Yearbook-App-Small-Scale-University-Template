
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/COE/MechatronicsEngineering.dart';
import '../../notifier/COE_NOTIFIER/mechatronics_engineering_graduates_notifier.dart';

getMechatronicsEngineering(MechatronicsEngineeringNotifier mechatronicsEngineeringNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('MechatronicsEngineering').orderBy("name").getDocuments();

  List<MechatronicsEngineering> _mechatronicsEngineeringList = [];

  snapshot.documents.forEach((document) {
    MechatronicsEngineering mechatronicsEngineering = MechatronicsEngineering.fromMap(document.data);
    _mechatronicsEngineeringList.add(mechatronicsEngineering);
  });

  mechatronicsEngineeringNotifier.mechatronicsEngineeringList = _mechatronicsEngineeringList;
}