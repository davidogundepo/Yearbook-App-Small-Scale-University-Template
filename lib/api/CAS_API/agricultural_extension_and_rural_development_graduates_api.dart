import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CAS/AgriculturalExtensionAndRuralDevelopment.dart';
import '../../notifier/CAS_NOTIFIER/agricultural_extension_and_rural_development_graduates_notifier.dart';

Future<void> getAgriculturalExtensionAndRuralDevelopment(
    AgriculturalExtensionAndRuralDevelopmentNotifier agriculturalExtensionAndRuralDevelopmentNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('universities')
      .doc(clubId)
      .collection('AgriculturalExtensionAndRuralDevelopment')
      .orderBy("name")
      .get();

  List<AgriculturalExtensionAndRuralDevelopment> _agriculturalExtensionAndRuralDevelopmentList = [];

  for (var document in snapshot.docs) {
    AgriculturalExtensionAndRuralDevelopment agriculturalExtensionAndRuralDevelopment =
        AgriculturalExtensionAndRuralDevelopment.fromMap(document.data() as Map<String, dynamic>);
    _agriculturalExtensionAndRuralDevelopmentList.add(agriculturalExtensionAndRuralDevelopment);
  }

  agriculturalExtensionAndRuralDevelopmentNotifier.agriculturalExtensionAndRuralDevelopmentList = _agriculturalExtensionAndRuralDevelopmentList;
}
