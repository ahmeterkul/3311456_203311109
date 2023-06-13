// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      print('Firebase başarıyla oluşturuldu.');
    } catch (e) {
      print('Firebase hatası: $e');
    }
  }
}
