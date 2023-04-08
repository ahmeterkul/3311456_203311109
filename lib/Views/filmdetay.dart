import 'package:flutter/material.dart';
import 'package:film_uygulamasi/veritabani/filmlerin_videolari/videolar.dart';
import 'package:film_uygulamasi/Views/video.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anasayfa.dart';

class detay extends StatefulWidget {
  const detay({Key? key}) : super(key: key);

  @override
  State<detay> createState() => _detayState();
}

class _detayState extends State<detay> {
  String populer = "populer";

  @override
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Anasayfaya dön"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white10, padding: EdgeInsets.zero))
          ],
        ),
        body: populer == gelen ? populericin(data, link) : digerleriicin(data),
      ),
    );
  }

  Widget populericin(var data, String link) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              ////////////////////////////////////////////////VİDEO KISMI//////////////////////////////////////////////////////////
              const Padding(padding: EdgeInsets.only(top: 20)),
              SizedBox(
                width: 500,
                height: 250,
                child: videolar(url: link),
              ),
              ////////////////////////////////////////////////AÇIKLAMA KISMI//////////////////////////////////////////////////////////
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 175,
                        child: Image(image: AssetImage(data[1].toString())),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      SizedBox(
                        width: 175,
                        height: 600,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(data[0].toString(),
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white)),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            SizedBox(
                                width: 450,
                                child: Text(data[3].toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white))),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget digerleriicin(var data) {
    return Scaffold(
      body: Container(
        height: 900,
        decoration: const BoxDecoration(color: Colors.black),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 900,
              child: Image.asset(
                data[1],
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                data[0],
                style: GoogleFonts.anekMalayalam(
                    fontSize: 30, color: Colors.white),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                width: 175,
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
                          color: Colors.white54, fontSize: 20)),
            ]),
          ],
        ),
      ),
    );
  }
}
