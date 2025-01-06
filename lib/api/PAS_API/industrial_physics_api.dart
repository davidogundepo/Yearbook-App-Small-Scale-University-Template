import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/PAS/IndustrialPhysics.dart';
import '../../notifier/PAS_NOTIFIER/industrial_physics_graduates_notifier.dart';

Future<void> getIndustrialPhysics(IndustrialPhysicsNotifier industrialPhysicsNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('IndustrialPhysics').orderBy("name").get();

  List<IndustrialPhysics> _industrialPhysicsList = [];

  for (var document in snapshot.docs) {
    IndustrialPhysics industrialPhysics = IndustrialPhysics.fromMap(document.data() as Map<String, dynamic>);
    _industrialPhysicsList.add(industrialPhysics);
  }

  industrialPhysicsNotifier.industrialPhysicsList = _industrialPhysicsList;
}
