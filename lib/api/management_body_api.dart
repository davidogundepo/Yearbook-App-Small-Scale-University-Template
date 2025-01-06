import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/ManagementBody.dart';
import '../notifier/management_body_notifier.dart';

Future<void> getManagementBody(ManagementBodyNotifier managementBodyNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('ManagementBody').orderBy("id").get();

  List<ManagementBody> _managementBodyList = [];

  for (var document in snapshot.docs) {
    ManagementBody managementBody = ManagementBody.fromMap(document.data() as Map<String, dynamic>);
    _managementBodyList.add(managementBody);
  }

  managementBodyNotifier.managementBodyList = _managementBodyList;
}
