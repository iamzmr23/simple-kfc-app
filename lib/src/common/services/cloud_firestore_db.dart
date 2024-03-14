import 'package:cloud_firestore/cloud_firestore.dart';

class CFSServise {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  
  //! creates a new Contact
  static Future<DocumentReference<Map<String, dynamic>>> createCollection(
      {required String collectionPath, required Map<String, dynamic> data}) async {
    DocumentReference<Map<String, dynamic>> documentReference = await db.collection(collectionPath).add(data);
    return documentReference;
  }

  //! get contact information
  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> readAllData({required String collectionPath}) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> document = [];
    await db.collection(collectionPath).get().then((value) {
      for (var doc in value.docs) {
        document.add(doc);
      }
    });
    return document;
  }

  //! dalete contact information
  static Future<void> daleteContact({required String id, required String collectionPath}) async {
    db.collection(collectionPath).doc(id).delete();
  }

  //! update contact information
  static Future<void> updateContact({required String id, required String collectionPath, required Map<String, dynamic> data}) async {
    db.collection(collectionPath).doc(id).update(data);
  }
}
