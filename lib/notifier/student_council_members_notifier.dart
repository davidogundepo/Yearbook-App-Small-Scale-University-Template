
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/StudentCouncilMembers.dart';

class StudentCouncilMembersNotifier with ChangeNotifier {
  List<StudentCouncilMembers> _studentCouncilMembersList = [];
  StudentCouncilMembers _currentStudentCouncilMembers;

  UnmodifiableListView<StudentCouncilMembers> get studentCouncilMembersList => UnmodifiableListView(_studentCouncilMembersList);

  StudentCouncilMembers get currentStudentCouncilMembers => _currentStudentCouncilMembers;

  set studentCouncilMembersList(List<StudentCouncilMembers> studentCouncilMembersList) {
    _studentCouncilMembersList = studentCouncilMembersList;
    notifyListeners();
  }

  set currentStudentCouncilMembers(StudentCouncilMembers studentCouncilMembers) {
    _currentStudentCouncilMembers = studentCouncilMembers;
    notifyListeners();
  }

}