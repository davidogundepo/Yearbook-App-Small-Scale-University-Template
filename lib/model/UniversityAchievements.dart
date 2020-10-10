
class UniversityAchievements {
  String image;
  String toastName;

  UniversityAchievements.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    toastName = data['toastname'];
  }
}