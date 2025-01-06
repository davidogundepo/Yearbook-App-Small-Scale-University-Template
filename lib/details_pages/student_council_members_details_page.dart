import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '.././notifier/student_council_members_notifier.dart';

String positionEnforced = "Position Enforced\n";
String department = "Academic Department\n";

Color backgroundColor = Color.fromRGBO(247, 164, 64, 1);
Color appBarBackgroundColor = Color.fromRGBO(247, 164, 64, 1);
Color appBarIconColor = Color.fromRGBO(164, 107, 39, 1.0);
Color materialBackgroundColor = Colors.transparent;
Color shapeDecorationColor = Color.fromRGBO(247, 164, 64, 1);
Color shapeDecorationTextColor = Colors.white;
Color shapeDecorationIconColor = Colors.white;
Color cardBackgroundColor = Color.fromRGBO(164, 107, 39, 1.0);
Color splashColor = Color.fromRGBO(247, 164, 64, 1);
Color splashColorTwo = Colors.white;
Color iconTextColor = Colors.white;
Color textColor = Colors.white;
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

late StudentCouncilMembersNotifier studentCouncilMembersNotifier;

class MyStudentCouncilMembersDetailsPage extends StatefulWidget {
  final String clubId;

  const MyStudentCouncilMembersDetailsPage({super.key, required this.clubId});
  @override
  State<MyStudentCouncilMembersDetailsPage> createState() => MyStudentCouncilMembersDetailsPageState();
}

class MyStudentCouncilMembersDetailsPageState extends State<MyStudentCouncilMembersDetailsPage> {
  ConfettiController? _confettiController;

  @override
  Widget build(BuildContext context) {
    studentCouncilMembersNotifier = Provider.of<StudentCouncilMembersNotifier>(context, listen: true);

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
//        title: Text(classPrefectsNotifier.currentClassPrefects.name),
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
                        imageUrl: studentCouncilMembersNotifier.currentStudentCouncilMembers.image!,
                        fit: BoxFit.cover,
                        alignment: Alignment(0, -1),
                        placeholder: (context, imageURL) => new CircularProgressIndicator(),
                        errorWidget: (context, url, error) => new Icon(MdiIcons.alertRhombus),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  message: studentCouncilMembersNotifier.currentStudentCouncilMembers.name),
              Material(
                color: materialBackgroundColor,
                child: InkWell(
                  splashColor: splashColor.withOpacity(0.20),
                  onTap: () {},
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 4,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: shapeDecorationColor, width: 4.0, style: BorderStyle.solid),
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
                              studentCouncilMembersNotifier.currentStudentCouncilMembers.name!.toUpperCase(),
                              style: GoogleFonts.blinker(color: shapeDecorationTextColor, fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              MdiIcons.checkboxMarkedCircle,
                              color: shapeDecorationIconColor,
                            ),
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
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          child: Material(
                            color: materialBackgroundColor,
                            child: InkWell(
                              splashColor: splashColorTwo,
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: positionEnforced,
                                          style: GoogleFonts.aBeeZee(
                                            color: textColor,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      TextSpan(
                                          text: ' ' + studentCouncilMembersNotifier.currentStudentCouncilMembers.positionEnforced!,
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
                          decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(120), borderRadius: new BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          child: Material(
                            color: materialBackgroundColor,
                            child: InkWell(
                              splashColor: splashColorTwo,
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: department,
                                          style: GoogleFonts.aBeeZee(
                                            color: textColor,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      TextSpan(
                                          text: ' ' + studentCouncilMembersNotifier.currentStudentCouncilMembers.department!,
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
                          decoration: BoxDecoration(color: shapeDecorationColor.withAlpha(120), borderRadius: new BorderRadius.circular(10)),
                        ),
                      ),
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

  @override
  initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _confettiController = ConfettiController(duration: const Duration(seconds: 777));
    _confettiController!.play();
    super.initState();
  }

  @override
  void dispose() {
    _confettiController!.dispose();
    super.dispose();
  }
}
