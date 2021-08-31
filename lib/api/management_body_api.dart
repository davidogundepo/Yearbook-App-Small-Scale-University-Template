
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/ManagementBody.dart';
import '../notifier/management_body_notifier.dart';

getManagementBody(ManagementBodyNotifier managementBodyNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('ManagementBody').orderBy("id").get();

  List<ManagementBody> _managementBodyList = [];

  snapshot.docs.forEach((document) {
    ManagementBody managementBody = ManagementBody.fromMap(document.data());
    _managementBodyList.add(managementBody);
  });

  managementBodyNotifier.managementBodyList = _managementBodyList;
}