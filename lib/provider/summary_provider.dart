import 'package:covid19tracker/api/statistics_rest_api.dart';
import 'package:covid19tracker/models/country.dart';
import 'package:covid19tracker/models/summary.dart';
import 'package:flutter/material.dart';

class SummaryProvider with ChangeNotifier{

  StatisticsRestApi _api = StatisticsRestApi();

  Summary _summary;

  Future<Summary> getSummary() async {
    _summary = await _api.fetchSummary();
    return _summary;
  }

  List<Country> getCountryList() {
    return _summary.countries;
  }

  List<Country> mostAffectedCountries() {
    var countries = _summary.countries;
    countries.sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));

    print(countries[0].country);
    return countries.getRange(0, 3);
  }

}