
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CAS/AgriculturalExtensionAndRuralDevelopment.dart';
import '../../notifier/CAS_NOTIFIER/agricultural_extension_and_rural_development_graduates_notifier.dart';

getAgriculturalExtensionAndRuralDevelopment(AgriculturalExtensionAndRuralDevelopmentNotifier agriculturalExtensionAndRuralDevelopmentNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('AgriculturalExtensionAndRuralDevelopment').orderBy("name").getDocuments();

  List<AgriculturalExtensionAndRuralDevelopment> _agriculturalExtensionAndRuralDevelopmentList = [];

  snapshot.documents.forEach((document) {
    AgriculturalExtensionAndRuralDevelopment agriculturalExtensionAndRuralDevelopment = AgriculturalExtensionAndRuralDevelopment.fromMap(document.data);
    _agriculturalExtensionAndRuralDevelopmentList.add(agriculturalExtensionAndRuralDevelopment);
  });

  agriculturalExtensionAndRuralDevelopmentNotifier.agriculturalExtensionAndRuralDevelopmentList = _agriculturalExtensionAndRuralDevelopmentList;
}