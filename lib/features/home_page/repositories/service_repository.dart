import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/service.dart';

class ServiceRepository {
  final FirebaseFirestore _firestore;

  ServiceRepository({required FirebaseFirestore firestore})
    : _firestore = firestore;

  Stream<List<Service>> getServices() {
    return _firestore.collection('services').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Service.fromFirestore(doc.data(), doc.id))
          .toList();
    });
  }
}
