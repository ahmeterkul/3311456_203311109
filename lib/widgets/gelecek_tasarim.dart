// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:film_uygulamasi/eklentiler/context_extension.dart';
import 'package:flutter/material.dart';

import '../metodlar/routeicin.dart';
import '../linkler/filmler/gelecekfilmler.dart';

class gelecek extends StatefulWidget {
  const gelecek({Key? key}) : super(key: key);

  @override
  State<gelecek> createState() => _gelecekState();
}

class _gelecekState extends State<gelecek> {
  var gelecek = gelecekfilm();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Baslik(context),
        Alt_Kisim(context),
      ],
    );
  }

  Row Baslik(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Gelecek Filmler",
            style: TextStyle(
              color: Colors.white,
              fontSize: context.yukseklik(0.03),
            )),
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
            for (int i = 0; i < gelecek.filmer.length; i++)
              Padding(
                padding: EdgeInsets.only(left: context.genislik(0.02)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent),
                  onPressed: () {
                    routeat(gelecek.filmer[i][0], gelecek.filmer[i][1],
                        "gelecek", gelecek.filmer[i][2], context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 220,
                      height: 738,
                      child: Banner(
                        message: "YAKINDA",
                        location: BannerLocation.topEnd,
                        color: Colors.red,
                        child: Card(
                          color: Colors.white10,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 8, child: Alt_Resim_Kismi(i, context)),
                              Expanded(
                                  flex: 2, child: Alt_Yazi_Kismi(context, i))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  ClipRRect Alt_Resim_Kismi(int i, BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        child: Column(
          children: [
            Expanded(
              flex: 29,
              child: Image.asset(
                gelecek.filmer[i][1],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(gelecek.filmer[i][0],
              style: const TextStyle(color: Colors.white, fontSize: 21),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
