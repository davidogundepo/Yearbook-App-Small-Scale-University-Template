
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CAS/FoodScienceAndNutrition.dart';
import '../../notifier/CAS_NOTIFIER/food_science_and_nutrition_graduates_notifier.dart';

getFoodScienceAndNutrition(FoodScienceAndNutritionNotifier foodScienceAndNutritionNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('FoodScienceAndNutrition').orderBy("name").getDocuments();

  List<FoodScienceAndNutrition> _foodScienceAndNutritionList = [];

  snapshot.documents.forEach((document) {
    FoodScienceAndNutrition foodScienceAndNutrition = FoodScienceAndNutrition.fromMap(document.data);
    _foodScienceAndNutritionList.add(foodScienceAndNutrition);
  });

  foodScienceAndNutritionNotifier.foodScienceAndNutritionList = _foodScienceAndNutritionList;
}