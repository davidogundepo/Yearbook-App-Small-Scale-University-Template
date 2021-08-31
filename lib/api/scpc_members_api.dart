
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/SCPCMembers.dart';
import '../notifier/scpc_members_notifier.dart';

getSCPCMembers(SCPCMembersNotifier scpcMembersNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('SCPCMembers').orderBy("id").get();

  List<SCPCMembers> _scpcMembersList = [];

  snapshot.docs.forEach((document) {
    SCPCMembers scpcMembers = SCPCMembers.fromMap(document.data());
    _scpcMembersList.add(scpcMembers);
  });

  scpcMembersNotifier.scpcMembersList = _scpcMembersList;
}