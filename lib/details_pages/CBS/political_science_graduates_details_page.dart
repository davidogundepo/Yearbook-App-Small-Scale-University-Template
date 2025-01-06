import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/d_whatsapp_otp_service.dart';
import '../../notifier/CBS_NOTIFIER/political_science_graduates_notifier.dart';

String callFIRST = "tel:+234";
String smsFIRST = "sms:+234";
String whatsAppFIRST = "https://api.whatsapp.com/send?phone=+234";
String whatsAppSECOND = "&text=Hello%20";
String whatsAppTHIRD = ",%20How%20are%20you%20doing%20today?";
String mailFIRST = "mailto:";
String mailSECOND = "?subject=Hello ";
String urlTwitter = "https://twitter.com/";
String urlFacebook = "https://facebook.com/";
String urlInstagram = "https://www.instagram.com/";
String urlLinkedIn = "https://www.linkedin.com/";
String urlSnapchat = "https://www.snapchat.com/";
String urlTikTok = "https://www.tiktok.com/";

String schoolName = "Landmark University";
String courseDepartmentName = "Economics";

String reachDetails = "Contacts";
String autoBioDetails = "AutoBiography";

String callButton = "Call";
String messageButton = "Send a Message";
String whatsAppButton = "Send a WhatsApp Message";
String emailButton = "Send an Email";
String twitterButton = "My Twitter";
String instagramButton = "My Instagram";
String linkedInButton = "My LinkedIn";
String facebookButton = "My Facebook";
String snapchatButton = "My Snapchat";
String tikTokButton = "My TikTok";

String autobiographyTitle = "Autobiography\n";
String nicknameTitle = "My Nickname\n";
String bestMomentTitle = "Best Moment in School\n";
String worstMomentTitle = "Worst Moment in School\n";
String whyCourseOfStudyTitle = "Why study $courseDepartmentName\n";
String favouriteCourseTitle = "Favourite Course\n";
String favouriteLocationOnCampusTitle = "Favourite Place to be on Campus\n";
String favSchoolActivityTitle = "Favourite School Activity\n";
String scpcExecutiveTitle = "SCPC Executive Position\n";
String scpcExecutivePositionTitle = "SCPC Executive Position\n";
String favoriteSportOnCampusTitle = "Favourite Sporting Activity on Campus\n";
String schoolExecutiveTitle = "Department Executive\n";
String schoolExecutivePositionTitle = "Department Executive Position\n";
String whatsNextAfterTitle = "What's next after B.Sc\n";
String highSchoolTitle = "Secondary School Name\n";
String highSchoolGraduationYearTitle = "Secondary School Graduation Year\n";
String currentResidenceStateTitle = "State of Residence\n";
String stateOfOriginTitle = "State of Origin\n";
String dobTitle = "Date of Birth\n";
String occupationTitle = "Occupation\n";
String hobbiesTitle = "Hobbies\n";
String philosophyTitle = "Philosophy about Life\n";
String droplineTitle = "Dropline to My Junior $schoolName Colleagues\n";

String linkedInProfileSharedPreferencesTitle = "Manual Website Search";
String linkedInProfileSharedPreferencesContentOne = "Apparently, you'd need to search manually for ";
String linkedInProfileSharedPreferencesContentTwo = ", on LinkedIn.com";
String linkedInProfileSharedPreferencesButton = "Go to LinkedIn";
String linkedInProfileSharedPreferencesButtonTwo = "Lol, No";

String facebookProfileSharedPreferencesTitle = "Manual Website Search";
String facebookProfileSharedPreferencesContentOne = "Apparently, you'd need to search manually for ";
String facebookProfileSharedPreferencesContentTwo = ", on Facebook.com";
String facebookProfileSharedPreferencesButton = "Go to Facebook";
String facebookProfileSharedPreferencesButtonTwo = "Lol, No";

