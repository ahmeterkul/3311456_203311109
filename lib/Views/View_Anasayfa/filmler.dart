
import 'package:flutter/material.dart';

import 'package:film_uygulamasi/widgets/gelecek_tasarim.dart';
import 'package:film_uygulamasi/widgets/populer_tasarim.dart';
import 'package:film_uygulamasi/widgets/yeni_tasarim.dart';

class Filmler extends StatefulWidget {
  final String kad;
   const Filmler({Key? key,required this.kad}) : super(key: key);

  @override
  State<Filmler> createState() => _FilmlerState();
}

class _FilmlerState extends State<Filmler> {

  @override
  Widget build(BuildContext context) {

      return const SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
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
