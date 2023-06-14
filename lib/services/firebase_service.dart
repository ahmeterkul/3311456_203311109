// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initializeFirebase({FirebaseOptions? option}) async {
    try {
      await Firebase.initializeApp(options: option);
      print('Firebase başarıyla oluşturuldu.');
    } catch (e) {
      print('Firebase hatası: $e');
    }
  }
}
