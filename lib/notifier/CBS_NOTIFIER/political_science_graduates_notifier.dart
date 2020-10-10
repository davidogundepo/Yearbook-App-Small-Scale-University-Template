
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CBS/PoliticalScience.dart';

class PoliticalScienceNotifier with ChangeNotifier {
  List<PoliticalScience> _politicalScienceList = [];
  PoliticalScience _currentPoliticalScience;

  UnmodifiableListView<PoliticalScience> get politicalScienceList => UnmodifiableListView(_politicalScienceList);

  PoliticalScience get currentPoliticalScience => _currentPoliticalScience;

  set politicalScienceList(List<PoliticalScience> politicalScienceList) {
    _politicalScienceList = politicalScienceList;
    notifyListeners();
  }

  set currentPoliticalScience(PoliticalScience politicalScience) {
    _currentPoliticalScience = politicalScience;
    notifyListeners();
  }

}