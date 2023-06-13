import 'package:flutter/material.dart';

extension Contextextension on BuildContext {
  //this = context
  double genislik(double deger) => MediaQuery.of(this).size.width * deger;
  double yukseklik(double deger) => MediaQuery.of(this).size.height * deger;

}
