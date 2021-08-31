
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CAS/AgriculturalExtensionAndRuralDevelopment.dart';
import '../../notifier/CAS_NOTIFIER/agricultural_extension_and_rural_development_graduates_notifier.dart';

getAgriculturalExtensionAndRuralDevelopment(AgriculturalExtensionAndRuralDevelopmentNotifier agriculturalExtensionAndRuralDevelopmentNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('AgriculturalExtensionAndRuralDevelopment').orderBy("name").get();

  List<AgriculturalExtensionAndRuralDevelopment> _agriculturalExtensionAndRuralDevelopmentList = [];

  snapshot.docs.forEach((document) {
    AgriculturalExtensionAndRuralDevelopment agriculturalExtensionAndRuralDevelopment = AgriculturalExtensionAndRuralDevelopment.fromMap(document.data());
    _agriculturalExtensionAndRuralDevelopmentList.add(agriculturalExtensionAndRuralDevelopment);
  });

  agriculturalExtensionAndRuralDevelopmentNotifier.agriculturalExtensionAndRuralDevelopmentList = _agriculturalExtensionAndRuralDevelopmentList;
}