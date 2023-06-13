// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:film_uygulamasi/models/notlar_model.dart';

class note_Service {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> notekle(String baslik, String not) async
  {
    var ref = _firestore.collection("Notlar");

    var documentRef = await ref.add({
      'baslik': baslik,
      'not': not
    });
    notlar_Model(id: documentRef.id, baslik: baslik, not: not);

  }

  Stream<QuerySnapshot> notlariGetir(){
      var ref = _firestore.collection("Notlar").snapshots();
      return ref;
  }

  Future<void> notsil(String id)
  {
    var ref = _firestore.collection("Notlar").doc(id).delete();
    return ref;
  }

   Future notguncelle(notlar_Model not) async {
    final userCollection = FirebaseFirestore.instance.collection ("Notlar");
    final docRef = userCollection.doc (not.id);
    final yeninot = notlar_Model(
        id: not.id,
         not: not.not,
        baslik: not.baslik
    ).toMap();
    try {
      await docRef.update(yeninot);
    } catch (e) {
      // ignore: avoid_print
      print("Güncellenirken hata oluştu $e");
    }
  }


}