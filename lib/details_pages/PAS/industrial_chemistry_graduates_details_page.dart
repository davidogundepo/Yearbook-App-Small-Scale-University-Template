
import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../notifier/PAS_NOTIFIER/industrial_chemistry_graduates_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';


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


String schoolName = "ABC University";
String courseDepartmentName = "Economics";


String reachDetails = "Reach";
String autoBioDetails = "AutoBio";

String callButton = "Call";
String messageButton = "Send a Message";
String whatsAppButton = "Send a WhatsApp Message";
String emailButton = "Send an Email";
String twitterButton = "My Twitter";
String instagramButton = "My Instagram";
String linkedInButton = "My LinkedIn";
String facebookButton = "My Facebook";

String autobiographyTitle = "Autobiography\n";
String nicknameTitle = "My Nickname\n";
String bestMomentTitle = "Best Moment in School\n";
String worstMomentTitle = "Worst Moment in School\n";
String whyCourseOfStudyTitle = "Why study $courseDepartmentName\n";
String favouriteCoursesTitle = "Favourite Courses\n";
String favouriteLocationOnCampusTitle = "Favourite Place on Campus\n";
String favoriteSportOnCampusTitle = "Favourite Sport on Campus\n";
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
String linkedInProfileSharedPreferencesContentOne= "Apparently, you'd need to search manually for ";
String linkedInProfileSharedPreferencesContentTwo = ", on LinkedIn.com";
String linkedInProfileSharedPreferencesButton = "Go to LinkedIn";
String linkedInProfileSharedPreferencesButtonTwo = "Lol, No";

String facebookProfileSharedPreferencesTitle = "Manual Website Search";
String facebookProfileSharedPreferencesContentOne= "Apparently, you'd need to search manually for ";
String facebookProfileSharedPreferencesContentTwo = ", on Facebook.com";
String facebookProfileSharedPreferencesButton = "Go to Facebook";
String facebookProfileSharedPreferencesButtonTwo = "Lol, No";


