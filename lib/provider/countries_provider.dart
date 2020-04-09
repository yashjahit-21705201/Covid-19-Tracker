import 'package:covid19tracker/models/country.dart';
import 'package:flutter/material.dart';

class CountriesProvider with ChangeNotifier {

  List<Country> _countryStatistics;

  List<Country> get countryStatistics => _countryStatistics;



}