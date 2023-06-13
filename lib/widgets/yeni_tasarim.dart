// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:film_uygulamasi/eklentiler/context_extension.dart';
import 'package:film_uygulamasi/linkler/filmler/yenifilmler.dart';
import 'package:flutter/material.dart';

import '../metodlar/routeicin.dart';

class yeni extends StatefulWidget {
  const yeni({Key? key}) : super(key: key);

  @override
  State<yeni> createState() => _yeniState();
}

class _yeniState extends State<yeni> {
  var yeni = yenifilm();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Baslik(context),
        Alt_Kisim(context),
      ],
    );
  }

  SizedBox Alt_Kisim(BuildContext context) {
    return SizedBox(
      height: context.yukseklik(0.67),
      width: context.genislik(1),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: context.genislik(0.02))),
            for (int i = 0; i < yeni.filmer.length; i++)
              Padding(
                padding: EdgeInsets.only(left: context.genislik(0.02)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent),
                  onPressed: () {
                    routeat(yeni.filmer[i][0], yeni.filmer[i][1], "yeni",
                        yeni.filmer[i][2], context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: SizedBox(
                      width: 220,
                      height: 738,
                      child: Banner(
                        message: "Sinemalarda",
                        location: BannerLocation.topEnd,
                        color: Colors.red,
                        child: Card(
                          color: Colors.white10,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 8, child: Alt_Resim_Kismi(context, i)),
                              Expanded(
                                  flex: 2, child: Alt_Yazi_Kismi(context, i))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  ClipRRect Alt_Resim_Kismi(BuildContext context, int i) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        child: Column(
          children: [
            Expanded(
              flex: 29,
              child: Image.asset(
                yeni.filmer[i][1],
                width: context.genislik(0.68),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ));
  }

  SizedBox Alt_Yazi_Kismi(BuildContext context, int i) {
    return SizedBox(
      width: context.genislik(0.7),
      height: context.yukseklik(0.17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(yeni.filmer[i][0],
              style: TextStyle(
                  color: Colors.white, fontSize: context.yukseklik(0.04)),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Row Baslik(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Yeni Filmler",
            style: TextStyle(
              color: Colors.white,
              fontSize: context.yukseklik(0.03),
            )),
      ],
    );
  }
}
