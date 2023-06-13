// ignore_for_file: camel_case_types

class Grafik_Model
{
  final String name;
  final int count;
  Grafik_Model({required this.name,required this.count});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'count': count,
    };
  }

}