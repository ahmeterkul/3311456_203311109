// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class notlar_Model {
  final String id;
  final String baslik;
  final String not;

  notlar_Model({required this.id, required this.baslik, required this.not});

  factory notlar_Model.fromSnapshot(DocumentSnapshot snapshot)
  {
    return notlar_Model(
        id: snapshot.id, baslik: snapshot['baslik'], not: snapshot['not']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'baslik': baslik,
      'not': not,
    };
  }
}