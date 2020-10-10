
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../../model/CBS/InternationalRelations.dart';

class InternationalRelationsNotifier with ChangeNotifier {
  List<InternationalRelations> _internationalRelationsList = [];
  InternationalRelations _currentInternationalRelations;

  UnmodifiableListView<InternationalRelations> get internationalRelationsList => UnmodifiableListView(_internationalRelationsList);

  InternationalRelations get currentInternationalRelations => _currentInternationalRelations;

  set internationalRelationsList(List<InternationalRelations> internationalRelationsList) {
    _internationalRelationsList = internationalRelationsList;
    notifyListeners();
  }

  set currentInternationalRelations(InternationalRelations internationalRelations) {
    _currentInternationalRelations = internationalRelations;
    notifyListeners();
  }

}