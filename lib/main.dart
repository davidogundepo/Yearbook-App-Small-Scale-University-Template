import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './notifier/university_achievement_images_notifier.dart';
import './notifier/university_arial_images_notifier.dart';
import './notifier/sidebar_notifier.dart';
import 'package:provider/provider.dart';
import './notifier/CAS_NOTIFIER/agricultural_economics_graduates_notifier.dart';
import './notifier/CAS_NOTIFIER/agricultural_extension_and_rural_development_graduates_notifier.dart';
import './notifier/CAS_NOTIFIER/animal_science_graduates_notifier.dart';
import './notifier/CAS_NOTIFIER/aquaculture_and_fisheries_management_graduates_notifier.dart';
import './notifier/CAS_NOTIFIER/crop_science_and_soil_science_graduates_notifier.dart';
import './notifier/CAS_NOTIFIER/food_science_and_nutrition_graduates_notifier.dart';
import './notifier/CBS_NOTIFIER/accounting_graduates_notifier.dart';
import './notifier/CBS_NOTIFIER/banking_and_finance_graduates_notifier.dart';
import './notifier/CBS_NOTIFIER/business_administration_graduates_notifier.dart';
import './notifier/CBS_NOTIFIER/economics_graduates_notifier.dart';
import './notifier/CBS_NOTIFIER/international_relations_graduates_notifier.dart';
import './notifier/CBS_NOTIFIER/mass_communications_graduates_notifier.dart';
import './notifier/CBS_NOTIFIER/political_science_graduates_notifier.dart';
import './notifier/CBS_NOTIFIER/sociology_graduates_notifier.dart';
import './notifier/COE_NOTIFIER/agricultural_and_biosystem_engineering_graduates_notifier.dart';
import './notifier/COE_NOTIFIER/chemical_engineering_graduates_notifier.dart';
import './notifier/COE_NOTIFIER/civil_engineering_graduates_notifier.dart';
import './notifier/COE_NOTIFIER/electrical_and_information_engineering_graduates_notifier.dart';
import './notifier/COE_NOTIFIER/mechanical_engineering_graduates_notifier.dart';
import './notifier/COE_NOTIFIER/mechatronics_engineering_graduates_notifier.dart';
import './notifier/PAS_NOTIFIER/applied_biology_and_biotechnology_graduates_notifier.dart';
import './notifier/PAS_NOTIFIER/biochemistry_graduates_notifier.dart';
import './notifier/PAS_NOTIFIER/computer_science_graduates_notifier.dart';
import './notifier/PAS_NOTIFIER/geophysics_graduates_notifier.dart';
import './notifier/PAS_NOTIFIER/industrial_chemistry_graduates_notifier.dart';
import './notifier/PAS_NOTIFIER/industrial_mathematics_graduates_notifier.dart';
import './notifier/PAS_NOTIFIER/industrial_physics_graduates_notifier.dart';
import './notifier/PAS_NOTIFIER/microbiology_graduates_notifier.dart';
import './notifier/management_body_notifier.dart';
import './notifier/scpc_members_notifier.dart';
import './notifier/student_council_members_notifier.dart';

import './sidebar/sidebar_layout.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZonedGuarded(() {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AgriculturalEconomicsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => AgriculturalExtensionAndRuralDevelopmentNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => AnimalScienceNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => AquacultureAndFisheriesManagementNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CropScienceAndSoilScienceNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodScienceAndNutritionNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => BankingAndFinanceNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => BusinessAdministrationNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => EconomicsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternationalRelationsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => MassCommunicationsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PoliticalScienceNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => SociologyNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => AgriculturalAndBiosystemEngineeringNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChemicalEngineeringNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CivilEngineeringNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ElectricalAndInformationEngineeringNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => MechanicalEngineeringNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => MechatronicsEngineeringNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppliedBiologyAndBiotechnologyNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => BiochemistryNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ComputerScienceNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => GeophysicsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => IndustrialChemistryNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => IndustrialMathematicsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => IndustrialPhysicsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => MicrobiologyNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => SCPCMembersNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => StudentCouncilMembersNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ManagementBodyNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => UniversityAchievementsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => UniversityArialNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => SideBarNotifier(),
        ),

      ],
      child: MyApp(),
    ));
    }, FirebaseCrashlytics.instance.recordError
  );
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SideBarLayout(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
