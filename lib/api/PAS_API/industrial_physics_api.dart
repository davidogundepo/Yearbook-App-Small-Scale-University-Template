
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/PAS/IndustrialPhysics.dart';
import '../../notifier/PAS_NOTIFIER/industrial_physics_graduates_notifier.dart';

getIndustrialPhysics(IndustrialPhysicsNotifier industrialPhysicsNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('IndustrialPhysics').orderBy("name").getDocuments();

  List<IndustrialPhysics> _industrialPhysicsList = [];

  snapshot.documents.forEach((document) {
    IndustrialPhysics industrialPhysics = IndustrialPhysics.fromMap(document.data);
    _industrialPhysicsList.add(industrialPhysics);
  });

  industrialPhysicsNotifier.industrialPhysicsList = _industrialPhysicsList;
}