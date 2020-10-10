
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/InternationalRelations.dart';
import '../../notifier/CBS_NOTIFIER/international_relations_graduates_notifier.dart';

getInternationalRelations(InternationalRelationsNotifier internationalRelationsNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('InternationalRelations').orderBy("name").getDocuments();

  List<InternationalRelations> _internationalRelationsList = [];

  snapshot.documents.forEach((document) {
    InternationalRelations internationalRelations = InternationalRelations.fromMap(document.data);
    _internationalRelationsList.add(internationalRelations);
  });

  internationalRelationsNotifier.internationalRelationsList = _internationalRelationsList;
}