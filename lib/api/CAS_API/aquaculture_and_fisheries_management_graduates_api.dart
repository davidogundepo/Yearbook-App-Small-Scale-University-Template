
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CAS/AquacultureAndFisheriesManagement.dart';
import '../../notifier/CAS_NOTIFIER/aquaculture_and_fisheries_management_graduates_notifier.dart';

getAquacultureAndFisheriesManagement(AquacultureAndFisheriesManagementNotifier aquacultureAndFisheriesManagementNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('AquacultureAndFisheriesManagement').orderBy("name").get();

  List<AquacultureAndFisheriesManagement> _aquacultureAndFisheriesManagementList = [];

  snapshot.docs.forEach((document) {
    AquacultureAndFisheriesManagement aquacultureAndFisheriesManagement = AquacultureAndFisheriesManagement.fromMap(document.data());
    _aquacultureAndFisheriesManagementList.add(aquacultureAndFisheriesManagement);
  });

  aquacultureAndFisheriesManagementNotifier.aquacultureAndFisheriesManagementList = _aquacultureAndFisheriesManagementList;
}