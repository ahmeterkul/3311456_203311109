// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

String asil_url = "";

Future<String> get _cihazyolu async {
  final Directory mobil_yol = await getApplicationDocumentsDirectory();
  return mobil_yol.path;
}

Future<File> klasor_yolu(String isim) async {
  final yol = await _cihazyolu;
  var yeniyol = await Directory("$yol/pdfler").create();
  return File("${yeniyol.path}/$isim.pdf");
}

Future<void> pdfindir(String url, String isim) async {
  try {
    final istek = await http.get(Uri.parse(url));
    if (istek.statusCode == 200) {
      final dosya = await klasor_yolu(isim);
      final indir = await dosya.writeAsBytes(istek.bodyBytes);
      asil_url = indir.path;
      print("Dosya başarıyla indirildi.");
    }
  } catch (e) {
    print("Dosya indirilirken hata oluştu. $e");
  }
}

String get urlcek {
  return asil_url;
}
