import 'package:film_uygulamasi/Views/filmdetay.dart';
import 'package:flutter/material.dart';

class routeat
{
  List<String> gonder = ['', '', '', ''];
   routeat(String ad, String link, String populermi, String aciklama,BuildContext context) {
    gonder[0] = ad;
    gonder[1] = link;
    gonder[2] = populermi;
    gonder[3] = aciklama;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => detay(),
            settings: RouteSettings(arguments: gonder)));
  }
}