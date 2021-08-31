
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CAS/AnimalScience.dart';
import '../../notifier/CAS_NOTIFIER/animal_science_graduates_notifier.dart';

getAnimalScience(AnimalScienceNotifier animalScienceNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('AnimalScience').orderBy("name").get();

  List<AnimalScience> _animalScienceList = [];

  snapshot.docs.forEach((document) {
    AnimalScience animalScience = AnimalScience.fromMap(document.data());
    _animalScienceList.add(animalScience);
  });

  animalScienceNotifier.animalScienceList = _animalScienceList;
}