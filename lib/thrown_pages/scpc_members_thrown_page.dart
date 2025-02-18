import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '.././api/scpc_members_api.dart';
import '.././details_pages/scpc_members_details_page.dart';
import '.././notifier/scpc_members_notifier.dart';
import '.././thrown_searches/scpc_members_thrown_search.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_university.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';

String universityName = "Landmark University";
String stateName = "Lagos State";
String countryName = "Nigeria";
String thrownName = "SCPC Members";

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

Color backgroundColor = Color.fromRGBO(123, 176, 182, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(123, 166, 182, 1);
Color appBarIconColor = Colors.white;
Color modalColor = Colors.blueGrey;
Color modalBackgroundColor = Colors.transparent;
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Colors.blueGrey;
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(123, 176, 182, 1);
Color borderColor = Colors.black;

class MySCPCMembersPage extends StatefulWidget implements NavigationStates {
  final String clubId;

  const MySCPCMembersPage({super.key, required this.clubId});

  @override
  State<MySCPCMembersPage> createState() => MySCPCMembersPageState();
}

class MySCPCMembersPageState extends State<MySCPCMembersPage> {
  Widget _buildProductItem(BuildContext context, int index) {
    SCPCMembersNotifier scpcMembersNotifier = Provider.of<SCPCMembersNotifier>(context);
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
              scpcMembersNotifier.currentSCPCMembers = scpcMembersNotifier.scpcMembersList[index];
              navigateToSCPCMembersDetailsPage(context);
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
                            image: CachedNetworkImageProvider(scpcMembersNotifier.scpcMembersList[index].image!),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(scpcMembersNotifier.scpcMembersList[index].name!,
                                  style: GoogleFonts.tenorSans(color: textColor, fontSize: 17, fontWeight: FontWeight.w600)),
                              SizedBox(width: 10),
                              Icon(MdiIcons.checkboxMarkedCircle, color: iconColor),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(scpcMembersNotifier.scpcMembersList[index].positionEnforced!,
                              style: GoogleFonts.tenorSans(color: textColor, fontSize: 16, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic)),
                        ),
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

  Future navigateToSCPCMembersDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MySCPCMembersDetailsPage(clubId: widget.clubId)));
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
    SCPCMembersNotifier scpcMembersNotifier = Provider.of<SCPCMembersNotifier>(context, listen: false);
    getSCPCMembers(scpcMembersNotifier, widget.clubId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SCPCMembersNotifier scpcMembersNotifier = Provider.of<SCPCMembersNotifier>(context);

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
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColor),
                      onPressed: () {
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
                                              navigateToAboutAppDetailsPage(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: scpcMembersNotifier.scpcMembersList == null
                          ? null
                          : () {
                              showSearch(
                                context: context,
                                delegate: MySCPCMembersSearch(all: scpcMembersNotifier.scpcMembersList, clubId: widget.clubId),
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
                        child: Text(thrownName, style: GoogleFonts.abel(color: textColor, fontSize: 26.0, fontWeight: FontWeight.bold)),
                      ),
                      background: Image.asset(
                        imgAsset,
                        alignment: Alignment(0, -0.5),
                        fit: BoxFit.cover,
                      )),
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
                  itemCount: scpcMembersNotifier.scpcMembersList.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
