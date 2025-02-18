import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../about_menu_details_pages/about_app.dart';
import '../../about_menu_details_pages/about_university.dart';
import '../../about_menu_details_pages/acronyms_meanings.dart';
import '../../about_menu_details_pages/who_we_are.dart';
import '../../api/CBS_API/banking_and_finance_graduates_api.dart';
import '../../bloc_navigation_bloc/navigation_bloc.dart';
import '../../details_pages/CBS/banking_and_finance_graduates_details_page.dart';
import '../../notifier/CBS_NOTIFIER/banking_and_finance_graduates_notifier.dart';
import '../../thrown_searches/CBS/banking_and_finance_graduates_thrown_search.dart';

String universityName = "Landmark University";
String stateName = "Lagos State";
String countryName = "Nigeria";
String thrownName = "Banking and Finance Class Graduates";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutUniversity = "About $universityName 2021";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/uni_studs_2.jpg";

Color backgroundColor = Color.fromRGBO(247, 164, 64, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(164, 107, 39, 1.0);
Color appBarIconColor = Colors.white;
Color modalColor = Color.fromRGBO(164, 107, 39, 1.0);
Color modalBackgroundColor = Colors.transparent;
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Color.fromRGBO(164, 107, 39, 1.0);
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(247, 164, 64, 1);
Color borderColor = Colors.black;

class MyBankingAndFinanceGraduatesPage extends StatefulWidget implements NavigationStates {
  final String clubId;

  const MyBankingAndFinanceGraduatesPage({super.key, required this.clubId});

  @override
  State<MyBankingAndFinanceGraduatesPage> createState() => MyBankingAndFinanceGraduatesPageState();
}

class MyBankingAndFinanceGraduatesPageState extends State<MyBankingAndFinanceGraduatesPage> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Widget _buildProductItem(BuildContext context, int index) {
    BankingAndFinanceNotifier bankingAndFinanceNotifier = Provider.of<BankingAndFinanceNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: borderColor.withAlpha(50),
        ),
        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              bankingAndFinanceNotifier.currentBankingAndFinance = bankingAndFinanceNotifier.bankingAndFinanceList[index];
              navigateToBankingAndFinanceDetailsPage(context);
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(bankingAndFinanceNotifier.bankingAndFinanceList[index].image!),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: <Widget>[
                              Text(bankingAndFinanceNotifier.bankingAndFinanceList[index].name!,
                                  style: GoogleFonts.tenorSans(color: textColor, fontSize: 17, fontWeight: FontWeight.w600)),
                              (() {
                                if (bankingAndFinanceNotifier.bankingAndFinanceList[index].schoolExecutive == "Yes") {
                                  return Row(
                                    children: <Widget>[
                                      SizedBox(width: 10),
                                      Icon(
                                        MdiIcons.checkboxMarkedCircle,
                                        color: iconColor,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Visibility(
                                    visible: !_isVisible,
                                    child: Icon(
                                      MdiIcons.checkboxMarkedCircle,
                                      color: iconColor,
                                    ),
                                  );
                                }
                              }()),
                            ],
                          ),
                        ),
                        (() {
                          if (bankingAndFinanceNotifier.bankingAndFinanceList[index].twitter!.toString().isNotEmpty) {
                            if (!bankingAndFinanceNotifier.bankingAndFinanceList[index].twitter!.toString().contains("@")) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    bankingAndFinanceNotifier.bankingAndFinanceList[index].twitter! ==
                                            bankingAndFinanceNotifier.bankingAndFinanceList[index].twitter!
                                        ? '@' + bankingAndFinanceNotifier.bankingAndFinanceList[index].twitter!
                                        : bankingAndFinanceNotifier.bankingAndFinanceList[index].twitter!,
                                    style: GoogleFonts.varela(color: textColorTwo, fontStyle: FontStyle.italic)),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(bankingAndFinanceNotifier.bankingAndFinanceList[index].twitter!,
                                    style: GoogleFonts.varela(color: textColorTwo, fontStyle: FontStyle.italic)),
                              );
                            }
                          } else {
                            return Visibility(
                              visible: !_isVisible,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(bankingAndFinanceNotifier.bankingAndFinanceList[index].twitter!,
                                    style: GoogleFonts.varela(color: textColorTwo, fontStyle: FontStyle.italic)),
                              ),
                            );
                          }
                        }()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            backgroundColor: dialogBackgroundColor,
            title: Text(
              exitAppTitle,
              style: TextStyle(color: textColor),
            ),
            content: Text(
              exitAppSubtitle,
              style: TextStyle(color: textColor),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  exitAppNo,
                  style: TextStyle(color: textColor),
                ),
              ),
              TextButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text(
                  exitAppYes,
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future navigateToBankingAndFinanceDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyBankingAndFinanceGraduatesDetailsPage(clubId: widget.clubId)));
  }

  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }

  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }

  Future navigateToAboutUniversityState(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUniversityState(clubId: widget.clubId)));
  }

  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }

  @override
  void initState() {
    BankingAndFinanceNotifier bankingAndFinanceNotifier = Provider.of<BankingAndFinanceNotifier>(context, listen: false);
    getBankingAndFinance(bankingAndFinanceNotifier, widget.clubId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BankingAndFinanceNotifier bankingAndFinanceNotifier = Provider.of<BankingAndFinanceNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft, color: appBarIconColor),
                      onPressed: () async {
                        showModalBottomSheet(
                            backgroundColor: modalBackgroundColor,
                            context: context,
                            builder: (context) => Container(
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: modalColor,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                  ),
                                  child: Material(
                                    color: materialBackgroundColor,
                                    child: InkWell(
                                      splashColor: splashColor,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Wrap(
                                          children: <Widget>[
                                            ListTile(
                                                leading: new Icon(MdiIcons.atom, color: iconColor),
                                                title: new Text(
                                                  whoWeAre,
                                                  style: GoogleFonts.zillaSlab(color: textColor),
                                                ),
                                                onTap: () {
                                                  Navigator.of(context).pop(false);
                                                  navigateToWhoWeArePage(context);
                                                }),
                                            ListTile(
                                              leading: new Icon(MdiIcons.chessKing, color: iconColor),
                                              title: new Text(
                                                aboutUniversity,
                                                style: GoogleFonts.zillaSlab(color: textColor),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).pop(false);
                                                navigateToAboutUniversityState(context);
                                              },
                                            ),
                                            ListTile(
                                                leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: iconColor),
                                                title: new Text(
                                                  acronymMeanings,
                                                  style: GoogleFonts.zillaSlab(color: textColor),
                                                ),
                                                onTap: () {
                                                  Navigator.of(context).pop(false);
                                                  navigateToAcronymsMeaningsPage(context);
                                                }),
                                            ListTile(
                                              leading: new Icon(MdiIcons.opacity, color: iconColor),
                                              title: new Text(
                                                aboutApp,
                                                style: GoogleFonts.zillaSlab(color: textColor),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).pop(false);
                                                navigateToAboutAppDetailsPage(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: bankingAndFinanceNotifier.bankingAndFinanceList == null
                          ? null
                          : () {
                              showSearch(
                                context: context,
                                delegate:
                                    MyBankingAndFinanceGraduatesSearch(all: bankingAndFinanceNotifier.bankingAndFinanceList, clubId: widget.clubId),
                              );
                            },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Center(
                      heightFactor: 0.6,
                      child: Text(thrownName, style: GoogleFonts.abel(color: appBarTextColor, fontSize: 26.0, fontWeight: FontWeight.bold)),
                    ),
                    background: Image.asset(
                      imgAsset,
                      alignment: Alignment(0, -0.6),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: bankingAndFinanceNotifier.bankingAndFinanceList.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
