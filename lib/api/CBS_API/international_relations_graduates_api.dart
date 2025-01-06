import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CBS/InternationalRelations.dart';
import '../../notifier/CBS_NOTIFIER/international_relations_graduates_notifier.dart';

Future<void> getInternationalRelations(InternationalRelationsNotifier internationalRelationsNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('InternationalRelations').orderBy("name").get();

  List<InternationalRelations> _internationalRelationsList = [];

  for (var document in snapshot.docs) {
    InternationalRelations internationalRelations = InternationalRelations.fromMap(document.data() as Map<String, dynamic>);
    _internationalRelationsList.add(internationalRelations);
  }

  internationalRelationsNotifier.internationalRelationsList = _internationalRelationsList;
}
