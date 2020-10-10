
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CAS/FoodScienceAndNutrition.dart';

class FoodScienceAndNutritionNotifier with ChangeNotifier {
  List<FoodScienceAndNutrition> _foodScienceAndNutritionList = [];
  FoodScienceAndNutrition _currentFoodScienceAndNutrition;

  UnmodifiableListView<FoodScienceAndNutrition> get foodScienceAndNutritionList => UnmodifiableListView(_foodScienceAndNutritionList);

  FoodScienceAndNutrition get currentFoodScienceAndNutrition => _currentFoodScienceAndNutrition;

  set foodScienceAndNutritionList(List<FoodScienceAndNutrition> foodScienceAndNutritionList) {
    _foodScienceAndNutritionList = foodScienceAndNutritionList;
    notifyListeners();
  }

  set currentFoodScienceAndNutrition(FoodScienceAndNutrition foodScienceAndNutrition) {
    _currentFoodScienceAndNutrition = foodScienceAndNutrition;
    notifyListeners();
  }

}