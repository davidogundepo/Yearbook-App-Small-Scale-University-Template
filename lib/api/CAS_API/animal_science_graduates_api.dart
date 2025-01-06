import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CAS/AnimalScience.dart';
import '../../notifier/CAS_NOTIFIER/animal_science_graduates_notifier.dart';

Future<void> getAnimalScience(AnimalScienceNotifier animalScienceNotifier, String clubId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('AnimalScience').orderBy("name").get();

  List<AnimalScience> _animalScienceList = [];

  for (var document in snapshot.docs) {
    AnimalScience animalScience = AnimalScience.fromMap(document.data() as Map<String, dynamic>);
    _animalScienceList.add(animalScience);
  }

  animalScienceNotifier.animalScienceList = _animalScienceList;
}
