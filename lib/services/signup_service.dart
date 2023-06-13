// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class Signup_Service
{
  Future<String> SignUp(String email,String sifre) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: sifre);
      print("Kayıt oluşturuldu.");
      return "true";
    }on FirebaseAuthException catch(e)
    {
    print("Kayıt işlemi başarısız. Hata: $e.");
        if(e.code == 'invalid-email')
          {
            return "E-mail formatı yanlış";
          }
        else if(e.code =='email-already-in-use')
          {
            return "E-mail zaten kayıtlı.";
          }
        return "Beklenmedik bir hata oluştu.";
    }

  }


}