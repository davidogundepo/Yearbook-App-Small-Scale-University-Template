import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../notifier/university_achievement_images_notifier.dart';
import '../api/university_achievement_images_api.dart';
import '../api/university_arial_images_api.dart';
import '../notifier/university_arial_images_notifier.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

String universityName = "ABC University";
String aboutUniversity = "About $universityName";

String visionSwipe = "Swipe left on 'OUR VISION STATEMENT'  >>>";
String visionTitle = "OUR VISION STATEMENT";
String visionStatement = "To develop a sound and result oriented organization that is strongly committed to its set objectives particularly those of national unity and even development. An organization that is well motivated and capable of bringing out the best qualities in our youths and imparting in them the right attitude and values for nation-building. An organization that serves as a catalyst to national development, and a source of pride and fulfillment to its participating graduate youths";
String missionTitle = "OUR MISSION STATEMENT";
String missionStatement = "To build a pragmatic organization that is committed to its set objectives with the ultimate goal of producing future leadership with positive national ethos-Leadership that is vibrant, proud and committed to the unity and even development of the Nigeria State.\n\nTo be at the fore front of National development efforts, as well as serve as a profitable platform for imparting in our youths values of nationalism, patriotism, loyalty and accountable leadership.\n\nTo raise the moral tone of our youths by giving them opportunity to learn about high ideals of national achievement, social and cultural improvement.\n\nTo develop in our youths attitude of mind acquired through shared experience, and suitable training which would make them more amenable to mobilization in the national interest.\n\nTo ensure Nigerian youths acquire the spirit of self-reliance, a reliable source of economic empowerment and effective participation in nation building.\n\nTo develop an organization that is alive to its responsibilities and responsive to the needs of the country.";

String coreValues = "OUR CORE VALUES";
String cvStatement1 = "1. Patriotism\n\n";
String cvStatement2 = "2. Integrity\n\n";
String cvStatement3 = "3. Efficiency\n\n";
String cvStatement4 = "4. Commitment\n\n";
String cvStatement5 = "5. Team Work\n\n";


String whyUniversity = "WHY $universityName?".toUpperCase();
String whyUniversityStatement = "$universityName scheme was created in a bid to reconstruct, reconcile and rebuild the country after the Nigerian Civil war.";
String staffBody = "$universityName Staff Body all over Nigeria\n\n";
String staffBodyStatement = "We have 454 Academic Staff in $universityName.";
String populationChart = "$universityName 2019/2020 Population Chart";
String studentBody = "Students of $universityName\n\n";
String studentBodyStatement = "We currently have 6,263 students in $universityName.\n36,541 male students and 21,523 female students have graduated from $universityName, since the inception, 12th July 1993.";
String studentPopulationChart = "$universityName 2019/2020 Student Population Chart";

String universityDepartments = "Some Departments $universityName have running B.Sc, M.Sc. and Ph.D programs provided to it's Student Body\n\n";
String someDepartments1 = "1. Agricultural Economics\n";
String someDepartments2 = "2. Civil Engineering\n";
String someDepartments3 = "3. Soil Science\n";
String someDepartments4 = "4. Accounting\n";
String someDepartments5 = "5. Microbiology\n";
String someDepartments6 = "6. Industrial Chemistry\n";
String someDepartments7 = "7. Agricultural Engineering\n";
String someDepartments8 = "8. Political Science\n";
String someDepartments9 = "9. Mechanical Engineering\n";


String universityArialViewsSwipe = "Swipe left or right for more photos";
String universityArialViews = "Some Arial views of $universityName activities";
String universityAchievementsSwipe = "Swipe left or right for more photos";
String universityAchievements = "Some past $universityName achievements during their service year";
String moreInfoAboutUniversity = "For more information about $universityName please trust and click me";
String moreInfoAboutUniversityURL = "https://www.lmu.edu.ng/";

double currentMaleStudentPopulation = 2510;
double currentFemaleStudentPopulation = 3753;
double currentStaffPopulation = 454;

double currentAndPastMaleStudentPopulation = 36541;
double currentAndPastFemaleStudentPopulation = 21523;


