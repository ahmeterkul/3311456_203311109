
import 'package:film_uygulamasi/utils/grafik_util.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import  'package:film_uygulamasi/models/grafik_model.dart';

class Grafik extends StatefulWidget {
  const Grafik({Key? key}) : super(key: key);

  @override
  State<Grafik> createState() => _GrafikState();
}

class _GrafikState extends State<Grafik> {
  List<Grafik_Model> _grafik = [];
  Grafik_Util utils = Grafik_Util();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await utils.grafik_Listele().then((result) => {
      setState(() {
        _grafik = result;
      })
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Grafik_Model> data = [];

    for (int i = 0; i < _grafik.length; i++) {
      data.add(
        Grafik_Model(
          name: _grafik[i].name,
          count: _grafik[i].count,
        ),
      );
    }

    List<charts.Series<Grafik_Model,String>> series = [charts.Series(id: "izlenme",data: data,
      domainFn: (Grafik_Model series, _) => series.name,
      measureFn: (Grafik_Model series, _) => series.count,
    )];

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Expanded(flex: 20,
              child: SizedBox(
                height: 500,
                child: charts.BarChart(
                  series,
                  animate: true,
                  primaryMeasureAxis: const charts.NumericAxisSpec(
                    renderSpec: charts.GridlineRendererSpec(
                      labelStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.white,
                      ),
                      lineStyle: charts.LineStyleSpec(
                        color: charts.MaterialPalette.white,
                      ),
                    ),
                  ),
                  domainAxis: const charts.OrdinalAxisSpec(
                    renderSpec: charts.SmallTickRendererSpec(
                      labelStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.white,
                      ),
                      lineStyle: charts.LineStyleSpec(
                        color: charts.MaterialPalette.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),Expanded(flex: 1,
              child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < series[0].data.length; i++)
                    Text(
                      series[0].data[i].count.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
            ),

          ],
        ),
      ),
    );
  }
}
