// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:film_uygulamasi/eklentiler/context_extension.dart';
import 'package:film_uygulamasi/models/favoriler_model.dart';
import 'package:film_uygulamasi/models/grafik_model.dart';
import 'package:film_uygulamasi/utils/favoriler_utils.dart';
import 'package:film_uygulamasi/linkler/filmler/populerfilmler.dart';
import 'package:film_uygulamasi/utils/grafik_util.dart';
import 'package:flutter/material.dart';

import '../metodlar/routeicin.dart';

class populer extends StatefulWidget {
  const populer({Key? key}) : super(key: key);

  @override
  State<populer> createState() => _populerState();
}

class _populerState extends State<populer> {
  var populer = populerfilm();
  Favori_Utils utils = Favori_Utils();
  bool sorgu = false;
  bool varmi = false;

  List<Grafik_Model> grafiklistesi = [];
  final Grafik_Util _grafik_util = Grafik_Util();
  

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await _grafik_util.grafik_Listele().then((result) => {
      setState(() {
        grafiklistesi = result;
      })
    });
  }



  void RouteAt(int i,BuildContext context)
  {
    _grafik_util.grafik_Guncelle(populer.filmer[i][0], grafiklistesi[i].count+1);

    routeat(
        populer.filmer[i][0],
        populer.filmer[i][1],
        "populer",
        populer.filmer[i][2],
        context);

  }


  Future<bool>  _favoriKontrol(String film_ismi) async {
   bool favorivarmi =  await utils.favoriVarmi(film_ismi);

   return favorivarmi;

  }

  _favorilerekleme(String film_ismi, String link, String aciklama) async {
    setState(() {
      final favori =
      Favori(film_ismi: film_ismi, link: link, aciklama: aciklama);
      utils.favori_Ekle(favori);
    });
  }

  _favorilersilme(String film_ismi) {
    setState(() {
      utils.favori_Sil(film_ismi);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Baslik(context),
        ///////////////////////////////////////////////////////////////////////////Alt Kısım ////////////////////////////////////////////////////////////////////////////
        SizedBox(
          height: context.yukseklik(0.67),
          width: context.genislik(1),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: context.genislik(0.02))),
                for (int i = 0; i < populer.filmer.length; i++)
                  Padding(
                    padding: EdgeInsets.only(left: context.genislik(0.02)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        width: 220,
                        height: 738,
                        child: Card(
                          color: Colors.white10,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 5, child: Alt_Resim_Kismi(i, context)),
                              Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                      width: context.genislik(0.7),
                                      height: context.yukseklik(0.1),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(populer.filmer[i][0],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                  context.yukseklik(0.03)),
                                              textAlign: TextAlign.center),
                                          FutureBuilder<bool>(
                                            future: _favoriKontrol(populer.filmer[i][0]),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (snapshot.data == false) {
                                                        _favorilerekleme(
                                                            populer.filmer[i][0],
                                                            populer.filmer[i][1],
                                                            populer.filmer[i][2]);
                                                      } else if (snapshot.data == true) {
                                                        _favorilersilme(populer.filmer[i][0]);
                                                      }
                                                    });
                                                  },
                                                  icon: Icon(snapshot.data!
                                                      ? Icons.favorite
                                                      : Icons.favorite_border),
                                                  color: Colors.yellow,
                                                );
                                              } else {
                                                return Container();
                                              }
                                            },
                                          ),

                                          FloatingActionButton(
                                            heroTag: null,
                                            backgroundColor: Colors.yellow,
                                            onPressed: () {
                                              RouteAt(i, context);
                                            },
                                            child: const Icon(Icons.play_arrow,
                                                color: Colors.black),
                                          )
                                        ],
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }

  ClipRRect Alt_Resim_Kismi(int i, BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        child: Image.asset(
          populer.filmer[i][1],
          width: context.genislik(0.68),
          fit: BoxFit.fill,
        ));
  }

  Row Baslik(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Popüler Filmler",
            style: TextStyle(
              color: Colors.white,
              fontSize: context.yukseklik(0.03),
            )),
      ],
    );
  }
}
