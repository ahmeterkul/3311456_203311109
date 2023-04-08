import 'package:film_uygulamasi/veritabani/filmler/populerfilmler.dart';
import 'package:flutter/material.dart';

import '../metodlar/routeicin.dart';

class populer extends StatefulWidget {
  const populer({Key? key}) : super(key: key);

  @override
  State<populer> createState() => _populerState();
}

class _populerState extends State<populer> {
  var populer = populerfilm();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Popüler Filmler",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ],
        ),
        SizedBox(
          height: 430,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                for (int i = 0; i < populer.filmer.length; i++)
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Card(
                        color: Colors.white10,
                        child: Column(
                          children: [
                            ////////////////////////////////////////////////ÜST KISIM/////////////////////////////////////////////////////
                            ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0)),
                                child: Image.asset(
                                  populer.filmer[i][1],
                                  width: 250,
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                )),
                            ////////////////////////////////////////////////İSİM KISMI/////////////////////////////////////////////////////
                            SizedBox(
                              width: 200,
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(populer.filmer[i][0],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25)),
                                  FloatingActionButton(
                                    backgroundColor: Colors.yellow,
                                    onPressed: () {
                                      routeat(
                                          populer.filmer[i][0],
                                          populer.filmer[i][1],
                                          "populer",
                                          populer.filmer[i][2],context
                                      );
                                    },
                                    child: Icon(Icons.play_arrow,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
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
}
