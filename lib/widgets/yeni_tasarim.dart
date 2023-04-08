import 'package:film_uygulamasi/veritabani/filmler/yenifilmler.dart';
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
    return  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Yeni Filmler",
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
                  for (int i = 0; i < yeni.filmer.length; i++)
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent),
                        onPressed: () {
                          routeat(yeni.filmer[i][0], yeni.filmer[i][1], "yeni",
                              yeni.filmer[i][2],context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Card(
                            color: Colors.white10,
                            child:
                            //////////////////////////////////////////////////////ÜST KISIM////////////////////////////////////////////////////////////
                            Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                    child: Column(
                                      children: [
                                        Text("Sadece sinemalarda",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11)),
                                        Image.asset(
                                          yeni.filmer[i][1],
                                          width: 250,
                                          height: 300,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ],
                                    )),

                                //////////////////////////////////////////////////////////İSİM KISMI ////////////////////////////////////////////////////////////
                                SizedBox(
                                  width: 200,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(yeni.filmer[i][0],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      );

  }
}
