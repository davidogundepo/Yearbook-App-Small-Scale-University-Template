import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CAS/AgriculturalEconomics.dart';
import '../../notifier/CAS_NOTIFIER/agricultural_economics_graduates_notifier.dart';

Future<void> getAgriculturalEconomics(AgriculturalEconomicsNotifier agriculturalEconomicsNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('AgriculturalEconomics').orderBy("name").get();

  List<AgriculturalEconomics> _agriculturalEconomicsList = [];

  for (var document in snapshot.docs) {
    AgriculturalEconomics agriculturalEconomics = AgriculturalEconomics.fromMap(document.data() as Map<String, dynamic>);
    _agriculturalEconomicsList.add(agriculturalEconomics);
  }

  agriculturalEconomicsNotifier.agriculturalEconomicsList = _agriculturalEconomicsList;
}
