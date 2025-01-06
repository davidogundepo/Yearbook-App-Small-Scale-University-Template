import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CBS/BusinessAdministration.dart';
import '../../notifier/CBS_NOTIFIER/business_administration_graduates_notifier.dart';

Future<void> getBusinessAdministration(BusinessAdministrationNotifier businessAdministrationNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('BusinessAdministration').orderBy("name").get();

  List<BusinessAdministration> _businessAdministrationList = [];

  for (var document in snapshot.docs) {
    BusinessAdministration businessAdministration = BusinessAdministration.fromMap(document.data() as Map<String, dynamic>);
    _businessAdministrationList.add(businessAdministration);
  }

  businessAdministrationNotifier.businessAdministrationList = _businessAdministrationList;
}
