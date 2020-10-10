
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CAS/AnimalScience.dart';

class AnimalScienceNotifier with ChangeNotifier {
  List<AnimalScience> _animalScienceList = [];
  AnimalScience _currentAnimalScience;

  UnmodifiableListView<AnimalScience> get animalScienceList => UnmodifiableListView(_animalScienceList);

  AnimalScience get currentAnimalScience => _currentAnimalScience;

  set animalScienceList(List<AnimalScience> animalScienceList) {
    _animalScienceList = animalScienceList;
    notifyListeners();
  }

  set currentAnimalScience(AnimalScience animalScience) {
    _currentAnimalScience = animalScience;
    notifyListeners();
  }

}