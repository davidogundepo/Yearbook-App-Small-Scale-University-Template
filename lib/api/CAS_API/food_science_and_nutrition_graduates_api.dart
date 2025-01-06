import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CAS/FoodScienceAndNutrition.dart';
import '../../notifier/CAS_NOTIFIER/food_science_and_nutrition_graduates_notifier.dart';

Future<void> getFoodScienceAndNutrition(FoodScienceAndNutritionNotifier foodScienceAndNutritionNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('FoodScienceAndNutrition').orderBy("name").get();

  List<FoodScienceAndNutrition> _foodScienceAndNutritionList = [];

  for (var document in snapshot.docs) {
    FoodScienceAndNutrition foodScienceAndNutrition = FoodScienceAndNutrition.fromMap(document.data() as Map<String, dynamic>);
    _foodScienceAndNutritionList.add(foodScienceAndNutrition);
  }

  foodScienceAndNutritionNotifier.foodScienceAndNutritionList = _foodScienceAndNutritionList;
}
