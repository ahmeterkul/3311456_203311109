// ignore_for_file: camel_case_types

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:film_uygulamasi/Views/View_Anasayfa/filmler.dart';
import 'package:film_uygulamasi/Views/View_Anasayfa/grafik.dart';
import 'package:film_uygulamasi/Views/View_Anasayfa/ornek_filmler.dart';
import 'package:film_uygulamasi/eklentiler/context_extension.dart';

import 'package:flutter/material.dart';
import '../main.dart';
import 'Notlar/notlar.dart';
import 'kaydedilenler.dart';

class anaekran extends StatefulWidget {
  const anaekran({Key? key}) : super(key: key);

  @override
  State<anaekran> createState() => _anaekranState();
}

class _anaekranState extends State<anaekran>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  late List<Widget> _sayfalar;

  @override
  Widget build(BuildContext context) {
    String kad = ModalRoute.of(context)!.settings.arguments as String;
    _sayfalar = [
      Filmler(kad: kad),
      const Kaydedilenler(),
      const Grafik(),
      const Notlar(),
      const Ornek_Filmler()
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home: tasarim(kad));
  }

  Widget tasarim(String kad) {
    return GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0.0 && _index > 0) {
            setState(() {
              _index--;
            });
          } else if (details.primaryVelocity! < 0.0 &&
              _index < _sayfalar.length - 1) {
            setState(() {
              _index++;
            });
          }
        },
        child: Scaffold(
          drawer: drawer(kad),
          body: _sayfalar[_index],
          bottomNavigationBar: AnimatedBottomNavigationBar(
            leftCornerRadius: 50,
            rightCornerRadius: 50,
            icons: const [
              Icons.movie,
              Icons.save,
              Icons.add_chart_rounded,
              Icons.book,
              Icons.recommend_rounded
            ],
            activeIndex: _index,
            gapLocation: GapLocation.none,
            onTap: (index) => setState(() => _index = index),
            backgroundColor: Colors.white10,
            activeColor: Colors.deepPurple,
            splashColor: Colors.white,
            inactiveColor: Colors.white30,
          ),
        ));
  }

  Drawer drawer(String kad) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_box_rounded,
                      color: Colors.white, size: 32),
                  Text(
                    kad,
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              )),
          SizedBox(
            height: context.yukseklik(0.1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Kapat"))
                          ],
                          title: const Text("Projeyi Geliştiren:"),
                          content: const Text("Ahmet Erkul"),
                        ));
              },
              child: const Row(
                children: [
                  Icon(Icons.info, color: Colors.black),
                  Text("Hakkımda", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          SizedBox(
              height: context.yukseklik(0.1),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const AboutDialog(
                            applicationIcon: Icon(Icons.account_tree_outlined),
                            applicationName: "MovieFlix",
                            applicationVersion: "version 1.0.0",
                            children: [
                              Text("Bu uygulama hala geliştirme aşamasındadır.")
                            ],
                          ));
                },
                child: const Row(
                  children: [
                    Icon(Icons.phone_android, color: Colors.black),
                    Text("Uygulama Bilgileri",
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              )),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  )),
              child: const Text("Oturumu kapat")),
        ],
      ),
    );
  }
}
