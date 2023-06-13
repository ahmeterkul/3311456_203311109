import 'package:film_uygulamasi/eklentiler/context_extension.dart';
import 'package:film_uygulamasi/metodlar/routeicin.dart';
import 'package:flutter/material.dart';
import 'package:film_uygulamasi/utils/favoriler_utils.dart';

import '../../models/favoriler_model.dart';

class Kaydedilenler extends StatefulWidget {
  const Kaydedilenler({Key? key}) : super(key: key);

  @override
  State<Kaydedilenler> createState() => _KaydedilenlerState();
}

class _KaydedilenlerState extends State<Kaydedilenler> {
  List<Favori> favoriListesi = [];
  Favori_Utils utils = Favori_Utils();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await utils.favorileri_Listele().then((result) => {
          setState(() {
            favoriListesi = result;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KAYDEDİLENLER"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: favoriListesi.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: GestureDetector(
                    onTap: () {
                      routeat(
                          favoriListesi[index].film_ismi.trim(),
                          favoriListesi[index].link.trim(),
                          "populer",
                          favoriListesi[index].aciklama.trim(),
                          context);
                    },
                    onLongPress: () {
                      final RenderObject? overlay =
                          Overlay.of(context).context.findRenderObject();
                      showMenu<String>(
                        context: context,
                        position: RelativeRect.fromRect(
                            Rect.fromLTRB(
                                context.genislik(0.5),
                                context.yukseklik(0.1 + (0.1 * (index + 1))),
                                0,
                                0),
                            Rect.fromLTRB(0, 0, overlay!.paintBounds.size.width,
                                overlay.paintBounds.size.height)),
                        items: <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            onTap: () {
                              utils.favori_Sil(favoriListesi[index].film_ismi);
                              getData();
                            },
                            child: const Text('Kaldır'),
                          ),
                        ],
                      );
                    },
                    child: Container(color: Colors.white10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipOval(
                              child: Image.asset(
                                  width: context.genislik(0.2),
                                  favoriListesi[index].link)),
                          Text(
                            favoriListesi[index].film_ismi,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )));
          },
        ),
      ),
    );
  }
}
