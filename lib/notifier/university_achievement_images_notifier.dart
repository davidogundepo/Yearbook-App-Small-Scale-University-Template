
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/UniversityAchievements.dart';

class UniversityAchievementsNotifier with ChangeNotifier {
  List<UniversityAchievements> _universityAchievementsList = [];
  UniversityAchievements _currentUniversityAchievements;

  UnmodifiableListView<UniversityAchievements> get universityAchievementsList => UnmodifiableListView(_universityAchievementsList);

  UniversityAchievements get currentUniversityAchievements => _currentUniversityAchievements;

  set universityAchievementsList(List<UniversityAchievements> universityAchievementsList) {
    _universityAchievementsList = universityAchievementsList;
    notifyListeners();
  }

  set currentUniversityAchievements(UniversityAchievements universityAchievements) {
    _currentUniversityAchievements = universityAchievements;
    notifyListeners();
  }

}