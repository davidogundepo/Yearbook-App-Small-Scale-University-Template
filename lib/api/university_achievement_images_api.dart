
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/UniversityAchievements.dart';
import '../notifier/university_achievement_images_notifier.dart';

getUniversityAchievements(UniversityAchievementsNotifier universityAchievementsNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('UniversityAchievementImages').get();

  List<UniversityAchievements> _universityAchievementsList = [];

  snapshot.docs.forEach((document) {
    UniversityAchievements universityAchievements = UniversityAchievements.fromMap(document.data());
    _universityAchievementsList.add(universityAchievements);
  });

  universityAchievementsNotifier.universityAchievementsList = _universityAchievementsList;
}