
import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '.././notifier/scpc_members_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


String positionEnforced = "Position Enforced\n";
String department = "Academic Department\n";

Color backgroundColor = Color.fromRGBO(123, 176, 182, 1);
Color appBarBackgroundColor = Color.fromRGBO(123, 166, 182, 1);
Color appBarIconColor = Colors.blueGrey;
Color materialBackgroundColor = Colors.transparent;
Color shapeDecorationColor = Color.fromRGBO(123, 166, 182, 1);
Color shapeDecorationTextColor = Colors.white;
Color shapeDecorationIconColor = Colors.white;
Color cardBackgroundColor = Colors.blueGrey;
Color splashColor = Color.fromRGBO(123, 166, 182, 1);
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


SCPCMembersNotifier scpcMembersNotifier;


class MySCPCMembersDetailsPage extends StatefulWidget {
  @override
  _MySCPCMembersDetailsPageState createState() => _MySCPCMembersDetailsPageState();
}

class _MySCPCMembersDetailsPageState extends State<MySCPCMembersDetailsPage> {
  ConfettiController _confettiController;
  
  @override
  Widget build(BuildContext context) {
    scpcMembersNotifier = Provider.of<SCPCMembersNotifier>(context, listen: true);

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
//        title: Text(classPrefectsNotifier.currentClassPrefects.name),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),

          elevation: 10,
          backgroundColor: appBarBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: appBarIconColor),
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
                        imageUrl: scpcMembersNotifier.currentSCPCMembers.image,
                        fit: BoxFit.cover,
                        alignment: Alignment(0, -1),
                        placeholder: (context, imageURL) =>
                        new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        new Icon(MdiIcons.alertRhombus),

                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  message: scpcMembersNotifier.currentSCPCMembers.name
              ),
              Material(
                color: materialBackgroundColor,
                child: InkWell(
                  splashColor: splashColor.withOpacity(0.20),
                  onTap: () {},
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 4,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: shapeDecorationColor, width: 4.0, style: BorderStyle.solid
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
                            Text(scpcMembersNotifier.currentSCPCMembers.name.toUpperCase(),
                              style: GoogleFonts.blinker(
                                  color: shapeDecorationTextColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon (
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
                                          )
                                      ),
                                      TextSpan(
                                          text: ' '+scpcMembersNotifier.currentSCPCMembers.positionEnforced,
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
                              color: shapeDecorationColor.withAlpha(120),
                              borderRadius: new BorderRadius.circular(10)
                          ),
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
                                          )
                                      ),
                                      TextSpan(
                                          text: ' '+scpcMembersNotifier.currentSCPCMembers.department,
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
                              color: shapeDecorationColor.withAlpha(120),
                              borderRadius: new BorderRadius.circular(10)
                          ),
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
  void initState() {
    _confettiController = ConfettiController(duration: const Duration(seconds: 35));
    _confettiController.play();
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

}
