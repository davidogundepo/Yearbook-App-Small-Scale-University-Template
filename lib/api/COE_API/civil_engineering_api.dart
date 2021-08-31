
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/COE/CivilEngineering.dart';
import '../../notifier/COE_NOTIFIER/civil_engineering_graduates_notifier.dart';

getCivilEngineering(CivilEngineeringNotifier civilEngineeringNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('CivilEngineering').orderBy("name").get();

  List<CivilEngineering> _civilEngineeringList = [];

  snapshot.docs.forEach((document) {
    CivilEngineering civilEngineering = CivilEngineering.fromMap(document.data());
    _civilEngineeringList.add(civilEngineering);
  });

  civilEngineeringNotifier.civilEngineeringList = _civilEngineeringList;
}