Color backgroundColor = Color.fromRGBO(247, 164, 64, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(164, 107, 39, 1.0);
Color appBarIconColor = Colors.white;
Color materialBackgroundColor = Colors.transparent;
Color shapeDecorationColor = Color.fromRGBO(247, 164, 64, 1);
Color shapeDecorationTextColor = Color.fromRGBO(164, 107, 39, 1.0);
Color cardBackgroundColor = Colors.white;
Color cardThumbColor = Colors.white;
Color cardThumbBackgroundColor = Color.fromRGBO(164, 107, 39, 1.0);
Color splashColor = Color.fromRGBO(247, 164, 64, 1);
Color splashColorTwo = Colors.white;
Color iconTextColor = Color.fromRGBO(164, 107, 39, 1.0);
Color iconTextColorTwo = Colors.white;
Color buttonColor = Color.fromRGBO(164, 107, 39, 1.0);
Color textColor = Color.fromRGBO(164, 107, 39, 1.0);
Color confettiColorOne = Colors.green;
Color confettiColorTwo = Colors.blue;
Color confettiColorThree = Colors.pink;
Color confettiColorFour = Colors.orange;
Color confettiColorFive = Colors.purple;
Color confettiColorSix = Colors.brown;
Color confettiColorSeven = Colors.white;
Color confettiColorEight = Colors.blueGrey;
Color confettiColorNine = Colors.redAccent;
Color confettiColorTen = Colors.teal;
Color confettiColorEleven = Colors.indigoAccent;
Color confettiColorTwelve = Colors.cyan;

late PoliticalScienceNotifier politicalScienceNotifier;

Map<int, Widget>? userBIO;

var _highSchool;
var _autoBio;
var _bestMoment;
var _whyCourseOfStudy;
var _dob;
var _email;
var _facebook;
var _highSchoolGraduationYear;
var _hobbies;
var _instagram;
var _linkedIn;
var _myDropline;
var _name;
var _nickname;
var _philosophy;
var _phone;
var _favouriteCourse;
var _snapchat;
var _tikTok;
var _favSchoolActivity;
var _schoolExecutive;
var _schoolExecutivePosition;
var _scpcExecutive;
var _scpcExecutivePosition;
var _favouriteLocationOnCampus;
var _favoriteSportOnCampus;
var _twitter;
var _whatsNext;
var _stateResiding;
var _originState;
var _worstMoment;
var _occupation;

class MyPoliticalScienceGraduatesDetailsPage extends StatefulWidget {
  final String clubId;

  const MyPoliticalScienceGraduatesDetailsPage({super.key, required this.clubId});
  @override
  State<MyPoliticalScienceGraduatesDetailsPage> createState() => MyPoliticalScienceGraduatesDetailsPageState();
}

class MyPoliticalScienceGraduatesDetailsPageState extends State<MyPoliticalScienceGraduatesDetailsPage> {
  final WhatsAppOtpService _whatsAppOtpService = WhatsAppOtpService();

  String otpCode = "";
  bool isLoaded = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String _receivedSmsId = '';
  String _whatsappOtp = '';
  bool isOTPComplete = true;
  bool isOtpVerified = false; // Add this variable
  // Declare a boolean variable to track OTP generation
  bool isSmsOtpGenerated = true;

  bool isModifyingAutobiography = true; // Assuming modifying autobiography by default

  ConfettiController? _confettiController;

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Future launchURL(String url) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text("The required App not installed")));
    }
  }

  // Define variables to store form input
  final TextEditingController _myHighSchoolController = TextEditingController();
  final TextEditingController _myAutobiographyController = TextEditingController();
  final TextEditingController _myBestMomentInUniversityController = TextEditingController();
  final TextEditingController _myWorstMomentInUniversityController = TextEditingController();
  final TextEditingController _myWhyCourseOfStudyController = TextEditingController();
  final TextEditingController _myHighSchoolGraduationYearController = TextEditingController();
  final TextEditingController _myHobbiesController = TextEditingController();
  final TextEditingController _myDroplineController = TextEditingController();
  final TextEditingController _myNicknameController = TextEditingController();
  final TextEditingController _myPhilosophyController = TextEditingController();
  final TextEditingController _myFavSchoolActivityController = TextEditingController();
  final TextEditingController _myFavouriteCourseController = TextEditingController();
  final TextEditingController _myFavouriteLocationOnCampusController = TextEditingController();
  final TextEditingController _myFavoriteSportOnCampusController = TextEditingController();
  final TextEditingController _myWhatsNextController = TextEditingController();
  final TextEditingController _myStateResidingController = TextEditingController();
  final TextEditingController _myOriginStateController = TextEditingController();
  final TextEditingController _myOccupationController = TextEditingController();
  final TextEditingController _myPhoneNumberController = TextEditingController();
  final TextEditingController _myEmailAddressController = TextEditingController();
  final TextEditingController _myTwitterController = TextEditingController();
  final TextEditingController _myInstagramController = TextEditingController();
  final TextEditingController _myLinkedInController = TextEditingController();
  final TextEditingController _myFacebookController = TextEditingController();
  final TextEditingController _myTikTokController = TextEditingController();
  final TextEditingController _mySnapchatController = TextEditingController();

  String _selectedDepartmentExecutiveRole = 'Select One'; // Default value
  String _selectedDepartmentExecutivePositionRole = 'Select One'; // Default value

  final List<String> _departmentExecutiveOptions = ['Select One', 'Yes', 'No'];
  final List<String> _departmentExecutivePositionOptions = [
    'Select One',
    'Student Union President',
    'Vice President (Male)',
    'Vice President (Female)',
    'General Secretary',
    'Treasurer',
    'Public Relations Officer',
    'Sports Coordinator',
    'Welfare Secretary',
    'Academic Representative',
    'Departmental President',
    'Hall Governor (Male)',
    'Hall Governor (Female)',
    'Cultural Officer',
    'Social Secretary',
    'Library Coordinator'
  ];

  // Add this validation function
  String? validateDropdownValue(String? value, List<String> validOptions) {
    if (value == null || !validOptions.contains(value)) {
      return 'Select One'; // Return default value if current value is invalid
    }
    return value;
  }

  DateTime selectedDateA = DateTime(2023, 12, 25, 14, 15);
  DateTime? date;

  String getFormattedDate(DateTime date) {
    String day = DateFormat('d').format(date);
    String suffix = getDaySuffix(int.parse(day));

    return DateFormat("d'$suffix' MMMM").format(date);
  }

  String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String? formattedDate;

  // Create a GlobalKey for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Firebase Firestore instance
  final firestore = FirebaseFirestore.instance;

  // Implement a function to handle form submission
  Future<void> _submitForm() async {
    String fullName2 = _name;

    if (_formKey.currentState!.validate()) {
      final firestore = FirebaseFirestore.instance;
      final highSchoolName = _myHighSchoolController.text;
      final whyCourseOfStudyName = _myWhyCourseOfStudyController.text;
      final bestMomentInClubName = _myBestMomentInUniversityController.text;
      final worstMomentInClubName = _myWorstMomentInUniversityController.text;
      final highSchoolGraduationYearName = _myHighSchoolGraduationYearController.text;
      final hobbiesName = _myHobbiesController.text;
      final nicknameName = _myNicknameController.text;
      final favSchoolActivityName = _myFavSchoolActivityController.text;
      final favouriteCourseName = _myFavouriteCourseController.text;
      final favouriteLocationOnCampusName = _myFavouriteLocationOnCampusController.text;
      final favoriteSportOnCampusName = _myFavoriteSportOnCampusController.text;
      final whatsNextName = _myWhatsNextController.text;
      final stateResidingName = _myStateResidingController.text;
      final regionOfOriginName = _myOriginStateController.text;
      final occupationName = _myOccupationController.text;
      final autobiographyName = _myAutobiographyController.text;
      final philosophyName = _myPhilosophyController.text;
      final droplineName = _myDroplineController.text;
      final phoneNumberName = _myPhoneNumberController.text;
      final emailAddressYearName = _myEmailAddressController.text;
      final twitterName = _myTwitterController.text;
      final instagramName = _myInstagramController.text;
      final linkedInName = _myLinkedInController.text;
      final facebookName = _myFacebookController.text;
      final tiktokName = _myTikTokController.text;
      final snapchatName = _mySnapchatController.text;
      final fullName = fullName2;

      String collectionName = 'DepartmentGraduatesC';

      // Find the corresponding document in the firestore by querying for the full name
      QuerySnapshot querySnapshot =
          await firestore.collection('universities').doc(widget.clubId).collection(collectionName).where('name', isEqualTo: fullName).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Get the first document from the query results
        DocumentSnapshot documentSnapshot = querySnapshot.docs[0];

        // Update the fields with the new data, but only if the value is not "select"
        if (_selectedDepartmentExecutiveRole != "Select One") {
          documentSnapshot.reference.update({'department_executive': _selectedDepartmentExecutiveRole});
        } else {
          documentSnapshot.reference.update({'department_executive': ''});
        }
        if (_selectedDepartmentExecutivePositionRole != "Select One") {
          documentSnapshot.reference.update({'department_executive_position': _selectedDepartmentExecutivePositionRole});
        } else {
          documentSnapshot.reference.update({'department_executive_position': ''});
        }
        if (getFormattedDate(selectedDateA).toUpperCase() != "25TH DECEMBER") {
          documentSnapshot.reference.update({
            'd_o_b': getFormattedDate(selectedDateA).toUpperCase(),
          });
        }

        // Update the fields with the new data
        await documentSnapshot.reference.update({
          'autobio': autobiographyName,
          'best_moment': bestMomentInClubName,
          'nickname': nicknameName,
          'high_school': highSchoolName,
          'why_course_of_study': whyCourseOfStudyName,
          'high_school_graduation_year': highSchoolGraduationYearName,
          'whats_next': whatsNextName,
          'where_you_reside': stateResidingName,
          'favourite_course': favouriteCourseName,
          'fav_school_activity': favSchoolActivityName,
          'favourite_location_in_campus': favouriteLocationOnCampusName,
          'favorite_sport_in_campus': favoriteSportOnCampusName,
          'state_of_origin': regionOfOriginName,
          'occupation': occupationName,
          'hobbies': hobbiesName,
          'my_dropline': droplineName,
          'philosophy': philosophyName,
          'worst_moment': worstMomentInClubName,
          'phone': phoneNumberName,
          'email': emailAddressYearName,
          'facebook': facebookName,
          'instagram': instagramName,
          'twitter': twitterName,
          'linkedIn': linkedInName,
          'tiktok': tiktokName,
          'snapchat': snapchatName,
        });
      }

      Fluttertoast.showToast(
        msg: 'Success! Your Autobiography is updated', // Show success message (you can replace it with actual banner generation logic)
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.deepOrangeAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Hmm, strange, Error updating profile'),
          ),
        );
      }
    }
  }

  ////

  // final ImagePicker _picker = ImagePicker();
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  File? _imageOne;
  File? _imageTwo;
  // String _userName = _name;

  Future<void> uploadImagesToStorageAndFirestore(List<File> imageFiles) async {
    try {
      // Find the document ID for the user with the specified name (_name)
      String queryName = _name.toLowerCase().replaceAll(" ", "");

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('universities').doc(widget.clubId).collection('DepartmentGraduatesC').get();

      String? documentId;

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        String documentName = document['name'].toLowerCase().replaceAll(" ", "");
        if (documentName == queryName) {
          // Found the document with the matching name
          documentId = document.id;
          break; // Exit the loop since we found the document
        }
      }

      if (documentId != null) {
        for (int i = 0; i < imageFiles.length; i++) {
          String imageName = '$queryName${i + 1}.jpg';

          // Upload each image to Firebase Storage
          final Reference storageReference =
              FirebaseStorage.instance.ref().child('${widget.clubId}/graduates_images').child(queryName).child(imageName);
          final UploadTask uploadTask = storageReference.putFile(imageFiles[i]);
          await uploadTask.whenComplete(() {});

          // Get download URL of the uploaded image
          final String imageUrl = await storageReference.getDownloadURL();

          // Store the image reference (download URL) in Firestore under the user's name
          String imageField = i == 0 ? 'image' : 'image_two'; // Set the field name based on the image index

          // Update the existing document for the specified user (_queryName)
          await FirebaseFirestore.instance.collection('universities').doc(widget.clubId).collection('DepartmentGraduatesC').doc(documentId).update({
            imageField: imageUrl,
          });
        }
        // Show success toast
        Fluttertoast.showToast(
          msg: "Images uploaded and references stored successfully.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepOrangeAccent,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        if (kDebugMode) {
          print('Images uploaded and references stored successfully.');
        }
      } else {
        if (kDebugMode) {
          print('User with name $queryName not found.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading images and storing references: $e');
      }
      // Show error toast
      Fluttertoast.showToast(
        msg: "Error uploading images and storing references.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<void> _checkAndUpdatePhoto() async {
    if (_imageOne != null || _imageTwo != null) {
      List<File> imagesToUpload = [];

      if (_imageOne != null) {
        imagesToUpload.add(_imageOne!);
      }

      if (_imageTwo != null) {
        imagesToUpload.add(_imageTwo!);
      }

      // Call the function to upload images to Firebase Storage and update Firestore
      await uploadImagesToStorageAndFirestore(imagesToUpload);
    } else {
      // Show toast message if no images are selected
      Fluttertoast.showToast(
        msg: "Please select at least one image.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepOrangeAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<File?> pickImageOne(BuildContext context) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _imageOne = File(pickedImage.path);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Hmm something is off, please try again',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepOrangeAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return _imageOne;
  }

  Future<File?> pickImageTwo(BuildContext context) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _imageTwo = File(pickedImage.path);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Hmm something is off, please try again',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.deepOrangeAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return _imageTwo;
  }

  // for selecting imageOne
  void selectImageOne() async {
    _imageOne = await pickImageOne(context);
    setState(() {});
  }

  // for selecting imageTwo
  void selectImageTwo() async {
    _imageTwo = await pickImageTwo(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    politicalScienceNotifier = Provider.of<PoliticalScienceNotifier>(context, listen: true);

    return ConfettiWidget(
      confettiController: _confettiController!,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: false,
      colors: [
        confettiColorOne,
        confettiColorTwo,
        confettiColorThree,
        confettiColorFour,
        confettiColorFive,
        confettiColorSix,
        confettiColorSeven,
        confettiColorEight,
        confettiColorNine,
        confettiColorTen,
        confettiColorEleven,
        confettiColorTwelve,
      ],
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            politicalScienceNotifier.currentPoliticalScience.nickname!,
            style: GoogleFonts.sanchez(color: appBarTextColor, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 10,
          backgroundColor: appBarBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Tooltip(
                  child: Container(
                    width: 400,
                    height: 520,
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        imageUrl: politicalScienceNotifier.currentPoliticalScience.image!,
                        fit: BoxFit.cover,
                        alignment: Alignment(0, -1),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(MdiIcons.alertRhombus),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  message: politicalScienceNotifier.currentPoliticalScience.name),
              Material(
                color: materialBackgroundColor,
                child: InkWell(
                  splashColor: splashColor.withOpacity(0.20),
                  onTap: () {},
                  child: Card(
                    elevation: 4,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: shapeDecorationColor.withOpacity(0.70), width: 4.0, style: BorderStyle.solid),
                    ),
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              politicalScienceNotifier.currentPoliticalScience.name!.toUpperCase(),
                              style: GoogleFonts.blinker(color: shapeDecorationTextColor, fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            (() {
                              if (politicalScienceNotifier.currentPoliticalScience.schoolExecutive == "Yes") {
                                return Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                    Icon(
                                      MdiIcons.checkboxMarkedCircle,
                                      color: iconTextColor,
                                    ),
                                  ],
                                );
                              } else {
                                return Visibility(
                                  visible: !_isVisible,
                                  child: Icon(
                                    MdiIcons.checkboxMarkedCircle,
                                    color: iconTextColor,
                                  ),
                                );
                              }
                            }()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: cardBackgroundColor,
                margin: EdgeInsets.all(10),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: CupertinoSlidingSegmentedControl<int>(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          thumbColor: cardThumbColor,
                          backgroundColor: cardThumbBackgroundColor.withAlpha(50),
                          children: {
                            0: Text(
                              reachDetails,
                              style: GoogleFonts.sacramento(
                                  color: shapeDecorationTextColor, fontSize: 25, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
                            ),
                            1: Text(
                              autoBioDetails,
                              style: GoogleFonts.sacramento(
                                color: shapeDecorationTextColor,
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          },
                          onValueChanged: (int? val) {
                            setState(() {
                              sharedValue = val!;
                            });
                          },
                          groupValue: sharedValue,
                        ),
                      ),
                      userBIO![sharedValue]!,
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }

  int sharedValue = 0;

  Future<DateTime?> pickDate() => showDatePicker(
      context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100), barrierColor: backgroundColor);

  @override
  initState() {
    loadFormData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _confettiController = ConfettiController(duration: const Duration(seconds: 777));
    _confettiController!.play();

    PoliticalScienceNotifier politicalScienceNotifier = Provider.of<PoliticalScienceNotifier>(context, listen: false);

    _autoBio = politicalScienceNotifier.currentPoliticalScience.autoBio;
    _bestMoment = politicalScienceNotifier.currentPoliticalScience.bestMoment;
    _whyCourseOfStudy = politicalScienceNotifier.currentPoliticalScience.whyCourseOfStudy;
    _highSchool = politicalScienceNotifier.currentPoliticalScience.highSchool;
    _highSchoolGraduationYear = politicalScienceNotifier.currentPoliticalScience.highSchoolGraduationYear;
    _linkedIn = politicalScienceNotifier.currentPoliticalScience.linkedIn;
    _favouriteCourse = politicalScienceNotifier.currentPoliticalScience.favouriteCourse;
    _schoolExecutive = politicalScienceNotifier.currentPoliticalScience.schoolExecutive;
    _schoolExecutivePosition = politicalScienceNotifier.currentPoliticalScience.schoolExecutivePosition;
    _favouriteLocationOnCampus = politicalScienceNotifier.currentPoliticalScience.favouriteLocationOnCampus;
    _favoriteSportOnCampus = politicalScienceNotifier.currentPoliticalScience.favoriteSportOnCampus;
    _snapchat = politicalScienceNotifier.currentPoliticalScience.snapchat;
    _tikTok = politicalScienceNotifier.currentPoliticalScience.tikTok;
    _favSchoolActivity = politicalScienceNotifier.currentPoliticalScience.favSchoolActivity;
    _scpcExecutive = politicalScienceNotifier.currentPoliticalScience.scpcExecutive;
    _scpcExecutivePosition = politicalScienceNotifier.currentPoliticalScience.scpcExecutivePosition;
    _originState = politicalScienceNotifier.currentPoliticalScience.stateOfOrigin;
    _whatsNext = politicalScienceNotifier.currentPoliticalScience.whatsNext;
    _stateResiding = politicalScienceNotifier.currentPoliticalScience.whereYouReside;
    _bestMoment = politicalScienceNotifier.currentPoliticalScience.bestMoment;
    _dob = politicalScienceNotifier.currentPoliticalScience.dob;
    _email = politicalScienceNotifier.currentPoliticalScience.email;
    _facebook = politicalScienceNotifier.currentPoliticalScience.facebook;
    _hobbies = politicalScienceNotifier.currentPoliticalScience.hobbies;
    _instagram = politicalScienceNotifier.currentPoliticalScience.instagram;
    _myDropline = politicalScienceNotifier.currentPoliticalScience.myDropline;
    _name = politicalScienceNotifier.currentPoliticalScience.name;
    _nickname = politicalScienceNotifier.currentPoliticalScience.nickname!;
    _philosophy = politicalScienceNotifier.currentPoliticalScience.philosophy;
    _phone = politicalScienceNotifier.currentPoliticalScience.phone;
    _twitter = politicalScienceNotifier.currentPoliticalScience.twitter;
    _worstMoment = politicalScienceNotifier.currentPoliticalScience.worstMoment;
    _occupation = politicalScienceNotifier.currentPoliticalScience.occupation;

    userBIO = <int, Widget>{
      0: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            (() {
              if (_phone.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: Icon(
                        MdiIcons.dialpad,
                        color: iconTextColorTwo,
                      ),
                      label: Text(callButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_phone.toString().startsWith('0')) {
                          var most = _phone.toString().substring(1);
                          launchURL(callFIRST + most);
                        } else {
                          launchURL(callFIRST + _phone);
                        }
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: Icon(
                          MdiIcons.dialpad,
                          color: iconTextColorTwo,
                        ),
                        label: Text(callButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(callFIRST + _phone);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
            (() {
              if (_phone.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: Icon(
                        MdiIcons.message,
                        color: iconTextColorTwo,
                      ),
                      label: Text(messageButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_phone.toString().startsWith('0')) {
                          var most = _phone.toString().substring(1);
                          launchURL(smsFIRST + most);
                        } else {
                          launchURL(smsFIRST + _phone);
                        }
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: Icon(
                          MdiIcons.message,
                          color: iconTextColorTwo,
                        ),
                        label: Text(messageButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(smsFIRST + _phone);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
            (() {
              if (_phone.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: Icon(
                        MdiIcons.whatsapp,
                        color: iconTextColorTwo,
                      ),
                      label: Text(whatsAppButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_phone.toString().startsWith('0')) {
                          var most = _phone.toString().substring(1);
                          var firstName = _name.toString().substring(0, _name.toString().indexOf(" "));
                          launchURL(whatsAppFIRST + most + whatsAppSECOND + firstName + whatsAppTHIRD);
                        } else {
                          var firstName = _name.toString().substring(0, _name.toString().indexOf(" "));
                          launchURL(whatsAppFIRST + _phone + whatsAppSECOND + firstName + whatsAppTHIRD);
                        }
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: Icon(
                          MdiIcons.whatsapp,
                          color: iconTextColorTwo,
                        ),
                        label: Text(whatsAppButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(smsFIRST + _phone);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
            (() {
              if (_email.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: Icon(
                        MdiIcons.gmail,
                        color: iconTextColorTwo,
                      ),
                      label: Text(emailButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(mailFIRST + _email + mailSECOND + _name);
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: Icon(
                          MdiIcons.gmail,
                          color: iconTextColorTwo,
                        ),
                        label: Text(emailButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(mailFIRST + _email + mailSECOND + _name);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
            (() {
              if (_twitter.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: Icon(
                        MdiIcons.twitter,
                        color: iconTextColorTwo,
                      ),
                      label: Text(twitterButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_twitter.toString().startsWith('@')) {
                          var most = _twitter.toString().substring(1);
                          launchURL(urlTwitter + most);
                        } else {
                          launchURL(urlTwitter + _twitter);
                        }
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: Icon(
                          MdiIcons.twitter,
                          color: iconTextColorTwo,
                        ),
                        label: Text(twitterButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(urlTwitter + _twitter);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
            (() {
              if (_instagram.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: Icon(
                        MdiIcons.instagram,
                        color: iconTextColorTwo,
                      ),
                      label: Text(instagramButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_instagram.toString().startsWith('@')) {
                          var most = _instagram.toString().substring(1);
                          launchURL(urlInstagram + most);
                        } else {
                          launchURL(urlInstagram + _instagram);
                        }
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: Icon(
                          MdiIcons.instagram,
                          color: iconTextColorTwo,
                        ),
                        label: Text(instagramButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(urlInstagram + _instagram);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
            (() {
              if (_snapchat.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: Icon(
                        MdiIcons.snapchat,
                        color: iconTextColorTwo,
                      ),
                      label: Text(snapchatButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_snapchat.toString().startsWith('@')) {
                          var most = _instagram.toString().substring(1);
                          launchURL(urlSnapchat + most);
                        } else {
                          launchURL(urlSnapchat + _snapchat);
                        }
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: Icon(
                          MdiIcons.snapchat,
                          color: iconTextColor,
                        ),
                        label: Text(snapchatButton, style: GoogleFonts.abel(color: iconTextColor, fontSize: 18, fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(urlSnapchat + _snapchat);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
            (() {
              if (_tikTok.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.tiktok,
                        color: iconTextColorTwo,
                      ),
                      label: Text(tikTokButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_tikTok.toString().startsWith('@')) {
                          var most = _tikTok.toString().substring(1);
                          launchURL(urlTikTok + most);
                        } else {
                          launchURL(urlTikTok + _tikTok);
                        }
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: FaIcon(
                          FontAwesomeIcons.tiktok,
                          color: iconTextColorTwo,
                        ),
                        label: Text(tikTokButton, style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(urlTikTok + _tikTok);
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
            (() {
              if (_facebook.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: Icon(
                        MdiIcons.facebook,
                        color: iconTextColorTwo,
                      ),
                      label: Text(
                        facebookButton,
                        style: GoogleFonts.abel(
                            color: iconTextColorTwo,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed,
                            fontWeight: FontWeight.w300),
                      ),
                      onPressed: () {
                        facebookLink();
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: Icon(
                          MdiIcons.facebook,
                          color: iconTextColorTwo,
                        ),
                        label: Text(
                          facebookButton,
                          style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        onPressed: () {
                          facebookLink();
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
            (() {
              if (_linkedIn.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: Icon(
                        MdiIcons.linkedin,
                        color: iconTextColorTwo,
                      ),
                      label: Text(
                        linkedInButton,
                        style: GoogleFonts.abel(
                            color: iconTextColorTwo,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed,
                            fontWeight: FontWeight.w300),
                      ),
                      onPressed: () {
                        linkedInLink();
                      },
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        icon: Icon(
                          MdiIcons.linkedin,
                          color: iconTextColorTwo,
                        ),
                        label: Text(
                          linkedInButton,
                          style: GoogleFonts.abel(color: iconTextColorTwo, fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        onPressed: () {
                          linkedInLink();
                        },
                      ),
                    ),
                  ),
                );
              }
            }()),
          ],
        ),
      ),
      1: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          (() {
            if (_autoBio.toString().isNotEmpty) {
              return Container(
                child: Material(
                  color: materialBackgroundColor,
                  child: InkWell(
                    splashColor: splashColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: autobiographyTitle,
                                style: GoogleFonts.aBeeZee(
                                  color: textColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: ' ' + _autoBio,
                                style: GoogleFonts.trykker(
                                  color: textColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Container(
                    child: Material(
                      color: materialBackgroundColor,
                      child: InkWell(
                        splashColor: splashColor,
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                          child: Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: autobiographyTitle,
                                    style: GoogleFonts.aBeeZee(
                                      color: textColor,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                    text: ' ' + _autoBio,
                                    style: GoogleFonts.trykker(
                                      color: textColor,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                  ));
            }
          }()),
          (() {
            if (_nickname.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: nicknameTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _nickname,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: nicknameTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _nickname,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_bestMoment.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: bestMomentTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _bestMoment,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: bestMomentTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _bestMoment,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_worstMoment.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: worstMomentTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _worstMoment,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: worstMomentTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _worstMoment,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_whyCourseOfStudy.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: whyCourseOfStudyTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _whyCourseOfStudy,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: whyCourseOfStudyTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _whyCourseOfStudy,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_favouriteCourse.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: favouriteCourseTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _favouriteCourse,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: favouriteCourseTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _favouriteCourse,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_favouriteLocationOnCampus.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: favouriteLocationOnCampusTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _favouriteLocationOnCampus,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: favouriteLocationOnCampusTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _favouriteLocationOnCampus,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_favoriteSportOnCampus.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: favoriteSportOnCampusTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _favoriteSportOnCampus,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: favoriteSportOnCampusTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _favoriteSportOnCampus,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_favSchoolActivity.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: favSchoolActivityTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _favSchoolActivity,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: favSchoolActivityTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _favSchoolActivity,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_highSchool.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: highSchoolTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _highSchool,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: highSchoolTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _highSchool,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_highSchoolGraduationYear.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: highSchoolGraduationYearTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _highSchoolGraduationYear,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: highSchoolGraduationYearTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _highSchoolGraduationYear,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_schoolExecutive.toString() == "Yes") {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: schoolExecutivePositionTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _schoolExecutivePosition,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: schoolExecutivePositionTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _schoolExecutivePosition,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_scpcExecutive.toString() == "Yes") {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: scpcExecutivePositionTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _scpcExecutivePosition,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: scpcExecutivePositionTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _scpcExecutivePosition,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_whatsNext.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: whatsNextAfterTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _whatsNext,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: whatsNextAfterTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _whatsNext,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_occupation.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: occupationTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _occupation,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: occupationTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _occupation,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_dob.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: dobTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _dob,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: dobTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _dob,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_originState.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: stateOfOriginTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _originState,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: stateOfOriginTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _originState,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_stateResiding.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: currentResidenceStateTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _stateResiding,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: currentResidenceStateTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _stateResiding,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_hobbies.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: hobbiesTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _hobbies,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: hobbiesTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _hobbies,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_philosophy.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: philosophyTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _philosophy,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: philosophyTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _philosophy,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
          (() {
            if (_myDropline.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColor,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: droplineTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _myDropline,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: droplineTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _myDropline,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(50), borderRadius: new BorderRadius.circular(10)),
                    ),
                  ));
            }
          }()),
        ],
      ),
    };
    super.initState();
  }

  Future<void> loadFormData() async {
    String collectionName = 'DepartmentGraduatesC';

    try {
      // Query the Firestore collection
      QuerySnapshot querySnapshot =
          await firestore.collection('universities').doc(widget.clubId).collection(collectionName).where('name', isEqualTo: _name).limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Get the first document from the query results
        DocumentSnapshot documentSnapshot = querySnapshot.docs[0];

        // Set the initial values for your form fields based on the data from Firebase
        setState(() {
          _myHighSchoolController.text = documentSnapshot['high_school'];
          _myWhyCourseOfStudyController.text = documentSnapshot['why_course_of_study'];
          _myBestMomentInUniversityController.text = documentSnapshot['best_moment'];
          _myWorstMomentInUniversityController.text = documentSnapshot['worst_moment'];
          _myHighSchoolGraduationYearController.text = documentSnapshot['high_school_graduation_year'];
          _myHobbiesController.text = documentSnapshot['hobbies'];
          _myNicknameController.text = documentSnapshot['nickname'];
          _myFavSchoolActivityController.text = documentSnapshot['fav_school_activity'];
          _myFavouriteCourseController.text = documentSnapshot['favourite_course'];
          _myFavouriteLocationOnCampusController.text = documentSnapshot['favourite_location_in_campus'];
          _myFavoriteSportOnCampusController.text = documentSnapshot['favorite_sport_in_campus'];
          _myWhatsNextController.text = documentSnapshot['whats_next'];
          _myStateResidingController.text = documentSnapshot['where_you_reside'];
          _myOriginStateController.text = documentSnapshot['state_of_origin'];
          _myOccupationController.text = documentSnapshot['occupation'];
          _myAutobiographyController.text = documentSnapshot['autobio'];
          _myPhilosophyController.text = documentSnapshot['philosophy'];
          _myDroplineController.text = documentSnapshot['my_dropline'];
          _myPhoneNumberController.text = documentSnapshot['phone'];
          _myEmailAddressController.text = documentSnapshot['email'];
          _myFacebookController.text = documentSnapshot['facebook'];
          _myInstagramController.text = documentSnapshot['instagram'];
          _myLinkedInController.text = documentSnapshot['linkedIn'];
          _myTwitterController.text = documentSnapshot['twitter'];
          _myTikTokController.text = documentSnapshot['tiktok'];
          _mySnapchatController.text = documentSnapshot['snapchat'];

          formattedDate = documentSnapshot['d_o_b'] ?? getFormattedDate(selectedDateA).toUpperCase();

          // _selectedFootballPositionRole = documentSnapshot['position_playing'] ?? 'Select One';
          // _selectedLOrRFootedRole = documentSnapshot['left_or_right'] ?? 'Select One';
          // _selectedAdidasOrNikeRole = documentSnapshot['adidas_or_nike'] ?? 'Select One';
          // _selectedRonaldoOrMessiRole = documentSnapshot['ronaldo_or_messi'] ?? 'Select One';
          // _selectedCaptainRole = documentSnapshot['captain'] ?? 'Select One';
          // _selectedCaptainTeamRole = documentSnapshot['team_captaining'] ?? 'Select One';

          // Modified loadFormData function section
          if (documentSnapshot['department_executive'] == "") {
            _selectedDepartmentExecutiveRole = 'Select One';
          } else {
            _selectedDepartmentExecutiveRole =
                validateDropdownValue(documentSnapshot['department_executive'], _departmentExecutiveOptions) ?? 'Select One';
          }

          if (documentSnapshot['department_executive_position'] == "") {
            _selectedDepartmentExecutivePositionRole = 'Select One';
          } else {
            _selectedDepartmentExecutivePositionRole =
                validateDropdownValue(documentSnapshot['department_executive_position'], _departmentExecutivePositionOptions) ?? 'Select One';
          }
        });
      } else {
        if (kDebugMode) {
          print('Document not found.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading form data: $e');
      }
    }
  }

  Future<void> _sendOtpToPhoneNumber() async {
    // String phoneNumber = "+447541315929"; // Replace with your hardcoded phone number
    String phoneNumber = "+$_phone"; // Replace with your hardcoded phone number

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          if (kDebugMode) {
            print('Logged In Successfully via SMS');
          }

          Fluttertoast.showToast(
            msg: 'You’re Welcome',
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.deepOrangeAccent,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          if (kDebugMode) {
            print("SMS Verification failed: ${e.message}");
          }

          Fluttertoast.showToast(
            msg: 'For SMS: Hmm. Check your Internet Connection or maybe too many OTP requests',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.deepOrangeAccent,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          throw Exception("Error sending SMS OTP: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) async {
          _receivedSmsId = verificationId;

          Fluttertoast.showToast(
            msg: 'Success! OTP sent via SMS',
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.deepOrangeAccent,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          await Future.delayed(const Duration(seconds: 5));

          setState(() {
            isSmsOtpGenerated = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (kDebugMode) {
            print('SMS OTP TimeOut');
          }
        },
      );

      // Simultaneously send WhatsApp OTP
      await sendWhatsAppVerification();
    } catch (e) {
      if (kDebugMode) {
        print('Error sending OTP: $e');
      }
      Fluttertoast.showToast(
        msg: 'Error sending OTP. Please try again.',
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw Exception("Error sending OTP: $e");
    }
  }

  Future<void> sendWhatsAppVerification() async {
    // Assuming you have the phone number stored
    String phoneNumber = "+$_phone";

    // Generate OTP
    String generatedOtp = _whatsAppOtpService.generateOtp();

    // Send OTP via WhatsApp
    bool otpSent = await _whatsAppOtpService.sendWhatsAppOtp(phoneNumber, generatedOtp);

    if (otpSent) {
      // Store OTP for verification
      setState(() {
        _whatsappOtp = generatedOtp;
      });

      if (kDebugMode) {
        print('WhatsApp number: $phoneNumber  otp: $generatedOtp');
      }

      Fluttertoast.showToast(
        msg: 'OTP sent via WhatsApp',
        backgroundColor: Colors.green,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to send WhatsApp OTP',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> verifyOTPCode() async {
    try {
      bool isVerified = otpCode == _whatsappOtp;
      // Try verification with Firebase SMS
      try {
        PhoneAuthCredential smsCredential = PhoneAuthProvider.credential(
          verificationId: _receivedSmsId,
          smsCode: otpCode,
        );

        await auth.signInWithCredential(smsCredential);
        isVerified = true;
        // await _handleSuccessfulVerification();
        // return;
      } catch (smsVerificationError) {
        if (kDebugMode) {
          print('SMS Verification Error: $smsVerificationError');
        }
      }

      // If SMS verification fails, check WhatsApp OTP
      if (isVerified) {
        // if (otpCode == _whatsappOtp) {
        await _handleSuccessfulVerification();
        // return;
      } else {
        if (kDebugMode) {
          print('WhatsApp OTP Mismatch');

          print('Entered OTP: $otpCode');
          print('WhatsApp OTP: $_whatsappOtp');
        }

        // If both methods fail
        Fluttertoast.showToast(
          msg: 'OTP incorrect. Please retype.',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.deepOrangeAccent,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        throw Exception("OTP Verification Failed");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error verifying OTP: $e');
      }

      Fluttertoast.showToast(
        msg: 'OTP incorrect. Please retype.',
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.deepOrangeAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      throw Exception("Error verifying OTP: $e");
    }
  }

  // Helper method to handle successful verification
  Future<void> _handleSuccessfulVerification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userProperties = prefs.getString('verificationUserProperties');
    String currentProperties = _name;

    if (userProperties == null || userProperties != currentProperties) {
      prefs.setString('verificationUserProperties', currentProperties);
      prefs.setInt('verificationTime', DateTime.now().millisecondsSinceEpoch);
    }

    setState(() {
      isOtpVerified = true;
    });

    Fluttertoast.showToast(
      msg: 'Verified. Thank you.',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.deepOrangeAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    if (mounted) {
      Navigator.pop(context);
    }

    if (isModifyingAutobiography) {
      _showAutobiographyModificationDialog();
    } else {
      _showImageModificationDialog();
    }
  }

  void modifyProfile() async {
    if (await isUserVerifiedRecently()) {
      if (isModifyingAutobiography) {
        _showAutobiographyModificationDialog();
      } else {
        _showImageModificationDialog();
      }
    } else {
      await _showDialogAndVerify();
      Fluttertoast.showToast(
        msg: "Click 'Generate OTP' first",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0,
      );
    }
  }

  Future<void> _showDialogAndVerify() async {
    final GlobalKey<FormState> dialogFormKey = GlobalKey<FormState>();

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => PopScope(
        onPopInvokedWithResult: (didPop, result) async {
          otpCode = '';
          isOTPComplete = false;

          if (didPop) {
            Navigator.of(context).pop();
          }
        },
        canPop: true,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: const Color.fromRGBO(223, 225, 229, 1.0),
          title: const Text(
            "Please click 'Generate OTP', input your OTP from the sent sms.",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await _sendOtpToPhoneNumber();
              },
              child: const Text('Generate OTP', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                verifyOTPCode();
                setState(() {
                  otpCode = '';
                });
              },
              child: const Text('Verify OTP', style: TextStyle(color: Colors.black)),
            ),
          ],
          content: Padding(
            padding: const EdgeInsets.all(6.0),
            child: AbsorbPointer(
              absorbing: !isSmsOtpGenerated,
              child: Form(
                key: dialogFormKey,
                child: GestureDetector(
                  onTap: () {
                    if (!isSmsOtpGenerated) {
                      Fluttertoast.showToast(
                        msg: 'Please generate OTP first',
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                  child: PinFieldAutoFill(
                    autoFocus: true,
                    currentCode: otpCode,
                    decoration: BoxLooseDecoration(
                      gapSpace: 5,
                      radius: const Radius.circular(8),
                      strokeColorBuilder: isSmsOtpGenerated ? const FixedColorBuilder(Color(0xFFE16641)) : const FixedColorBuilder(Colors.grey),
                    ),
                    codeLength: 6,
                    onCodeChanged: (code) {
                      if (kDebugMode) {
                        print("OnCodeChanged : $code");
                      }
                      otpCode = code.toString();
                      isOTPComplete = code!.length == 6;
                    },
                    onCodeSubmitted: (val) {
                      if (kDebugMode) {
                        print("OnCodeSubmitted : $val");
                      }
                      isOTPComplete = val.isEmpty;
                      otpCode = '';
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> isUserVerifiedRecently() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userProperties = prefs.getString('verificationUserProperties');
    String currentProperties = _name;
    if (kDebugMode) {
      print("User properties from SharedPreferences: $userProperties");
    }

    if (userProperties != null && userProperties == currentProperties) {
      int? verificationTime = prefs.getInt('verificationTime');
      if (verificationTime != null) {
        DateTime now = DateTime.now();
        DateTime verificationDateTime = DateTime.fromMillisecondsSinceEpoch(verificationTime);

        return now.difference(verificationDateTime).inMinutes <= 30;
      }
    }
    return false;
  }

  void resetVerificationTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('verificationUserProperties');
    prefs.remove('verificationTime');
  }

  void _showAutobiographyModificationDialog() {
    // final GlobalKey<FormState> dialogFormKey = GlobalKey<FormState>();

    showDialog<String>(
      barrierColor: const Color.fromRGBO(66, 67, 69, 1.0),
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: const Color.fromRGBO(223, 225, 229, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myFavSchoolActivityController,
                  decoration: const InputDecoration(
                    labelText: 'Your Favourite School Activity',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Using the school's library",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myFavouriteLocationOnCampusController,
                  decoration: const InputDecoration(
                    labelText: 'Your Favourite Location on Campus',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Sports Center",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myFavoriteSportOnCampusController,
                  decoration: const InputDecoration(
                    labelText: 'Your Favourite Sport on Campus',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Badminton and Table Tennis",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myBestMomentInUniversityController,
                  decoration: const InputDecoration(
                    labelText: 'Your Best Moment in University',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "When I gave the TEDx talk in year 3",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myWorstMomentInUniversityController,
                  decoration: const InputDecoration(
                    labelText: 'Your Worst Moment in University',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "When I failed my first year exams",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myFavouriteCourseController,
                  decoration: const InputDecoration(
                    labelText: 'Your Favourite Course',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Introduction to Computer Science",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myWhyCourseOfStudyController,
                  decoration: const InputDecoration(
                    labelText: 'Why did you choose your course of study',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "I love solving problems and creating solutions",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myAutobiographyController,
                  decoration: const InputDecoration(
                    labelText: 'Your Autobiography',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "I am well outspoken and love to meet new people",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myHobbiesController,
                  decoration: const InputDecoration(
                    labelText: 'Your Hobbies',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Travelling, Music, Reading",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myNicknameController,
                  decoration: const InputDecoration(
                    labelText: 'Your Nickname',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "The Congressman",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myHighSchoolController,
                  decoration: const InputDecoration(
                    labelText: 'Your High School',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Isolog Secondary School",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myHighSchoolGraduationYearController,
                  decoration: const InputDecoration(
                    labelText: 'Your High School Graduation Year',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "2022",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myPhilosophyController,
                  decoration: const InputDecoration(
                    labelText: 'Your Philosophy about Life',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Life is a journey, not a destination",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myDroplineController,
                  decoration: const InputDecoration(
                    labelText: 'Your Dropline to Junior Colleagues',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Always be kind and helpful",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myOccupationController,
                  decoration: const InputDecoration(
                    labelText: 'Your Occupation',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Software Developer Trainee",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myWhatsNextController,
                  decoration: const InputDecoration(
                    labelText: 'What\'s Next for you',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "I plan to start my own tech company",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myStateResidingController,
                  decoration: const InputDecoration(
                    labelText: 'Your Current State of Residence',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Lagos State, Nigeria",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myOriginStateController,
                  decoration: const InputDecoration(
                    labelText: 'Your State of Origin',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Rivers State, Nigeria",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myPhoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Your Phone Number',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "+447541315929",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myEmailAddressController,
                  decoration: const InputDecoration(
                    labelText: 'Your Email Address',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "tomi@nouvellesoft.io",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myLinkedInController,
                  decoration: const InputDecoration(
                    labelText: 'Your LinkedIn Name',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Samuel Agbede",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myFacebookController,
                  decoration: const InputDecoration(
                    labelText: 'Your Facebook Name',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "Felicia London",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myTwitterController,
                  decoration: const InputDecoration(
                    labelText: 'Your Twitter Username',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "@olludepo",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myInstagramController,
                  decoration: const InputDecoration(
                    labelText: 'Your Instagram Username',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "davidautobio",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _myTikTokController,
                  decoration: const InputDecoration(
                    labelText: 'Your TikTok Username',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "stella.01",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black54,
                  style: GoogleFonts.cabin(color: textColor),
                  controller: _mySnapchatController,
                  decoration: const InputDecoration(
                    labelText: 'Your Snapchat Username',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    floatingLabelStyle: TextStyle(color: Colors.black87),
                    hintText: "edwin_greaves",
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your Birthday',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(225, 231, 241, 1.0),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            date = await pickDate();
                            if (date == null) return;

                            final newDateTime = DateTime(date!.year, date!.month, date!.day, selectedDateA.hour, selectedDateA.minute);

                            setState(() {
                              selectedDateA = newDateTime;
                              formattedDate = getFormattedDate(selectedDateA).toUpperCase();
                            });
                          },
                          splashColor: splashColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  formattedDate != "" ? formattedDate!.toUpperCase() : 'Choose your birth date',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.visible,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: validateDropdownValue(_selectedDepartmentExecutiveRole, _departmentExecutiveOptions),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDepartmentExecutiveRole = newValue!;
                    });
                  },
                  items: _departmentExecutiveOptions.map((role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(
                        role,
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Where you a Prefect',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: validateDropdownValue(_selectedDepartmentExecutivePositionRole, _departmentExecutivePositionOptions),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDepartmentExecutivePositionRole = newValue!;
                    });
                  },
                  items: _departmentExecutivePositionOptions.map((role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(
                        role,
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'If Yes, what role where you a Prefect',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    await _submitForm();
                    if (context.mounted) {
                      Navigator.pop(context); // Close the dialog
                    }
                  },
                  child: const Text('Update Autobiography'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showImageModificationDialog() {
    // final GlobalKey<FormState> dialogFormKey = GlobalKey<FormState>();

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: const Color.fromRGBO(223, 225, 229, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .6,
                      child: const Text(
                        'Click each image to replace your profile pictures',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                // Display the selected images or placeholder icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => selectImageOne(),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 4.1,
                        height: MediaQuery.sizeOf(context).width / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withAlpha(20),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: _imageOne != null
                            ? Image.file(_imageOne!, height: 100, width: 100, fit: BoxFit.cover)
                            : CachedNetworkImage(
                                imageUrl: politicalScienceNotifier.currentPoliticalScience.image!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(MdiIcons.alertRhombus),
                              ),
                      ),
                    ),
                    InkWell(
                      onTap: () => selectImageTwo(),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 4.1,
                        height: MediaQuery.sizeOf(context).width / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withAlpha(20),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: _imageTwo != null
                            ? Image.file(_imageTwo!, height: 100, width: 100, fit: BoxFit.cover)
                            : CachedNetworkImage(
                                imageUrl: politicalScienceNotifier.currentPoliticalScience.imageTwo!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(MdiIcons.alertRhombus),
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Button to upload the selected images to Firebase Storage
                ElevatedButton(
                  onPressed: () async {
                    await _checkAndUpdatePhoto();
                  },
                  child: const Text('Upload Photos'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  facebookLink() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        backgroundColor: backgroundColor,
        title: Text(
          facebookProfileSharedPreferencesTitle,
          style: TextStyle(color: cardBackgroundColor),
        ),
        content: Text(
          facebookProfileSharedPreferencesContentOne + _facebook + facebookProfileSharedPreferencesContentTwo,
          textAlign: TextAlign.justify,
          style: TextStyle(color: cardBackgroundColor),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              launchURL(urlFacebook);
              Fluttertoast.showToast(msg: "Loading up Facebook.com", gravity: ToastGravity.BOTTOM, backgroundColor: backgroundColor);
            },
            child: Text(
              facebookProfileSharedPreferencesButton,
              style: TextStyle(color: cardBackgroundColor),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              facebookProfileSharedPreferencesButtonTwo,
              style: TextStyle(color: cardBackgroundColor),
            ),
          ),
        ],
      ),
    );
//    }
  }

  linkedInLink() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        backgroundColor: backgroundColor,
        title: Text(
          linkedInProfileSharedPreferencesTitle,
          style: TextStyle(color: cardBackgroundColor),
        ),
        content: Text(
          linkedInProfileSharedPreferencesContentOne + _linkedIn + linkedInProfileSharedPreferencesContentTwo,
          textAlign: TextAlign.justify,
          style: TextStyle(color: cardBackgroundColor),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              launchURL(urlLinkedIn);
              Fluttertoast.showToast(msg: "Loading up LinkedIn.com", gravity: ToastGravity.BOTTOM, backgroundColor: backgroundColor);
            },
            child: Text(
              linkedInProfileSharedPreferencesButton,
              style: TextStyle(color: cardBackgroundColor),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              linkedInProfileSharedPreferencesButtonTwo,
              style: TextStyle(color: cardBackgroundColor),
            ),
          ),
        ],
      ),
    );
//    }
  }

  @override
  void dispose() {
    _confettiController!.dispose();
    super.dispose();
  }
}
