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
  List<CaseCountry> filtredlistCase = new List<CaseCountry>();
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  Widget _appBarTitle = new Text('Covid-19 track');

  @override
  void initState() {
    super.initState();
    new CaseCountryDao()
        .getAllCases()
        .then((value) => {
              // print(value)
              this.setState(() {
                listCase = value;
                filtredlistCase = listCase;
              })
            })
        .catchError((onError) => print(onError));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0), // here the desired height
        child: AppBar(
          centerTitle: true,
          title: _appBarTitle,
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: new TextField(
                controller: _filter,
                onChanged: _ExamplePageState(),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search),
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)))),
              ),
            ),
            Expanded(
              child: listCase.length != 0
                  ? _buildList()
                  : Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  _ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filtredlistCase = listCase;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List<CaseCountry> tempList = new List();
      for (int i = 0; i < filtredlistCase.length; i++) {
        if (filtredlistCase[i].country.toLowerCase().contains(_searchText)) {
          tempList.add(filtredlistCase[i]);
        }
      }
      this.setState(() {
        filtredlistCase = tempList;
      });
    }
    return ListView.builder(
      itemCount: listCase == null ? 0 : filtredlistCase.length,
      itemBuilder: (BuildContext context, int index) {
        return Mycard(filtredlistCase[index]);
      },
    );
  }
}
