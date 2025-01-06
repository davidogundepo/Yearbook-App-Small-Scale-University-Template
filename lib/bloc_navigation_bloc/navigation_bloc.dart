import 'package:bloc/bloc.dart';

import '../thrown_pages/CAS/agricultural_economics_graduates_thrown_page.dart';
import '../thrown_pages/CAS/agricultural_extension_and_rural_development_graduates_thrown_page.dart';
import '../thrown_pages/CAS/animal_science_graduates_thrown_page.dart';
import '../thrown_pages/CAS/aquaculture_and_fisheries_management_graduates_thrown_page.dart';
import '../thrown_pages/CAS/crop_science_and_soil_science_graduates_thrown_page.dart';
import '../thrown_pages/CAS/food_science_and_nutrition_graduates_thrown_page.dart';
import '../thrown_pages/CBS/accounting_graduates_thrown_page.dart';
import '../thrown_pages/CBS/banking_and_finance_graduates_thrown_page.dart';
import '../thrown_pages/CBS/business_administration_graduates_thrown_page.dart';
import '../thrown_pages/CBS/economics_graduates_thrown_page.dart';
import '../thrown_pages/CBS/international_relations_graduates_thrown_page.dart';
import '../thrown_pages/CBS/mass_communications_graduates_thrown_page.dart';
import '../thrown_pages/CBS/political_science_graduates_thrown_page.dart';
import '../thrown_pages/CBS/sociology_graduates_thrown_page.dart';
import '../thrown_pages/COE/agricultural_and_biosystem_engineering_graduates_thrown_page.dart';
import '../thrown_pages/COE/chemical_engineering_graduates_thrown_page.dart';
import '../thrown_pages/COE/civil_engineering_graduates_thrown_page.dart';
import '../thrown_pages/COE/electrical_and_information_engineering_graduates_thrown_page.dart';
import '../thrown_pages/COE/mechanical_engineering_graduates_thrown_page.dart';
import '../thrown_pages/COE/mechatronics_engineering_graduates_thrown_page.dart';
import '../thrown_pages/PAS/applied_biology_and_biotechnology_graduates_thrown_page.dart';
import '../thrown_pages/PAS/biochemistry_graduates_thrown_page.dart';
import '../thrown_pages/PAS/computer_science_graduates_thrown_page.dart';
import '../thrown_pages/PAS/geophysics_graduates_thrown_page.dart';
import '../thrown_pages/PAS/industrial_chemistry_graduates_thrown_page.dart';
import '../thrown_pages/PAS/industrial_mathematics_graduates_thrown_page.dart';
import '../thrown_pages/PAS/industrial_physics_graduates_thrown_page.dart';
import '../thrown_pages/PAS/microbiology_graduates_thrown_page.dart';
import '../thrown_pages/management_body_thrown_page.dart';
import '../thrown_pages/scpc_members_thrown_page.dart';
import '../thrown_pages/student_council_members_thrown_page.dart';

enum NavigationEvents {
  MyAgriculturalEconomicsGraduatesClickedEvent,
  MyAgriculturalExtensionAndRuralDevelopmentGraduatesClickedEvent,
  MyAnimalScienceGraduatesClickedEvent,
  MyAquacultureAndFisheriesManagementGraduatesClickedEvent,
  MyCropScienceAndSoilScienceGraduatesClickedEvent,
  MyFoodScienceAndNutritionGraduatesClickedEvent,

  MyAccountingGraduatesClickedEvent,
  MyBankingAndFinanceGraduatesClickedEvent,
  MyBusinessAdministrationGraduatesClickedEvent,
  MyEconomicsGraduatesClickedEvent,
  MyInternationalRelationsGraduatesClickedEvent,
  MyMassCommunicationsGraduatesClickedEvent,
  MyPoliticalScienceGraduatesClickedEvent,
  MySociologyGraduatesClickedEvent,

  MyAgriculturalAndBiosystemEngineeringGraduatesClickedEvent,
  MyChemicalEngineeringGraduatesClickedEvent,
  MyCivilEngineeringGraduatesClickedEvent,
  MyElectricalAndInformationEngineeringGraduatesClickedEvent,
  MyMechanicalEngineeringGraduatesClickedEvent,
  MyMechatronicsEngineeringGraduatesClickedEvent,

