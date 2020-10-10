
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CAS/AgriculturalEconomics.dart';
import '../../notifier/CAS_NOTIFIER/agricultural_economics_graduates_notifier.dart';

getAgriculturalEconomics(AgriculturalEconomicsNotifier agriculturalEconomicsNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('AgriculturalEconomics').orderBy("name").getDocuments();

  List<AgriculturalEconomics> _agriculturalEconomicsList = [];

  snapshot.documents.forEach((document) {
    AgriculturalEconomics agriculturalEconomics = AgriculturalEconomics.fromMap(document.data);
    _agriculturalEconomicsList.add(agriculturalEconomics);
  });

  agriculturalEconomicsNotifier.agriculturalEconomicsList = _agriculturalEconomicsList;
}