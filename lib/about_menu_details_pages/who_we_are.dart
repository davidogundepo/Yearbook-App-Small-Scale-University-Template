import 'package:flutter/material.dart';

String elite = "Elite";
String graduateSetTheme = "ELITE Set 2021";
String graduateSetThemeTitle = "We Are ELITE";
String whoWeAre = "Who We Are";

String imgAsset = "assets/images/uni_studs_1.jpg";

String whoVerse = "The Question\nThey ask us\nWho are we?\nThe world has set its standards\nBut we use a different curriculum\nWe don't fit anywhere";
String weVerse = "Whose name do we carry?\nWhose voice do we hear?\nWhose footsteps do we follow\nThat marks us as chosen\nAnd names us as blessed";
String areVerse = "We are sent with a higher calling\nTo live eternally\nAnd lead others to the light\nWe may be few\nBut we are a formidable army\n";
String eliteVerse = "This is where we fit into\nOur world not of this world\nWe are chosen\nWe are Christians\nWe are ELITE";
String poet = 'Ayoade Iyanuoluwa';
String setVerse =
    "The word 'elite' is a noun drawn from the Latin word 'eligere' which means to pick out or select. Elite is used to refer to a small group of powerful people that controls an unequal amount of wealth, privilege, political power or skill in a society.\nAn elite is also defined by education (preferably Ivy League and it's coastal counterparts), profession (executive positions in government, media, law, foundations, the arts and academia), celebrity (name recognition from television, Hollywood, network news, finance, etc.) and ideology such as those prominent in the progressive movement.\nThe Elites holds a superior position among the ordinary people and exercises greater privilege, they are looked up to in the society as source of solution to any form of challenge.\nThis defines the personality of every graduating class student of 2021 that has undergone training and tutorship on the core values rightly spelt out as; Spirituality, Integrity, Possibility Mentality, Capacity Building, Responsibility and Diligence.\nWe are a people with an extra ordinary ability to showcase to our generation in all ramifications of life. We have been reformed, transformed and informed of our dignity an prestige to the black race.\nThe graduating class for 2021 are modelled after the order of our saviour Jesus Christ as reflected in 1 Peter 2:9, 'But you are a chosen race, a royal priesthood, an holy nation, a peculiar people; that ye should show forth the praises of him who hath called you out of darkness into his marvellous light...'. We are equipped to engage in who we are as Kings and Queens by reason of the DNA we possess from our heavenly Father the Kings of kings.\nWe are by authority and training, persons separated to be in the high class of our society here on earth.";
String core = 'Our core mission is:';
String coreOne = '1. To be a solution providers by adding value and creativity to changing the mirage of our society today.';
String coreTwo = "2. To be leaders who are not just breadwinners, job creators and world changers, but also God's Kingdom passionate lovers.";
String coreThree =
    "3. To be an army of reformers who shall redeem the battered image of the black race and restore her lost glory as we begin to build the old waste, repair the wasted cities and raise the desolation of many generations as pathfinders;";
String bottomLine =
    "It was C. Wright Mills (1956), an American sociologist who stated in his work titled 'The Power Elite' the need for a breed of Leaders that are value driven.";

Color backgroundColor = Color.fromRGBO(15, 65, 79, 1);
Color appBarTextColor = Colors.white.withAlpha(150);
Color appBarColor = Color.fromRGBO(2, 42, 53, 1);
Color cardBackgroundColor = Color.fromRGBO(2, 42, 53, 1);
Color cardBackgroundTextColor = Colors.greenAccent;
Color cardBackgroundTextColor2 = Colors.white.withAlpha(150);
Color cardHeadingBackgroundColor = Colors.white.withAlpha(150);
Color cardHeadingBackgroundTextColor = Color.fromRGBO(15, 65, 79, 1);

class WhoWeAre extends StatefulWidget {
  WhoWeAre({super.key, this.title});

  final String? title;

  @override
  _WhoWeAreState createState() => _WhoWeAreState();
}

class _WhoWeAreState extends State<WhoWeAre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          graduateSetThemeTitle,
          style: TextStyle(color: appBarTextColor),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: appBarColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: appBarTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 30),
                          child: Card(
                            color: cardHeadingBackgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                              child: Text(
                                whoWeAre,
                                style: TextStyle(fontSize: 25, color: cardHeadingBackgroundTextColor, fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: whoVerse + '\n\n\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: cardBackgroundTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: weVerse + '\n\n\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: cardBackgroundTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: areVerse + '\n\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: cardBackgroundTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: eliteVerse + '\n\n\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: cardBackgroundTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 10),
                          child: Text(
                            poet,
                            style: TextStyle(
                              fontSize: 17,
                              color: cardHeadingBackgroundColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: Card(
                          color: cardHeadingBackgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                            child: Text(
                              graduateSetTheme,
                              style: TextStyle(
                                  fontSize: 25, fontStyle: FontStyle.italic, color: cardHeadingBackgroundTextColor, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: setVerse + '\n\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: cardBackgroundTextColor2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: core + '\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardBackgroundTextColor2,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: coreOne + '\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: cardBackgroundTextColor2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: coreTwo + '\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: cardBackgroundTextColor2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: coreThree + '\n\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: cardBackgroundTextColor2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Text(
                        bottomLine,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: cardBackgroundTextColor2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
