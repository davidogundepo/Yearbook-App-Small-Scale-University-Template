
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/ManagementBody.dart';
import '../notifier/management_body_notifier.dart';

getManagementBody(ManagementBodyNotifier managementBodyNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('ManagementBody').orderBy("id").getDocuments();

  List<ManagementBody> _managementBodyList = [];

  snapshot.documents.forEach((document) {
    ManagementBody managementBody = ManagementBody.fromMap(document.data);
    _managementBodyList.add(managementBody);
  });

  managementBodyNotifier.managementBodyList = _managementBodyList;
}