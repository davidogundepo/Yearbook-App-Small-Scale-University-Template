import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/SCPCMembers.dart';
import '../notifier/scpc_members_notifier.dart';

Future<void> getSCPCMembers(SCPCMembersNotifier scpcMembersNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('SCPCMembers').orderBy("id").get();

  List<SCPCMembers> _scpcMembersList = [];

  for (var document in snapshot.docs) {
    SCPCMembers scpcMembers = SCPCMembers.fromMap(document.data() as Map<String, dynamic>);
    _scpcMembersList.add(scpcMembers);
  }

  scpcMembersNotifier.scpcMembersList = _scpcMembersList;
}
