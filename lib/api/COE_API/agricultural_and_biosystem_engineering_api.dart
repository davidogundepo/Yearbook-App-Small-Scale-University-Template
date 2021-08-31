
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/COE/AgriculturalAndBiosystemEngineering.dart';
import '../../notifier/COE_NOTIFIER/agricultural_and_biosystem_engineering_graduates_notifier.dart';

getAgriculturalAndBiosystemEngineering(AgriculturalAndBiosystemEngineeringNotifier agriculturalAndBiosystemEngineeringNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('AgriculturalAndBiosystemEngineering').orderBy("name").get();

  List<AgriculturalAndBiosystemEngineering> _agriculturalAndBiosystemEngineeringList = [];

  snapshot.docs.forEach((document) {
    AgriculturalAndBiosystemEngineering agriculturalAndBiosystemEngineering = AgriculturalAndBiosystemEngineering.fromMap(document.data());
    _agriculturalAndBiosystemEngineeringList.add(agriculturalAndBiosystemEngineering);
  });

  agriculturalAndBiosystemEngineeringNotifier.agriculturalAndBiosystemEngineeringList = _agriculturalAndBiosystemEngineeringList;
}