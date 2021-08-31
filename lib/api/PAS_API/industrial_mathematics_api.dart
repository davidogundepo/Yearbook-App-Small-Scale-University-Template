
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/IndustrialMathematics.dart';
import '../../notifier/PAS_NOTIFIER/industrial_mathematics_graduates_notifier.dart';

getIndustrialMathematics(IndustrialMathematicsNotifier industrialMathematicsNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('IndustrialMathematics').orderBy("name").get();

  List<IndustrialMathematics> _industrialMathematicsList = [];

  snapshot.docs.forEach((document) {
    IndustrialMathematics industrialMathematics = IndustrialMathematics.fromMap(document.data());
    _industrialMathematicsList.add(industrialMathematics);
  });

  industrialMathematicsNotifier.industrialMathematicsList = _industrialMathematicsList;
}