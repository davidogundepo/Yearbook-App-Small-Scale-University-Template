
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/IndustrialMathematics.dart';
import '../../notifier/PAS_NOTIFIER/industrial_mathematics_graduates_notifier.dart';

getIndustrialMathematics(IndustrialMathematicsNotifier industrialMathematicsNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('IndustrialMathematics').orderBy("name").getDocuments();

  List<IndustrialMathematics> _industrialMathematicsList = [];

  snapshot.documents.forEach((document) {
    IndustrialMathematics industrialMathematics = IndustrialMathematics.fromMap(document.data);
    _industrialMathematicsList.add(industrialMathematics);
  });

  industrialMathematicsNotifier.industrialMathematicsList = _industrialMathematicsList;
}