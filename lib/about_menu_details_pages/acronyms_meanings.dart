import 'package:flutter/material.dart';

String universityName = "Landmark University";
String acronymTitle = "Acronym Meanings";
String acronym = "The following acronyms are used in the apps and their meanings are detailed.";
String icdat = "ICDAT - I Can Do All Things";
String scpc = "SCPC - Student Convocation Planning Committee";
String ttg = "TTG - Towards Total Graduate";
String agric = "Agric. - Agricultural";
String eco = "Eco. - Economics";
String ext = "Ext - Extension";
String dev = "Dev - Development";
String bus = "Bus - Business";
String admin = "Admin - Administration";
String mgt = "Mgt - Management";
String sci = "Sci. - Science";
String interrel = "InterRel. - InternationalRelations";
String comm = "Comm - Communications";
String pol = "Pol. - Political";
String eng = "Eng. - Engineering";
String elect = "Elect. - Electrical";
String info = "Info. - Information";
String bly = "Bly - Biology";
String bty = "Bty - Biotechnology";
String ind = "Ind. - Industrial";

String imgAsset = "assets/images/acronym.jpg";

Color backgroundColor = Color.fromRGBO(58, 31, 41, 1);
Color appBarTextColor = Colors.white.withAlpha(150);
Color appBarBackgroundColor = Color.fromRGBO(52, 18, 30, 1);
Color cardBackgroundColor = Color.fromRGBO(52, 18, 30, 1);
Color cardHeadingBackgroundColor = Colors.white.withAlpha(150);
Color cardHeadingBackgroundTextColor = Color.fromRGBO(58, 31, 41, 1).withAlpha(220);
Color cardBackgroundTextColor = Colors.white.withAlpha(150);

class AcronymsMeanings extends StatefulWidget {
  AcronymsMeanings({super.key, this.title});

  final String? title;

  @override
  _AcronymsMeaningsState createState() => _AcronymsMeaningsState();
}

class _AcronymsMeaningsState extends State<AcronymsMeanings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          acronymTitle,
          style: TextStyle(color: appBarTextColor),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appBarTextColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Card(
                margin: EdgeInsets.all(20),
                child: Image.asset(imgAsset),
              ),
            ),
            Container(
              child: Card(
                margin: EdgeInsets.all(20),
                color: cardBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Card(
                          color: cardHeadingBackgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                            child: Text(
                              acronymTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontStyle: FontStyle.italic, color: cardHeadingBackgroundTextColor, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: acronym + '\n\n\n',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: icdat + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: scpc + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ttg + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: agric + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: eco + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ext + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: dev + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: bus + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: admin + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: mgt + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: sci + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: interrel + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: comm + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: pol + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: eng + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: elect + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: info + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: bly + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: bty + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ind + '\n\n',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cardBackgroundTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
