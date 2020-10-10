
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/BusinessAdministration.dart';
import '../../notifier/CBS_NOTIFIER/business_administration_graduates_notifier.dart';

getBusinessAdministration(BusinessAdministrationNotifier businessAdministrationNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('BusinessAdministration').orderBy("name").getDocuments();

  List<BusinessAdministration> _businessAdministrationList = [];

  snapshot.documents.forEach((document) {
    BusinessAdministration businessAdministration = BusinessAdministration.fromMap(document.data);
    _businessAdministrationList.add(businessAdministration);
  });

  businessAdministrationNotifier.businessAdministrationList = _businessAdministrationList;
}