import 'package:film_uygulamasi/Views/filmdetay.dart';
import 'package:film_uygulamasi/Views/main.dart';
import 'package:film_uygulamasi/veritabani/filmler/gelecekfilmler.dart';
import 'package:film_uygulamasi/widgets/gelecek_tasarim.dart';
import 'package:film_uygulamasi/widgets/populer_tasarim.dart';
import 'package:film_uygulamasi/widgets/yeni_tasarim.dart';
import 'package:flutter/material.dart';
import 'package:film_uygulamasi/veritabani/filmler/yenifilmler.dart';
import 'package:film_uygulamasi/metodlar/routeicin.dart';

class anaekran extends StatefulWidget {
  const anaekran({Key? key}) : super(key: key);

  @override
  State<anaekran> createState() => _anaekranState();
}

class _anaekranState extends State<anaekran> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home: tasarim());
  }

  Widget tasarim() {
    String kad = ModalRoute.of(context)!.settings.arguments as String;

    Widget Oturumkapat() {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    )),
                child: Text("Oturumu kapat")),
            Text("Hoşgeldin " + kad, style: TextStyle(color: Colors.white)),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Oturumkapat(),
            populer(),
            Padding(padding: EdgeInsets.all(20)),
            yeni(),
            Padding(padding: EdgeInsets.all(20)),
            gelecek(),
          ],
        ),
      ),
    );
  }
}
