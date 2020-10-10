
class UniversityArial {
  String image;
  String toastName;

  UniversityArial.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    toastName = data['toastname'];
  }
}