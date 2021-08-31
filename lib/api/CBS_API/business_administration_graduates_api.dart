
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/BusinessAdministration.dart';
import '../../notifier/CBS_NOTIFIER/business_administration_graduates_notifier.dart';

getBusinessAdministration(BusinessAdministrationNotifier businessAdministrationNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('BusinessAdministration').orderBy("name").get();

  List<BusinessAdministration> _businessAdministrationList = [];

  snapshot.docs.forEach((document) {
    BusinessAdministration businessAdministration = BusinessAdministration.fromMap(document.data());
    _businessAdministrationList.add(businessAdministration);
  });

  businessAdministrationNotifier.businessAdministrationList = _businessAdministrationList;
}