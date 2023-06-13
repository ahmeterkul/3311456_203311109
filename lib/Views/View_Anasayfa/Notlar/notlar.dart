// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:film_uygulamasi/Views/View_Anasayfa/Notlar/notekle.dart';
import 'package:film_uygulamasi/Views/View_Anasayfa/Notlar/notguncelle.dart';
import 'package:film_uygulamasi/models/notlar_model.dart';
import 'package:film_uygulamasi/services/note_service.dart';
import 'package:flutter/material.dart';

class Notlar extends StatefulWidget {
  const Notlar({Key? key}) : super(key: key);

  @override
  State<Notlar> createState() => _NotlarState();
}

class _NotlarState extends State<Notlar> {
  final note_Service _note_service = note_Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _note_service.notlariGetir(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot notlar = snapshot.data!.docs[index];

                Future<void> NotSil() {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Silmek istediğinize emin misiniz?"),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                _note_service.notsil(notlar.id);
                                Navigator.pop(context);
                              },
                              child: const Text("Evet"),
                            ),
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Text("Hayır"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () => NotSil(),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            ListTile(trailing: InkWell(onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => NotGuncelle(notlar_model: notlar_Model(id:notlar.id,baslik: notlar['baslik'], not: notlar['not']),)));
                            },child: const Icon(Icons.edit,color: Colors.blue),),
                              title: Text(
                                notlar['baslik'],
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 24,
                                ),
                              ),
                              subtitle: Text(
                                notlar['not'],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NotEkle(),));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

