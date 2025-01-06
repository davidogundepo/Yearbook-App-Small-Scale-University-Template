import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../model/SCPCMembers.dart';

class SCPCMembersNotifier with ChangeNotifier {
  List<SCPCMembers> _scpcMembersList = [];
  late SCPCMembers _currentSCPCMembers;

  UnmodifiableListView<SCPCMembers> get scpcMembersList => UnmodifiableListView(_scpcMembersList);

  SCPCMembers get currentSCPCMembers => _currentSCPCMembers;

  set scpcMembersList(List<SCPCMembers> scpcMembersList) {
    _scpcMembersList = scpcMembersList;
    notifyListeners();
  }

  set currentSCPCMembers(SCPCMembers scpcMembers) {
    _currentSCPCMembers = scpcMembers;
    notifyListeners();
  }
}
