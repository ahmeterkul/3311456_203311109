// ignore_for_file: non_constant_identifier_names

class Favori {
  final String film_ismi;
  final String link;
  final String aciklama;

  Favori({required this.film_ismi, required this.link, required this.aciklama});

  Map<String, String> toMap() {
    return {
      'film_ismi': film_ismi,
      'link': link,
      'aciklama': aciklama,
    };
  }
}
