import 'dart:convert';

import 'package:covid_19_track/model/CaseCountry.dart';
import 'package:http/http.dart' as http;

class CaseCountryDao {
  String _url;

  CaseCountryDao() {
    this._url = "https://coronavirus-19-api.herokuapp.com/countries/";
  }

  Future<List<CaseCountry>> getAllCases() async {
    var response = await http.get(Uri.parse(this._url));
    List responseJson = json.decode(response.body);
    print('data from url $responseJson');
    if (response.statusCode == 200) {
      return responseJson
          .map((caseCountry) => new CaseCountry.fromJson(caseCountry))
          .toList();
    } else {
      throw Exception("ERROR while fetching data from the url");
    }
  }
}
