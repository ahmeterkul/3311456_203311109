// ignore_for_file: non_constant_identifier_names

import 'package:film_uygulamasi/services/signup_service.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Kaydol extends StatefulWidget {
  const Kaydol({Key? key}) : super(key: key);

  @override
  State<Kaydol> createState() => _KaydolState();
}

class _KaydolState extends State<Kaydol> {
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();
  TextEditingController sifretekrar = TextEditingController();
  String hatamesaji = "";

  cleartextfields()
  {

    setState(() {
      email.clear();
      sifre.clear();
      sifretekrar.clear();
    });


  }

  void Kayitislemi()
  {
    String varmi="";
   sign.SignUp(email.text, sifre.text).then((value) {
     varmi = value;
     if(varmi=="true")
     {
       Navigator.pushReplacement(
           context,
           MaterialPageRoute(
               builder: (context) => const MyApp()));}
     else
     {
       cleartextfields();
       hatamesaji=varmi;
     }
    });

   }



  Signup_Service sign = Signup_Service();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
              child: Column(
          children: [Text(hatamesaji,style: const TextStyle(color: Colors.white),),
              TextField(onTap: () {
                setState(() {
                  hatamesaji="";
                });

              },
                controller: email,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "email",
                  fillColor: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              TextField(
                controller: sifre,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "şifre",
                  fillColor: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              TextField(
                controller: sifretekrar,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "şifre tekrarı",
                  fillColor: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              ElevatedButton(
                  onPressed: () {
                    if (sifre.text.trim() == sifretekrar.text.trim())
                      {
                        if(email.text!=""&&sifre.text!="") {
                          if (email.text.length >= 5 &&
                              sifre.text.length >= 5) {
                            Kayitislemi();
                          }

                          else {
                            cleartextfields();
                            hatamesaji =
                            "Şifre ve email 5 karakterden fazla olmalı.";
                          }
                        }
                        else
                        {
                          setState(() {
                            cleartextfields();
                            hatamesaji = "Alanlar boş bırakılamaz.";
                          });
                        }


                      }

                    else
                      {
                        cleartextfields();
                        hatamesaji="Şifreler uyuşmuyor.";
                      }
                  },style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  child: const Text("Kaydol"),),
            const Padding(padding: EdgeInsets.all(16)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ));
                  },style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  child: const Text("Geri Dön"),)
          ],
        ),
            )),
      ),
    );
  }
}
