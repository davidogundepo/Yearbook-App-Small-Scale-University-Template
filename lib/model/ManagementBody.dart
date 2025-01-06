class ManagementBody {
  String? autoBio;
  String? staffPosition;
  String? qualification;
  String? yearOfAppointment;
  String? hobbies;
  String? philosophy;
  String? originState;
  String? email;
  String? facebook;
  String? linkedIn;
  String? id;
  String? image;
  String? imageTwo;
  String? instagram;
  String? name;
  String? phone;
  String? twitter;

  ManagementBody.fromMap(Map<String?, dynamic> data) {
    id = data['id'];
    autoBio = data['autobio'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    imageTwo = data['image_two'];
    instagram = data['instagram'];
    name = data['name'];
    phone = data['phone'];
    twitter = data['twitter'];
    staffPosition = data['staff_position'];
    qualification = data['qualification'];
    yearOfAppointment = data['year_of_appointment'];
    originState = data['state_of_origin'];
    hobbies = data['hobbies'];
    philosophy = data['philosophy'];
    linkedIn = data['linkedIn'];
  }
}