Color backgroundColor = Color.fromRGBO(25, 59, 111, 1);
Color appBarBackgroundColor = Color.fromRGBO(25, 49, 111, 1);
Color appBarIconColor = Colors.blueGrey;
Color appBarBackgroundTextColor = Colors.blueGrey;
Color cardBackgroundColor = Color.fromRGBO(25, 49, 111, 1);
Color textColor = Color.fromRGBO(25, 49, 111, 1);
Color cardTextColor = Colors.blueGrey;
Color materialColor = Colors.transparent;
Color materialInkWellColor = Colors.blue.withAlpha(80);
Color materialTextColor = Colors.blueGrey;
Color containerColor = Colors.blueGrey.withAlpha(50);
Color containerTextColor = Colors.white.withAlpha(110);
Color containerColor2 = Colors.blueGrey;
Color chartBackgroundColor = Colors.grey[200];
Color chartTextColor = Colors.white;
Color chartTextColorTwo = Color.fromRGBO(25, 49, 111, 1);
Color firstCurrentUniversityChartColor = Colors.white.withAlpha(110);
Color secondCurrentUniversityChartColor = Color.fromRGBO(25, 49, 111, 1);
Color thirdCurrentUniversityChartColor = Colors.lightBlue;
Color firstCurrentAndPastUniversityStudentsChartColor = Color.fromRGBO(25, 49, 111, 1);
Color secondCurrentAndPastUniversityStudentsChartColor = Color.fromRGBO(184, 186, 181, 1);

class AboutUniversityState extends StatefulWidget {

  @override
  _AboutUniversityState createState() => _AboutUniversityState();
}

class _AboutUniversityState extends State<AboutUniversityState> {

  final controlla = PageController(
    initialPage: 0,
  );

  var scrollDirection = Axis.horizontal;

