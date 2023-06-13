// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> Yorumlari_Cek(String film_adi) async {
  const apiKey = '1c8e0d6a74bb2322dbc8ef356ec61dc3';
  final url =
      'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$film_adi';
  final response = await http.get(Uri.parse(url));
  final data = jsonDecode(response.body);
  final film_id = data['results'][0]['id'];
  final yorumurl =
      'https://api.themoviedb.org/3/movie/$film_id/reviews?api_key=$apiKey';
  final reviewResponse = await http.get(Uri.parse(yorumurl));
  final reviewData = jsonDecode(reviewResponse.body);
  return reviewData['results'];
}
