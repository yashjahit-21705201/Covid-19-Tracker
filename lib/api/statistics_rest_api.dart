import 'dart:async';
import 'dart:convert';

import 'package:covid19tracker/models/country.dart';
import 'package:covid19tracker/models/summary.dart';
import 'package:http/http.dart' as http;

class StatisticsRestApi {
  static const _DEFAULT_URL = 'https://api.covid19api.com/';

  Summary _summary;

  Future<Summary> fetchSummary() async {
    print('Here i am');
    var response = await http
        .get('$_DEFAULT_URL/summary', headers: {"Accept": "application/json"});

    Map userMap = jsonDecode(response.body);
    _summary = Summary.fromJson(userMap);

    return _summary;
  }

  List<Country> getCountriesList() {
    return _summary.countries;
  }
}
