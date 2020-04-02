import 'package:covid_19_track/model/CaseCountry.dart';
import 'package:flutter/material.dart';

class Mycard extends StatelessWidget {
  final CaseCountry country;
  Mycard({Key key, this.country}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 8.0,
      margin: EdgeInsets.only(
        top: 20.0,
      ),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(236, 236, 231, .6)),
        color: Colors.amber,
        child: Column(
          children: <Widget>[
             ListTile(
              leading: Text(this.country.cases.toString()),
              title: Text(this.country.country),
              subtitle: Text(''),
            ),
            new Row(
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}
Widget buildBody(CaseCountry caseCountry){
  return Column(
    children: <Widget>[

    ],
  );
}
