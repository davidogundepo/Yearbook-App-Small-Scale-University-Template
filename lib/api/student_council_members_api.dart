import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/StudentCouncilMembers.dart';
import '../notifier/student_council_members_notifier.dart';

Future<void> getStudentCouncilMembers(StudentCouncilMembersNotifier studentCouncilMembersNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('StudentCouncilMembers').orderBy("id").get();

  List<StudentCouncilMembers> _studentCouncilMembersList = [];

  for (var document in snapshot.docs) {
    StudentCouncilMembers studentCouncilMembers = StudentCouncilMembers.fromMap(document.data() as Map<String, dynamic>);
    _studentCouncilMembersList.add(studentCouncilMembers);
  }

  studentCouncilMembersNotifier.studentCouncilMembersList = _studentCouncilMembersList;
}