  MyAppliedBiologyAndBiotechnologyGraduatesClickedEvent,
  MyBiochemistryGraduatesClickedEvent,
  MyComputerScienceGraduatesClickedEvent,
  MyGeophysicsGraduatesClickedEvent,
  MyIndustrialChemistryGraduatesClickedEvent,
  MyIndustrialMathematicsGraduatesClickedEvent,
  MyIndustrialPhysicsGraduatesClickedEvent,
  MyMicrobiologyGraduatesClickedEvent,

  MyManagementBodyClickedEvent,
  MySCPCMembersClickedEvent,
  MyStudentCouncilMembersClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final String clubId;

  NavigationBloc({required this.clubId})
      : super(MyAgriculturalEconomicsGraduatesPage(
          clubId: clubId,
        ));

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents events) async* {
    switch (events) {
      case NavigationEvents.MyAgriculturalEconomicsGraduatesClickedEvent:
        yield MyAgriculturalEconomicsGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyAgriculturalExtensionAndRuralDevelopmentGraduatesClickedEvent:
        yield MyAgriculturalExtensionAndRuralDevelopmentGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyAnimalScienceGraduatesClickedEvent:
        yield MyAnimalScienceGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyAquacultureAndFisheriesManagementGraduatesClickedEvent:
        yield MyAquacultureAndFisheriesManagementGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyCropScienceAndSoilScienceGraduatesClickedEvent:
        yield MyCropScienceAndSoilScienceGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyFoodScienceAndNutritionGraduatesClickedEvent:
        yield MyFoodScienceAndNutritionGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyAccountingGraduatesClickedEvent:
        yield MyAccountingGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyBankingAndFinanceGraduatesClickedEvent:
        yield MyBankingAndFinanceGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyBusinessAdministrationGraduatesClickedEvent:
        yield MyBusinessAdministrationGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyEconomicsGraduatesClickedEvent:
        yield MyEconomicsGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyInternationalRelationsGraduatesClickedEvent:
        yield MyInternationalRelationsGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyMassCommunicationsGraduatesClickedEvent:
        yield MyMassCommunicationsGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyPoliticalScienceGraduatesClickedEvent:
        yield MyPoliticalScienceGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MySociologyGraduatesClickedEvent:
        yield MySociologyGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyAgriculturalAndBiosystemEngineeringGraduatesClickedEvent:
        yield MyAgriculturalAndBiosystemEngineeringGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyChemicalEngineeringGraduatesClickedEvent:
        yield MyChemicalEngineeringGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyCivilEngineeringGraduatesClickedEvent:
        yield MyCivilEngineeringGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyElectricalAndInformationEngineeringGraduatesClickedEvent:
        yield MyElectricalAndInformationEngineeringGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyMechanicalEngineeringGraduatesClickedEvent:
        yield MyMechanicalEngineeringGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyMechatronicsEngineeringGraduatesClickedEvent:
        yield MyMechatronicsEngineeringGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyAppliedBiologyAndBiotechnologyGraduatesClickedEvent:
        yield MyAppliedBiologyAndBiotechnologyGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyBiochemistryGraduatesClickedEvent:
        yield MyBiochemistryGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyComputerScienceGraduatesClickedEvent:
        yield MyComputerScienceGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyGeophysicsGraduatesClickedEvent:
        yield MyGeophysicsGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyIndustrialChemistryGraduatesClickedEvent:
        yield MyIndustrialChemistryGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyIndustrialMathematicsGraduatesClickedEvent:
        yield MyIndustrialMathematicsGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyIndustrialPhysicsGraduatesClickedEvent:
        yield MyIndustrialPhysicsGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyMicrobiologyGraduatesClickedEvent:
        yield MyMicrobiologyGraduatesPage(clubId: clubId);
        break;
      case NavigationEvents.MyManagementBodyClickedEvent:
        yield MyManagementBodyPage(clubId: clubId);
        break;
      case NavigationEvents.MySCPCMembersClickedEvent:
        yield MySCPCMembersPage(clubId: clubId);
        break;
      case NavigationEvents.MyStudentCouncilMembersClickedEvent:
        yield MyStudentCouncilMembersPage(clubId: clubId);
        break;
    }
  }
}
