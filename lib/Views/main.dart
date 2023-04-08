import 'package:film_uygulamasi/Views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:film_uygulamasi/veritabani/sifreler.dart';
import 'filmdetay.dart';

void main() {
  runApp(MyApp());
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
  String kad = "";
  String sifre = "";
  bool buton = false;
  bool giris = true;
  String girishata = "";
  Map<String, String> sifreler = Passw().sifreler;
  final textclearkad = TextEditingController();
  final textclearsifre = TextEditingController();

  void hatamesaji() {
    setState(() {
      girishata = "Kullanıcı adı veya şifre hatalı.";
      kad = "";
      sifre = "";
    });
    cleartextareas();
  }

  void kadekle(String value) {
    setState(() {
      kad = value;
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
    textclearkad.clear();
    textclearsifre.clear();
  }

  void anaekranagit() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => anaekran(),
            settings: RouteSettings(arguments: kad)));
    setState(() {
      kad = "";
      sifre = "";
    });
    cleartextareas();
  }

  @override
  Widget build(BuildContext context) {
    if (kad.length >= 5 && sifre.length >= 5) {
      buton = true;
    } else {
      buton = false;
    }

    if (sifreler.keys.contains(kad) && sifreler.values.contains(sifre)) {
      giris = false;
    } else {
      giris = true;
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.all(20)),
              TextField(
                controller: textclearkad,
                onChanged: (value) {
                  kadekle(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Kullanıcı adı",
                  fillColor: Colors.purple,
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              TextField(
                controller: textclearsifre,
                onChanged: (value) {
                  sifreekle(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Şifre",
                  fillColor: Colors.purple,
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(
                  onPressed: buton
                      ? () => (giris ? hatamesaji() : anaekranagit())
                      : null,
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(color: Colors.black),
                  )),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    girishata,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
