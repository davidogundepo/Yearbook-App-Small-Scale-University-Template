
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/CBS/MassCommunications.dart';
import '../../notifier/CBS_NOTIFIER/mass_communications_graduates_notifier.dart';

getMassCommunications(MassCommunicationsNotifier massCommunicationsNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('MassCommunications').orderBy("name").get();

  List<MassCommunications> _massCommunicationsList = [];

  snapshot.docs.forEach((document) {
    MassCommunications massCommunications = MassCommunications.fromMap(document.data());
    _massCommunicationsList.add(massCommunications);
  });

  massCommunicationsNotifier.massCommunicationsList = _massCommunicationsList;
}