
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/StudentCouncilMembers.dart';
import '../notifier/student_council_members_notifier.dart';

getStudentCouncilMembers(StudentCouncilMembersNotifier studentCouncilMembersNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('StudentCouncilMembers').orderBy("id").getDocuments();

  List<StudentCouncilMembers> _studentCouncilMembersList = [];

  snapshot.documents.forEach((document) {
    StudentCouncilMembers studentCouncilMembers = StudentCouncilMembers.fromMap(document.data);
    _studentCouncilMembersList.add(studentCouncilMembers);
  });

  studentCouncilMembersNotifier.studentCouncilMembersList = _studentCouncilMembersList;
}