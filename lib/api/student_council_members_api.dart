
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/StudentCouncilMembers.dart';
import '../notifier/student_council_members_notifier.dart';

getStudentCouncilMembers(StudentCouncilMembersNotifier studentCouncilMembersNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('StudentCouncilMembers').orderBy("id").get();

  List<StudentCouncilMembers> _studentCouncilMembersList = [];

  snapshot.docs.forEach((document) {
    StudentCouncilMembers studentCouncilMembers = StudentCouncilMembers.fromMap(document.data());
    _studentCouncilMembersList.add(studentCouncilMembers);
  });

  studentCouncilMembersNotifier.studentCouncilMembersList = _studentCouncilMembersList;
}