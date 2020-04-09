import 'package:covid19tracker/api/statistics_rest_api.dart';
import 'package:covid19tracker/models/summary.dart';
import 'package:flutter/material.dart';

class SummaryProvider with ChangeNotifier{

  StatisticsRestApi _api = StatisticsRestApi();

  Future<Summary> getSummary() {
    var result = _api.fetchSummary();
    return result;
  }

}