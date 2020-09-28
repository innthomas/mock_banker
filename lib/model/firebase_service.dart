import 'package:cloud_firestore/cloud_firestore.dart';

import 'account_model.dart';

class FirestoreService {
  static final FirestoreService _firestoreService =
      FirestoreService._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirestoreService._internal();
  factory FirestoreService() {
    return _firestoreService;
  }
  Stream<List<Account>> getAccount() {
    return _db.collection('Account').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Account.fromMap(doc.data(), doc.id),
              )
              .toList(),
        );
  }

  Future<void> addAccount(Account account) {
    return _db.collection('Account').add(account.toMap());
  }

  Future<void> deleteAccount(String id) {
    return _db.collection('Account').doc(id).delete();
  }

  Future<void> updateAccount(Account account) {
    return _db.collection('Account').doc(account.id).update(account.toMap());
  }
}
