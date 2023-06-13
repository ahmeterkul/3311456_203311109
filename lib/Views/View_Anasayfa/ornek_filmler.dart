// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:film_uygulamasi/utils/pdf_indir.dart';

class Ornek_Filmler extends StatefulWidget {
  const Ornek_Filmler({Key? key}) : super(key: key);

  @override
  State<Ornek_Filmler> createState() => _Ornek_FilmlerState();
}

class _Ornek_FilmlerState extends State<Ornek_Filmler> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          film_listeleri(
              "http://kagizman.meb.gov.tr/meb_iys_dosyalar/2018_10/26140214_film_listesi.pdf",
              "meb_onerilenler",
              "MEB'in Önerdiği Filmler"),
          film_listeleri(
              "https://www.innova.com.tr/birarada/assets/pdf/110-En-Iyi-Bilim-Kurgu-Filmleri-Ile-Ilgili-Bilmeniz-Gereken-Detaylar.pdf",
              "En_iyi_bilim_kurgu",
              "En İyi Bilim Kurgu Filmleri ve haklarında bilinmesi gerekenler"),
          film_listeleri(
              "https://www.coutts.com/content/dam/rbs-coutts/coutts-com/Files/insights/general-insights/Coutts%20-%20The%2070%20best%20films%20of%20all%20time.pdf",
              "Coutts_en_iyi_filmler",
              "Tüm Zamanların En İyi Filmleri (coutts)"),
          film_listeleri(
              "https://prdaficalmjediwestussa.blob.core.windows.net/images/2019/08/movies100.pdf",
              "En_iyi_amerikan_filmleri",
              "Amerika Yapımı En İyi Filmler"),
          film_listeleri(
              "https://alice.co.nz/wp-content/uploads/2017/12/Alices-300-Greatest-Films-of-All-Time.pdf",
            "Alice_300_tum_zamanlarin_en_iyileri",
              "Tüm Zamanların En İyi 300 Filmi (Alice)",
              ),
        ],
      ),
    );
  }

  Row film_listeleri(String link, String isim, String baslik) {
    return Row(
      children: [
        Flexible(
          child: GestureDetector(
            onDoubleTap: () async {
              await pdfindir(link, isim);
               await OpenFile.open(urlcek);
            },
            child: TextButton.icon(
              style: const ButtonStyle(alignment: Alignment.topLeft),
              onPressed: () {},
              icon: const Icon(Icons.bookmark_added_outlined),
              label: Text(baslik, overflow: TextOverflow.fade),
            ),
          ),
        ),
      ],
    );
  }
}
