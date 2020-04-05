import 'package:covid_19_track/controller/CaseCountryDAo.dart';
import 'package:covid_19_track/model/CaseCountry.dart';
import 'package:covid_19_track/widgets/card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CaseCountry> listCase = new List<CaseCountry>();

  @override
  void initState() {
    super.initState();
    new CaseCountryDao()
        .getAllCases()
        .then((value) => {
              // print(value)
              this.setState(() {
                listCase = value;
              })
            })
        .catchError((onError) => print(onError));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track covid-19"),
      ),
      body: listCase.length != 0
          ? ListView.builder(
              itemCount: listCase.length,
              itemBuilder: (context, int i) {
                return Mycard(listCase[i]);
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
