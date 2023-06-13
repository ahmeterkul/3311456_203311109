// ignore_for_file: camel_case_types

import 'package:film_uygulamasi/services/yorumlar.dart';
import 'package:film_uygulamasi/eklentiler/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:film_uygulamasi/linkler/filmlerin_videolari/videolar.dart';
import 'package:film_uygulamasi/Views/Film_Detay/video.dart';
import 'package:google_fonts/google_fonts.dart';

class detay extends StatefulWidget {
  const detay({Key? key}) : super(key: key);

  @override
  State<detay> createState() => _detayState();
}

class _detayState extends State<detay> {
  String populer = "populer";

  @override
  Widget build(BuildContext context) {
    List<String> data =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    String gelen = data[2];

    var video = videos();
    String link = "";
    String kirpilandata = data[1].substring(31, data[1].length - 4);

    for (int i = 0; i < video.filmer.length; i++) {
      String videodatasi = video.filmer[i]
          .toString()
          .substring(16, video.filmer[i].toString().length - 4);
      if (videodatasi == kirpilandata) {
        link = video.filmer[i].toString();
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white10, padding: EdgeInsets.zero),
                child: const Text("Anasayfaya dön"))
          ],
        ),
        body: populer == gelen
            ? populericin(data, link, context, kirpilandata)
            : digerleriicin(data, context),
      ),
    );
  }

  Widget populericin(
      var data, String link, BuildContext context, String kirpilandata) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: context.genislik(1),
              height: context.yukseklik(0.31),
              child: videolar(url: link),
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Image(image: AssetImage(data[1].toString())),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(data[0].toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white)),
                      Text(
                        data[3].toString(),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        textWidthBasis: TextWidthBasis.longestLine,
                        textAlign: TextAlign.left,
                        strutStyle: const StrutStyle(
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white10,
              child: Column(
                children: [
                  Container(
                    color: Colors.black12,
                    child: const Column(
                      children: [
                        Divider(),
                        Text(
                          "YORUMLAR",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: context.genislik(1),
                    height: context.yukseklik(0.4),
                    child: FutureBuilder<List<dynamic>>(
                      future: Yorumlari_Cek(data[0]),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.hasData) {
                          List<dynamic> yorumlar = snapshot.data!;
                          return ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(color: Colors.lime),
                            itemCount: yorumlar.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  yorumlar[index]['author'] + ":",
                                  style: const TextStyle(color: Colors.blue),
                                ),
                                subtitle: Text(yorumlar[index]['content'],
                                    style: const TextStyle(color: Colors.white)),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Hata: ${snapshot.error}');
                        } else {
                          return const Text('Yorumlar yükleniyor...');
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget digerleriicin(var data, BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.genislik(0.5),
            height: context.yukseklik(1),
            child: Image.asset(
              data[1],
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            width: context.genislik(0.5),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                data[0],
                style: GoogleFonts.anekMalayalam(
                    fontSize: context.genislik(0.08), color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                width: context.genislik(0.5),
                child: Text(
                  data[3],
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              data[2] == "gelecek"
                  ? Text("YAKINDA",
                      style: GoogleFonts.gowunDodum(
                          color: Colors.white54, fontSize: 40))
                  : Text("SADECE SİNEMALARDA",
                      style: GoogleFonts.gowunDodum(
                          color: Colors.white54,
                          fontSize: context.genislik(0.04))),
            ]),
          ),
        ],
      ),
    );
  }
}
