import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../model/CBS/MassCommunications.dart';

class MassCommunicationsNotifier with ChangeNotifier {
  List<MassCommunications> _massCommunicationsList = [];
  late MassCommunications _currentMassCommunications;

  UnmodifiableListView<MassCommunications> get massCommunicationsList => UnmodifiableListView(_massCommunicationsList);

  MassCommunications get currentMassCommunications => _currentMassCommunications;

  set massCommunicationsList(List<MassCommunications> massCommunicationsList) {
    _massCommunicationsList = massCommunicationsList;
    notifyListeners();
  }

  set currentMassCommunications(MassCommunications massCommunications) {
    _currentMassCommunications = massCommunications;
    notifyListeners();
  }
}
