
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CAS/AquacultureAndFisheriesManagement.dart';
import '../../notifier/CAS_NOTIFIER/aquaculture_and_fisheries_management_graduates_notifier.dart';

getAquacultureAndFisheriesManagement(AquacultureAndFisheriesManagementNotifier aquacultureAndFisheriesManagementNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('AquacultureAndFisheriesManagement').orderBy("name").getDocuments();

  List<AquacultureAndFisheriesManagement> _aquacultureAndFisheriesManagementList = [];

  snapshot.documents.forEach((document) {
    AquacultureAndFisheriesManagement aquacultureAndFisheriesManagement = AquacultureAndFisheriesManagement.fromMap(document.data);
    _aquacultureAndFisheriesManagementList.add(aquacultureAndFisheriesManagement);
  });

  aquacultureAndFisheriesManagementNotifier.aquacultureAndFisheriesManagementList = _aquacultureAndFisheriesManagementList;
}