  @override
  void initState() {
    UniversityArialNotifier universityArialNotifier = Provider.of<UniversityArialNotifier>(context, listen: false);
    getUniversityArial(universityArialNotifier);

    UniversityAchievementsNotifier universityAchievementsNotifier = Provider.of<UniversityAchievementsNotifier>(context, listen: false);
    getUniversityAchievements(universityAchievementsNotifier);

    universityMap.putIfAbsent("Current Male Students", () => 25410);
    universityMap.putIfAbsent("Current Female Students", () => 3753);
    universityMap.putIfAbsent("Current University Staff", () => 454);

    universityStudentMap.putIfAbsent("Current Male Students & Past Graduates", () => 36541);
    universityStudentMap.putIfAbsent("Current Female Students & Past Graduates", () => 21523);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UniversityArialNotifier universityArialNotifier = Provider.of<UniversityArialNotifier>(context);
    UniversityAchievementsNotifier universityAchievementsNotifier = Provider.of<UniversityAchievementsNotifier>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(aboutUniversity,
        style: TextStyle(
          color: appBarBackgroundTextColor
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(visionSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: containerTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 500,
              child: PageView(
                controller: controlla,
                scrollDirection: scrollDirection,
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    visionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                visionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    missionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                missionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    coreValues,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: cvStatement1,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement2,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement3,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement4,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement5,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
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
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    whyUniversity,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                whyUniversityStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: staffBody,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: staffBodyStatement,
                                  style: TextStyle(
                                    color: containerTextColor,
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
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                            child: Text(populationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: containerTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            legendStyle: TextStyle(
                              color: containerTextColor,
                            ),
                            dataMap: universityMap,
                            animationDuration: Duration(seconds: 10),
                            chartLegendSpacing: 42.0,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            showChartValuesInPercentage: false,
                            showChartValues: true,
                            showChartValuesOutside: false,
                            chartValueBackgroundColor: containerTextColor,
                            colorList: universityColorList,
                            showLegends: true,
                            legendPosition: LegendPosition.right,
                            decimalPlaces: 0,
                            showChartValueLabel: true,
                            initialAngle: 0,
                            chartValueStyle: defaultChartValueStyle.copyWith(
                              color: chartTextColor,
                            ),
                            chartType: ChartType.disc,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: studentBody,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: studentBodyStatement,
                                  style: TextStyle(
                                    color: containerTextColor,
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
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 270,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                            child: Text(studentPopulationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: containerTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            legendStyle: TextStyle(
                              color: containerTextColor,
                            ),
                            dataMap: universityStudentMap,
                            animationDuration: Duration(seconds: 10),
                            chartLegendSpacing: 42.0,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            showChartValuesInPercentage: false,
                            showChartValues: true,
                            showChartValuesOutside: false,
                            chartValueBackgroundColor: chartBackgroundColor,
                            colorList: universityStudentColorList,
                            showLegends: true,
                            legendPosition: LegendPosition.right,
                            decimalPlaces: 0,
                            showChartValueLabel: true,
                            initialAngle: 0,
                            chartValueStyle: defaultChartValueStyle.copyWith(
                              color: chartTextColorTwo.withAlpha(160),
                            ),
                            chartType: ChartType.ring,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 300,
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: universityDepartments,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments1,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments2,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments3,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments4,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments5,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments6,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments7,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments8,
                                  style: TextStyle(
                                    color: containerTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: someDepartments9,
                                  style: TextStyle(
                                    color: containerTextColor,
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
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(universityArialViews,
                style: TextStyle(
                    fontSize: 20,
                    color: containerTextColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(universityArialViewsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: containerTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: universityArialNotifier.universityArialList.length,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                universityArialNotifier.universityArialList[index].image
                            ),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          color: containerColor2
                      ),
                      child: ListTile(
                        title: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              universityArialNotifier.universityArialList[index].toastName,
                              style: TextStyle(
                                color: textColor.withAlpha(190),
                                fontWeight: FontWeight.w800,
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
              child: Text(universityAchievements,
                style: TextStyle(
                    fontSize: 20,
                    color: containerTextColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(universityAchievementsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: containerTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: universityAchievementsNotifier.universityAchievementsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  universityAchievementsNotifier.universityAchievementsList[index].image
                              ),
                              fit: BoxFit.cover,
                              alignment: Alignment(0, -0.5)
                            )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            color: containerColor2
                        ),
                        child: ListTile(
                          title: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                universityAchievementsNotifier.universityAchievementsList[index].toastName,
                                style: TextStyle(
                                  color: textColor.withAlpha(190),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemWidth: 350,
                layout: SwiperLayout.STACK,
              ),

            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 30, right: 20),
                child: RichText(
                  text: TextSpan(
                      text: moreInfoAboutUniversity,
                      style: TextStyle(
                        fontSize: 17,
                        color: containerTextColor,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        launch(moreInfoAboutUniversityURL);
                      }
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}


class CurrentAndPastUniversityStudentsPopulation{
  String x;
  double y;
  CurrentAndPastUniversityStudentsPopulation(this.x,this.y);
}

dynamic getCurrentAndPastUniversityStudentsPopulationData(){
  List<CurrentAndPastUniversityStudentsPopulation> currentAndPastUniversityStudentsPopulationData = <CurrentAndPastUniversityStudentsPopulation>[
    CurrentAndPastUniversityStudentsPopulation('Current Male Students & Past Graduates', currentAndPastMaleStudentPopulation),
    CurrentAndPastUniversityStudentsPopulation('Current Female Students & Past Graduates', currentAndPastFemaleStudentPopulation),
  ];
  return currentAndPastUniversityStudentsPopulationData;
}

class CurrentUniversityPopulation{
  String x;
  double y;
  CurrentUniversityPopulation(this.x,this.y);
}

dynamic getCurrentUniversityPopulationData(){
  List<CurrentUniversityPopulation> currentUniversityPopulationData = <CurrentUniversityPopulation>[
    CurrentUniversityPopulation('Current Male Students', currentMaleStudentPopulation),
    CurrentUniversityPopulation('Current Female Students', currentFemaleStudentPopulation),
    CurrentUniversityPopulation('Current University Staff', currentStaffPopulation),
  ];
  return currentUniversityPopulationData;
}


bool toggle = false;
Map<String, double> universityMap = Map();

Map<String, double> universityStudentMap = Map();

List<Color> universityColorList = [
  containerTextColor,
  secondCurrentUniversityChartColor,
  thirdCurrentUniversityChartColor,
];

List<Color> universityStudentColorList = [
  secondCurrentAndPastUniversityStudentsChartColor.withAlpha(160),
  secondCurrentAndPastUniversityStudentsChartColor,
];