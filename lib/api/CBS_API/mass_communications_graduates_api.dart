import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/CBS/MassCommunications.dart';
import '../../notifier/CBS_NOTIFIER/mass_communications_graduates_notifier.dart';

Future<void> getMassCommunications(MassCommunicationsNotifier massCommunicationsNotifier, String clubId) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('universities').doc(clubId).collection('MassCommunications').orderBy("name").get();

  List<MassCommunications> _massCommunicationsList = [];

  for (var document in snapshot.docs) {
    MassCommunications massCommunications = MassCommunications.fromMap(document.data() as Map<String, dynamic>);
    _massCommunicationsList.add(massCommunications);
  }

  massCommunicationsNotifier.massCommunicationsList = _massCommunicationsList;
}
