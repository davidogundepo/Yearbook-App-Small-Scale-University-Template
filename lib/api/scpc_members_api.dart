
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/SCPCMembers.dart';
import '../notifier/scpc_members_notifier.dart';

getSCPCMembers(SCPCMembersNotifier scpcMembersNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('SCPCMembers').orderBy("id").getDocuments();

  List<SCPCMembers> _scpcMembersList = [];

  snapshot.documents.forEach((document) {
    SCPCMembers scpcMembers = SCPCMembers.fromMap(document.data);
    _scpcMembersList.add(scpcMembers);
  });

  scpcMembersNotifier.scpcMembersList = _scpcMembersList;
}