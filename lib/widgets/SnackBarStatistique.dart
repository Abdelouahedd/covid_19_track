import 'package:covid_19_track/model/CaseCountry.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart'; // import the package

class PieOutsideLabelChart extends StatefulWidget {
  PieOutsideLabelChart({Key key, this.country}) : super(key: key);
  final CaseCountry country;

  @override
  _PieOutsideLabelChartState createState() => _PieOutsideLabelChartState();
}

class _PieOutsideLabelChartState extends State<PieOutsideLabelChart> {
  Map<String, double> data = new Map();

  @override
  void initState() {
    data.addAll({
      // 'Cases': widget.country.cases.toDouble(),
      'Active': widget.country.active.toDouble(),
      'deaths': widget.country.deaths.toDouble(),
      'recovred': widget.country.recovered.toDouble()
    });
    super.initState();
  }

  List<Color> _colors = [Colors.red, Colors.black87, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey,Colors.blueGrey[200]]),
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0))),
      height: MediaQuery.of(context).size.height / 1.5,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              widget.country.country,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 50,
            ),
            PieChart(
              dataMap: data,
              // colorList: _colors,
              animationDuration: Duration(milliseconds: 1500),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 2.5,
              showChartValuesInPercentage: true,
              // showChartValues: false,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[100],
              showLegends: true,
              legendPosition: LegendPosition.right,
              decimalPlaces: 1,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(
                color: Colors.blueGrey[900].withOpacity(0.9),
              ),
              chartType: ChartType.disc, //can be changed to ChartType.ring
            )
          ],
        ),
      ),
    );
  }
}
