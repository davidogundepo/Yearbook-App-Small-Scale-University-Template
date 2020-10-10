
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/COE/AgriculturalAndBiosystemEngineering.dart';
import '../../notifier/COE_NOTIFIER/agricultural_and_biosystem_engineering_graduates_notifier.dart';

getAgriculturalAndBiosystemEngineering(AgriculturalAndBiosystemEngineeringNotifier agriculturalAndBiosystemEngineeringNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('AgriculturalAndBiosystemEngineering').orderBy("name").getDocuments();

  List<AgriculturalAndBiosystemEngineering> _agriculturalAndBiosystemEngineeringList = [];

  snapshot.documents.forEach((document) {
    AgriculturalAndBiosystemEngineering agriculturalAndBiosystemEngineering = AgriculturalAndBiosystemEngineering.fromMap(document.data);
    _agriculturalAndBiosystemEngineeringList.add(agriculturalAndBiosystemEngineering);
  });

  agriculturalAndBiosystemEngineeringNotifier.agriculturalAndBiosystemEngineeringList = _agriculturalAndBiosystemEngineeringList;
}