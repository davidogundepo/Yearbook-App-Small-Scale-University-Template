
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CAS/AgriculturalEconomics.dart';
import '../../notifier/CAS_NOTIFIER/agricultural_economics_graduates_notifier.dart';

getAgriculturalEconomics(AgriculturalEconomicsNotifier agriculturalEconomicsNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('AgriculturalEconomics').orderBy("name").get();

  List<AgriculturalEconomics> _agriculturalEconomicsList = [];

  snapshot.docs.forEach((document) {
    AgriculturalEconomics agriculturalEconomics = AgriculturalEconomics.fromMap(document.data());
    _agriculturalEconomicsList.add(agriculturalEconomics);
  });

  agriculturalEconomicsNotifier.agriculturalEconomicsList = _agriculturalEconomicsList;
}