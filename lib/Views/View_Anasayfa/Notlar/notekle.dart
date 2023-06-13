import 'package:film_uygulamasi/services/note_service.dart';
import 'package:flutter/material.dart';

class NotEkle extends StatefulWidget {
  const NotEkle({Key? key}) : super(key: key);

  @override
  State<NotEkle> createState() => _NotEkleState();
}

class _NotEkleState extends State<NotEkle> {
  note_Service not = note_Service();
  TextEditingController baslik = TextEditingController();
  TextEditingController icerik = TextEditingController();

  void notEkle() {
    not.notekle(baslik.text.trim(), icerik.text.trim());
    baslik.clear();
    icerik.clear();
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
                          onPressed: () {
                            notEkle();
                          },
                          child: const Text("EKLE")),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(16)),
              TextField(style: const TextStyle(color: Colors.white),
                  controller: baslik,
                  decoration: const InputDecoration(
                      hintText: "Başlık",
                      filled: true,
                      fillColor: Colors.purple)),
              const Padding(padding: EdgeInsets.all(16)),
              TextField(style: const TextStyle(color: Colors.white),
                controller: icerik,
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
