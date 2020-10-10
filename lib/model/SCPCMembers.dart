class SCPCMembers {
  String image;
  String name;
  String positionEnforced;
  String department;
  String id;

  SCPCMembers.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    name = data['name'];
    positionEnforced = data['position_enforced'];
    department = data['department'];
    id = data['id'];
  }
}