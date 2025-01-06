import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CAS/AquacultureAndFisheriesManagement.dart';
import '../../notifier/CAS_NOTIFIER/aquaculture_and_fisheries_management_graduates_notifier.dart';

Future<void> getAquacultureAndFisheriesManagement(
    AquacultureAndFisheriesManagementNotifier aquacultureAndFisheriesManagementNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('AquacultureAndFisheriesManagement').orderBy("name").get();

  List<AquacultureAndFisheriesManagement> _aquacultureAndFisheriesManagementList = [];

  for (var document in snapshot.docs) {
    AquacultureAndFisheriesManagement aquacultureAndFisheriesManagement =
        AquacultureAndFisheriesManagement.fromMap(document.data() as Map<String, dynamic>);
    _aquacultureAndFisheriesManagementList.add(aquacultureAndFisheriesManagement);
  }

  aquacultureAndFisheriesManagementNotifier.aquacultureAndFisheriesManagementList = _aquacultureAndFisheriesManagementList;
}
