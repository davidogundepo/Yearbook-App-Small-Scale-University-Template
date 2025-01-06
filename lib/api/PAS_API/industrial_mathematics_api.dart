import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/PAS/IndustrialMathematics.dart';
import '../../notifier/PAS_NOTIFIER/industrial_mathematics_graduates_notifier.dart';

Future<void> getIndustrialMathematics(IndustrialMathematicsNotifier industrialMathematicsNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('IndustrialMathematics').orderBy("name").get();

  List<IndustrialMathematics> _industrialMathematicsList = [];

  for (var document in snapshot.docs) {
    IndustrialMathematics industrialMathematics = IndustrialMathematics.fromMap(document.data() as Map<String, dynamic>);
    _industrialMathematicsList.add(industrialMathematics);
  }

  industrialMathematicsNotifier.industrialMathematicsList = _industrialMathematicsList;
}
