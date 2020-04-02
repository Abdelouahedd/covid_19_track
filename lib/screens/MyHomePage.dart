import 'package:covid_19_track/controller/CaseCountryDAo.dart';
import 'package:covid_19_track/widgets/card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new CaseCountryDao().getAllCases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track covid-19"),
      ),
      body: Container(
        child: Center(
          child: Text("fetching data 1"),
        ),
      ),
    );
  }
}
