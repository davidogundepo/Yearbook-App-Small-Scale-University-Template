class StudentCouncilMembers {
  String image;
  String name;
  String positionEnforced;
  String department;
  String id;

  StudentCouncilMembers.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    name = data['name'];
    positionEnforced = data['position_enforced'];
    department = data['department'];
    id = data['id'];
  }
}