Color backgroundColor = Color.fromRGBO(189, 170, 176, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(189, 150, 176, 1);
Color appBarIconColor = Colors.white;
Color materialBackgroundColor = Colors.transparent;
Color shapeDecorationColor = Color.fromRGBO(189, 150, 176, 1);
Color shapeDecorationTextColor = Color.fromRGBO(189, 150, 176, 1);
Color cardBackgroundColor = Colors.white;
Color cardThumbColor = Colors.white;
Color cardThumbBackgroundColor = Color.fromRGBO(189, 150, 176, 1);
Color splashColor = Color.fromRGBO(189, 150, 176, 1);
Color splashColorTwo = Colors.white;
Color iconTextColor = Color.fromRGBO(189, 150, 176, 1);
Color iconTextColorTwo = Colors.white;
Color buttonColor = Color.fromRGBO(189, 150, 176, 1);
Color textColor = Color.fromRGBO(189, 150, 176, 1);
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


IndustrialChemistryNotifier industrialChemistryNotifier;

Map<int, Widget> userBIO;

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
var _favouriteCourses;
var _schoolExecutive;
var _schoolExecutivePosition;
var _favouriteLocationOnCampus;
var _favoriteSportOnCampus;
var _twitter;
var _whatsNext;
var _stateResiding;
var _originState;
var _worstMoment;
var _occupation;

class MyIndustrialChemistryGraduatesDetailsPage extends StatefulWidget {
  @override
  _MyIndustrialChemistryGraduatesDetailsPageState createState() => _MyIndustrialChemistryGraduatesDetailsPageState();
}

class _MyIndustrialChemistryGraduatesDetailsPageState extends State<MyIndustrialChemistryGraduatesDetailsPage> {

  ConfettiController _confettiController;

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Future launchURL(String url) async{
    if(await canLaunch(url)) {
      await launch(url);
    } else{
      print("Can't Launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {

    industrialChemistryNotifier = Provider.of<IndustrialChemistryNotifier>(context, listen: true);

    return ConfettiWidget(
      confettiController: _confettiController,
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
          title: Text(industrialChemistryNotifier.currentIndustrialChemistry.nickname,
            style: GoogleFonts.sanchez(
                color: appBarTextColor,
                fontSize: 25,
                fontWeight: FontWeight.w400
            ),),
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
                        imageUrl: industrialChemistryNotifier.currentIndustrialChemistry.image,
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
                  message: industrialChemistryNotifier.currentIndustrialChemistry.name
              ),
              Material(
                color: materialBackgroundColor,
                child: InkWell(
                  splashColor: splashColor.withOpacity(0.20),
                  onTap: () {},
                  child: Card(
                    elevation: 4,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: shapeDecorationColor.withOpacity(0.70), width: 4.0, style: BorderStyle.solid
                      ),
                    ),

                    margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 16.0,
                          right: 16.0,
                          bottom: 16.0),

                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(industrialChemistryNotifier.currentIndustrialChemistry.name.toUpperCase(),
                              style: GoogleFonts.blinker(
                                  color: shapeDecorationTextColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            (() {
                              if (industrialChemistryNotifier.currentIndustrialChemistry.schoolExecutive == "Yes") {
                                return
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 10),
                                      Icon (
                                        MdiIcons.checkboxMarkedCircle,
                                        color: iconTextColor,
                                      ),
                                    ],
                                  );
                              } else {
                                return Visibility(
                                  visible: !_isVisible,
                                  child: Icon (
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
                            0: Text(reachDetails,
                              style: GoogleFonts.sacramento(
                                  color: shapeDecorationTextColor,
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            1: Text(autoBioDetails,
                              style: GoogleFonts.sacramento(
                                color: shapeDecorationTextColor,
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                          },
                          onValueChanged: (int val) {
                            setState(() {
                              sharedValue = val;

                            });
                          },
                          groupValue: sharedValue,
                        ),
                      ),
                      userBIO[sharedValue],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  int sharedValue = 0;

  initState(){
    _confettiController = ConfettiController(duration: const Duration(seconds: 35));
    _confettiController.play();

    IndustrialChemistryNotifier industrialChemistryNotifier = Provider.of<IndustrialChemistryNotifier>(context, listen: false);

    _autoBio = industrialChemistryNotifier.currentIndustrialChemistry.autoBio;
    _bestMoment = industrialChemistryNotifier.currentIndustrialChemistry.bestMoment;
    _whyCourseOfStudy = industrialChemistryNotifier.currentIndustrialChemistry.whyCourseOfStudy;
    _highSchool = industrialChemistryNotifier.currentIndustrialChemistry.highSchool;
    _highSchoolGraduationYear = industrialChemistryNotifier.currentIndustrialChemistry.highSchoolGraduationYear;
    _linkedIn = industrialChemistryNotifier.currentIndustrialChemistry.linkedIn;
    _favouriteCourses = industrialChemistryNotifier.currentIndustrialChemistry.favouriteCourses;
    _schoolExecutive = industrialChemistryNotifier.currentIndustrialChemistry.schoolExecutive;
    _schoolExecutivePosition = industrialChemistryNotifier.currentIndustrialChemistry.schoolExecutivePosition;
    _favouriteLocationOnCampus = industrialChemistryNotifier.currentIndustrialChemistry.favouriteLocationOnCampus;
    _favoriteSportOnCampus = industrialChemistryNotifier.currentIndustrialChemistry.favoriteSportOnCampus;
    _originState = industrialChemistryNotifier.currentIndustrialChemistry.stateOfOrigin;
    _whatsNext = industrialChemistryNotifier.currentIndustrialChemistry.whatsNext;
    _stateResiding = industrialChemistryNotifier.currentIndustrialChemistry.whereYouReside;
    _bestMoment = industrialChemistryNotifier.currentIndustrialChemistry.bestMoment;
    _dob = industrialChemistryNotifier.currentIndustrialChemistry.dob;
    _email = industrialChemistryNotifier.currentIndustrialChemistry.email;
    _facebook = industrialChemistryNotifier.currentIndustrialChemistry.facebook;
    _hobbies = industrialChemistryNotifier.currentIndustrialChemistry.hobbies;
    _instagram = industrialChemistryNotifier.currentIndustrialChemistry.instagram;
    _myDropline = industrialChemistryNotifier.currentIndustrialChemistry.myDropline;
    _name = industrialChemistryNotifier.currentIndustrialChemistry.name;
    _nickname = industrialChemistryNotifier.currentIndustrialChemistry.nickname;
    _philosophy = industrialChemistryNotifier.currentIndustrialChemistry.philosophy;
    _phone = industrialChemistryNotifier.currentIndustrialChemistry.phone;
    _twitter = industrialChemistryNotifier.currentIndustrialChemistry.twitter;
    _worstMoment = industrialChemistryNotifier.currentIndustrialChemistry.worstMoment;
    _occupation = industrialChemistryNotifier.currentIndustrialChemistry.occupation;


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
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: new Icon(
                        MdiIcons.dialpad,
                        color: iconTextColorTwo,
                      ),
                      label: Text(callButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_phone.toString().startsWith('0')) {
                          var most = _phone.toString().substring(1);
                          launchURL(callFIRST +most);
                        }
                        else {
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
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: new Icon(
                          MdiIcons.dialpad,
                          color: iconTextColorTwo,
                        ),
                        label: Text(callButton,
                            style: GoogleFonts.abel(
                                color: iconTextColorTwo,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
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
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: new Icon(
                        MdiIcons.message,
                        color: iconTextColorTwo,
                      ),
                      label: Text(messageButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_phone.toString().startsWith('0')) {
                          var most = _phone.toString().substring(1);
                          launchURL(smsFIRST +most);
                        }
                        else {
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
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: new Icon(
                          MdiIcons.message,
                          color: iconTextColorTwo,
                        ),
                        label: Text(messageButton,
                            style: GoogleFonts.abel(
                                color: iconTextColorTwo,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
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
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: new Icon(
                        MdiIcons.whatsapp,
                        color: iconTextColorTwo,
                      ),
                      label: Text(whatsAppButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_phone.toString().startsWith('0')) {
                          var most = _phone.toString().substring(1);
                          var firstName = _name.toString().substring(0, _name.toString().indexOf(" "));
                          launchURL(whatsAppFIRST + most + whatsAppSECOND + firstName + whatsAppTHIRD);
                        }
                        else {
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
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: new Icon(
                          MdiIcons.whatsapp,
                          color: iconTextColorTwo,
                        ),
                        label: Text(whatsAppButton,
                            style: GoogleFonts.abel(
                                color: iconTextColorTwo,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
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
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: new Icon(
                        MdiIcons.gmail,
                        color: iconTextColorTwo,
                      ),
                      label: Text(emailButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
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
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: new Icon(
                          MdiIcons.gmail,
                          color: iconTextColorTwo,
                        ),
                        label: Text(emailButton,
                            style: GoogleFonts.abel(
                                color: iconTextColorTwo,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
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
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: new Icon(
                        MdiIcons.twitterCircle,
                        color: iconTextColorTwo,
                      ),
                      label: Text(twitterButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_twitter.toString().startsWith('@')) {
                          var most = _twitter.toString().substring(1);
                          launchURL(urlTwitter + most);
                        }
                        else {
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
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: new Icon(
                          MdiIcons.twitterCircle,
                          color: iconTextColorTwo,
                        ),
                        label: Text(twitterButton,
                            style: GoogleFonts.abel(
                                color: iconTextColorTwo,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
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
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: new Icon(
                        MdiIcons.instagram,
                        color: iconTextColorTwo,
                      ),
                      label: Text(instagramButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        if (_instagram.toString().startsWith('@')) {
                          var most = _instagram.toString().substring(1);
                          launchURL(urlInstagram + most);
                        }
                        else {
                          launchURL(urlInstagram + _instagram);
                        }

                        launchURL(urlInstagram + _instagram);
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
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: new Icon(
                          MdiIcons.instagram,
                          color: iconTextColorTwo,
                        ),
                        label: Text(instagramButton,
                            style: GoogleFonts.abel(
                                color: iconTextColorTwo,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
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
              if (_facebook.toString().isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: new Icon(
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
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: new Icon(
                          MdiIcons.facebook,
                          color: iconTextColorTwo,
                        ),
                        label: Text(
                          facebookButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          ),
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
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: new Icon(
                        MdiIcons.linkedinBox,
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
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: new Icon(
                          MdiIcons.linkedinBox,
                          color: iconTextColorTwo,
                        ),
                        label: Text(
                          linkedInButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
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
                      padding:
                      const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                decoration: BoxDecoration(
                    color: shapeDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)),
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
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 15, left: 25),
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
                    decoration: BoxDecoration(
                        color: shapeDecorationColor.withAlpha(50),
                        borderRadius: new BorderRadius.circular(10)),
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                                  style:  GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: ' '+_whyCourseOfStudy,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)
                  ),
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
                                      style:  GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  TextSpan(
                                      text: ' '+_whyCourseOfStudy,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_favouriteCourses.toString().isNotEmpty) {
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
                                  text: favouriteCoursesTitle,
                                  style:  GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: ' '+_favouriteCourses,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)
                  ),
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
                                      text: favouriteCoursesTitle,
                                      style:  GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  TextSpan(
                                      text: ' '+_favouriteCourses,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)
                      ),
                    ),
                  )
              );
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
                                  style:  GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: ' '+_favouriteLocationOnCampus,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)
                  ),
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
                                      style:  GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  TextSpan(
                                      text: ' '+_favouriteLocationOnCampus,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)
                      ),
                    ),
                  )
              );
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
                                  style:  GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: ' '+_favoriteSportOnCampus,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)
                  ),
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
                                      style:  GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  TextSpan(
                                      text: ' '+_favoriteSportOnCampus,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)
                      ),
                    ),
                  )
              );
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
                                  style:  GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: ' '+_highSchool,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)
                  ),
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
                                      style:  GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  TextSpan(
                                      text: ' '+_highSchool,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                      ),

                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)
                      ),
                    ),
                  )
              );
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
                                  style:  GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: ' '+_highSchoolGraduationYear,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)
                  ),
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
                                      style:  GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  TextSpan(
                                      text: ' '+_highSchoolGraduationYear,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)
                      ),
                    ),
                  )
              );
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
                                  style:  GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: ' '+_schoolExecutivePosition,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)
                  ),
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
                                      style:  GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )
                                  ),
                                  TextSpan(
                                      text: ' '+_schoolExecutivePosition,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)
                      ),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
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
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                  decoration: BoxDecoration(
                      color: shapeDecorationColor.withAlpha(50),
                      borderRadius: new BorderRadius.circular(10)),
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
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
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
                      decoration: BoxDecoration(
                          color: shapeDecorationColor.withAlpha(50),
                          borderRadius: new BorderRadius.circular(10)),
                    ),
                  )
              );
            }
          }()),
        ],
      ),
    };
    super.initState();
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
          style: TextStyle(
              color: cardBackgroundColor
          ),
        ),
        content: Text(
          facebookProfileSharedPreferencesContentOne + _facebook + facebookProfileSharedPreferencesContentTwo,
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: cardBackgroundColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              launchURL(urlFacebook);
              Toast.show("Loading up Facebook.com",
                  context, duration:
                  Toast.LENGTH_LONG,
                  gravity:  Toast.BOTTOM,
                  textColor: cardBackgroundColor,
                  backgroundColor: backgroundColor,
                  backgroundRadius: 10
              );
            },
            child: Text(facebookProfileSharedPreferencesButton,
              style: TextStyle(
                  color: cardBackgroundColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(facebookProfileSharedPreferencesButtonTwo,
              style: TextStyle(
                  color: cardBackgroundColor
              ),
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
          style: TextStyle(
              color: cardBackgroundColor
          ),
        ),
        content: Text(
          linkedInProfileSharedPreferencesContentOne + _linkedIn + linkedInProfileSharedPreferencesContentTwo,
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: cardBackgroundColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              launchURL(urlLinkedIn);
              Toast.show("Loading up LinkedIn.com",
                  context, duration:
                  Toast.LENGTH_LONG,
                  gravity:  Toast.BOTTOM,
                  textColor: cardBackgroundColor,
                  backgroundColor: backgroundColor,
                  backgroundRadius: 10
              );
            },
            child: Text(linkedInProfileSharedPreferencesButton,
              style: TextStyle(
                  color: cardBackgroundColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(linkedInProfileSharedPreferencesButtonTwo,
              style: TextStyle(
                  color: cardBackgroundColor
              ),
            ),
          ),

        ],
      ),
    );
//    }
  }


  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }


}
