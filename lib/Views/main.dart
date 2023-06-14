// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:film_uygulamasi/Views/View_Anasayfa/anasayfa.dart';
import 'package:film_uygulamasi/Views/kaydol.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';
import '../services/firebase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase(option: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Film Uygulaması',
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: const MyHomePage(title: 'Film Uygulaması'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = "";
  String sifre = "";
  bool buton = false;
  bool giris = true;
  String girishata = "";
  final textclearemail = TextEditingController();
  final textclearsifre = TextEditingController();

  void hatamesaji() {
    setState(() {
      girishata = "E-mail veya şifre hatalı.";
      email = "";
      sifre = "";
    });
    cleartextareas();
  }

  void emailekle(String value) {
    setState(() {
      email = value;
      girishata = "";
    });
  }

  void sifreekle(String value) {
    setState(() {
      sifre = value;
      girishata = "";
    });
  }

  void cleartextareas() {
    textclearemail.clear();
    textclearsifre.clear();
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  void anaekranagit() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const anaekran(),
            settings: RouteSettings(arguments: email)));
    setState(() {
      email = "";
      sifre = "";
    });
    cleartextareas();
  }

  @override
  Widget build(BuildContext context) {
    if (email.length >= 5 && sifre.length >= 5) {
      buton = true;
    } else {
      buton = false;
    }
    return girisekrani();
  }

  Widget girisekrani() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Movieflix"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.black,
          centerTitle: true,
          toolbarHeight: 50,
        ),
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.all(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          girishata,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    TextField(
                      controller: textclearemail,
                      onChanged: (value) {
                        emailekle(value);
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "E-posta",
                        fillColor: Colors.purple,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    TextField(
                      obscureText: true,
                      controller: textclearsifre,
                      onChanged: (value) {
                        sifreekle(value);
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "Şifre",
                        fillColor: Colors.purple,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    ElevatedButton(
                        onPressed: buton
                            ? () async {
                                User? user = await loginUsingEmailPassword(
                                    email: textclearemail.text,
                                    password: textclearsifre.text,
                                    context: context);
                                print("user $user");
                                if (user != null) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const anaekran(),
                                          settings:
                                              RouteSettings(arguments: email)));
                                } else {
                                  hatamesaji();
                                }
                              }
                            : null,
                        child: const Text(
                          "Giriş Yap",
                          style: TextStyle(color: Colors.black),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Kaydol()));
                            },
                            child: const Text(
                              "Kaydol",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
