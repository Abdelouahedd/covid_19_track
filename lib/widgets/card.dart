import 'package:covid_19_track/model/CaseCountry.dart';
import 'package:flutter/material.dart';

import 'SnackBarStatistique.dart';

class Mycard extends StatelessWidget {
  final CaseCountry country;
  Mycard(this.country);
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 6.0,
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(15),
      ),
      child: Container(
          height: 140,
          color: Colors.white24,
          width: MediaQuery.of(context).size.width / 2,
          child: buildBody(context, country)),
    );
  }
}

Widget buildBody(BuildContext context, CaseCountry caseCountry) {
  return Column(
    children: <Widget>[
      ListTile(
        leading: Icon(
          Icons.trending_up,
          color: Colors.red,
        ),
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Text(
              caseCountry.country,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (context) => PieOutsideLabelChart(country: caseCountry),
          );
        },
      ),
      Divider(
        color: Colors.grey,
        height: 8,
        thickness: 2,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          getTable("Cases", caseCountry.cases.toString(), Colors.blue[600]),
          getTable("active", caseCountry.active.toString(), Colors.red),
          getTable("deaths", caseCountry.deaths.toString(), Colors.black87),
          getTable("recovered", caseCountry.recovered.toString(), Colors.green)
        ],
      )
    ],
  );
}

Widget getTable(String name, String type, Color color) {
  return Expanded(
    child: Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
        Divider(
          color: Colors.grey,
          height: 15,
          thickness: 1,
          endIndent: 3,
          indent: 3,
        ),
        Text(
          type,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: color),
        )
      ],
    ),
  );
}
