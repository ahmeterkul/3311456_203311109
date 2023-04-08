import 'package:flutter/material.dart';

import '../metodlar/routeicin.dart';
import '../veritabani/filmler/gelecekfilmler.dart';

class gelecek extends StatefulWidget {
  const gelecek({Key? key}) : super(key: key);

  @override
  State<gelecek> createState() => _gelecekState();
}

class _gelecekState extends State<gelecek> {

  var gelecek = gelecekfilm();
  @override
  Widget build(BuildContext context) {
    return   Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Gelecek Filmler",
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
                  for (int i = 0; i < gelecek.filmer.length; i++)
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent),
                        onPressed: () {
                          routeat(gelecek.filmer[i][0], gelecek.filmer[i][1],
                              "gelecek", gelecek.filmer[i][2],context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Card(
                            color: Colors.white10,
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                    child: Column(
                                      children: [
                                        Text("YAKINDA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11)),
                                        Image.asset(
                                          gelecek.filmer[i][1],
                                          width: 250,
                                          height: 300,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 200,
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(gelecek.filmer[i][0],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21)),
                                    ],
                                  ),
                                )
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
}
