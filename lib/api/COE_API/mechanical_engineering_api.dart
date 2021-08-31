
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/COE/MechanicalEngineering.dart';
import '../../notifier/COE_NOTIFIER/mechanical_engineering_graduates_notifier.dart';

getMechanicalEngineering(MechanicalEngineeringNotifier mechanicalEngineeringNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('MechanicalEngineering').orderBy("name").get();

  List<MechanicalEngineering> _mechanicalEngineeringList = [];

  snapshot.docs.forEach((document) {
    MechanicalEngineering mechanicalEngineering = MechanicalEngineering.fromMap(document.data());
    _mechanicalEngineeringList.add(mechanicalEngineering);
  });

  mechanicalEngineeringNotifier.mechanicalEngineeringList = _mechanicalEngineeringList;
}