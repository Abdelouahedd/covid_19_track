import 'package:covid_19_track/model/CaseCountry.dart';
import 'package:flutter/material.dart';

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
          child: buildBody(country)),
    );
  }
}

Widget buildBody(CaseCountry caseCountry) {
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
          print("clicked");
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
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "Cases",
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
                  caseCountry.cases.toString(),
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.blue[600]),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "active",
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
                  caseCountry.active.toString(),
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.red),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "deaths",
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
                  caseCountry.deaths.toString(),
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black87),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "recovered",
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
                  caseCountry.recovered.toString(),
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.green),
                )
              ],
            ),
          )
        ],
      )
    ],
  );
}
