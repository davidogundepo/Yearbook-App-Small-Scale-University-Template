import 'package:flutter/foundation.dart';

class SideBarNotifier with ChangeNotifier {
  bool isOpened = false;

  setIsOpened(bool value){
    isOpened = value;
    notifyListeners();
  }
}