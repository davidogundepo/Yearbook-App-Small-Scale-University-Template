
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/UniversityAchievements.dart';
import '../notifier/university_achievement_images_notifier.dart';

Future<void> getUniversityAchievements(UniversityAchievementsNotifier universityAchievementsNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('universities').doc(clubId).collection('UniversityAchievementImages').get();

  List<UniversityAchievements> _universityAchievementsList = [];

  for (var document in snapshot.docs) {
    UniversityAchievements universityAchievements = UniversityAchievements.fromMap(document.data() as Map<String, dynamic>);
    _universityAchievementsList.add(universityAchievements);
  }

  universityAchievementsNotifier.universityAchievementsList = _universityAchievementsList;
}