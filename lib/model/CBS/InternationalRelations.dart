class InternationalRelations {

  String highSchool;
  String autoBio;
  String bestMoment;
  String whyCourseOfStudy;
  String dob;
  String email;
  String facebook;
  String highSchoolGraduationYear;
  String hobbies;
  String id;
  String image;
  String instagram;
  String linkedIn;
  String myDropline;
  String name;
  String nickname;
  String philosophy;
  String phone;
  String favouriteCourses;
  String schoolExecutive;
  String schoolExecutivePosition;
  String favouriteLocationOnCampus;
  String favoriteSportOnCampus;
  String stateOfOrigin;
  String twitter;
  String whatsNext;
  String whereYouReside;
  String worstMoment;
  String occupation;

  InternationalRelations.fromMap(Map<String, dynamic> data) {
    highSchool = data['high_school'];
    whyCourseOfStudy = data['why_course_of_study'];
    highSchoolGraduationYear = data['high_school_graduation_year'];
    linkedIn = data['linkedIn'];
    whatsNext = data['whats_next'];
    whereYouReside = data['where_you_reside'];
    favouriteCourses = data['favourite_courses'];
    schoolExecutive = data['school_executive'];
    schoolExecutivePosition = data['school_executive_position'];
    favouriteLocationOnCampus = data['favourite_location_in_campus'];
    favoriteSportOnCampus = data['favorite_sport_in_campus'];
    stateOfOrigin = data['state_of_origin'];
    id = data['id'];
    autoBio = data['autobio'];
    bestMoment = data['best_moment'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    twitter = data['twitter'];
    dob = data['d_o_b'];
    hobbies = data['hobbies'];
    myDropline = data['my_dropline'];
    philosophy = data['philosophy'];
    worstMoment = data['worst_moment'];
    occupation = data['occupation'];
  }

}