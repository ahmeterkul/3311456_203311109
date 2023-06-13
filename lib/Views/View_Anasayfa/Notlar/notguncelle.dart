// ignore_for_file: non_constant_identifier_names

import 'package:film_uygulamasi/models/notlar_model.dart';
import 'package:film_uygulamasi/services/note_service.dart';
import 'package:flutter/material.dart';

class NotGuncelle extends StatefulWidget {
  final notlar_Model notlar_model;
  const NotGuncelle({Key? key, required this.notlar_model}) : super(key: key);

  @override
  State<NotGuncelle> createState() => _NotGuncelleState();
}

class _NotGuncelleState extends State<NotGuncelle> {

  final note_Service _note_service = note_Service();
  TextEditingController? _baslik;
  TextEditingController? _not;

  @override
  void initState() {
    _baslik = TextEditingController(text: widget.notlar_model.baslik);
    _not = TextEditingController(text: widget.notlar_model.not);
    super.initState();
  }

  @override
  void dispose() {
    _baslik!.dispose();
    _not!.dispose();
    super.dispose();
  }

  notGuncelle()
  {
    _note_service.notguncelle(notlar_Model(id: widget.notlar_model.id, baslik: _baslik!.text, not: _not!.text));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white30, backgroundColor: Colors.purple,
                            shadowColor: Colors.red,
                          ),
                          onPressed: () {notGuncelle();},
                          child: const Text("GUNCELLE")),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(16)),
              TextField(style: const TextStyle(color: Colors.white),
                  controller: _baslik,
                  decoration: const InputDecoration(
                      hintText: "Başlık",
                      filled: true,
                      fillColor: Colors.purple)),
              const Padding(padding: EdgeInsets.all(16)),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: _not,
                decoration: const InputDecoration(
                    hintText: "Not", filled: true, fillColor: Colors.purple),
                maxLines: 10,
              ),
              const Padding(padding: EdgeInsets.all(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white30, backgroundColor: Colors.purple,
                          shadowColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Geri Dön")),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
