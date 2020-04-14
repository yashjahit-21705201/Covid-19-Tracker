import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:covid19tracker/models/country.dart';
import 'package:covid19tracker/models/summary.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class StatisticsRestApi {
  static const _DEFAULT_URL = 'https://api.covid19api.com/';

  Summary _summary;

  Future<Summary> fetchSummary() async {
    try {
      final _result = await InternetAddress.lookup('example.com');
      if (_result.isNotEmpty && _result[0].rawAddress.isNotEmpty) {
        try {
          final response = await http
              .get(
              '$_DEFAULT_URL/summary', headers: {"Accept": "application/json"});

          if (response.statusCode == 200) {
            Map userMap = jsonDecode(response.body);
            _summary = Summary.fromJson(userMap);
            _writeJson(response.body);

            return _summary;
          }
        } catch (e) {
          print(e);
        }
      }
    } on SocketException catch (_) {
      return Summary.fromJson(json.decode(await readJson()));
    }
  }

  List<Country> getCountriesList() {
    return _summary.countries;
  }

  /// Get local file path
  Future<File> get localFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/summary.json');
  }

  /// Write JSON to local file
  Future<File> _writeJson(summary) async {
    final file = await localFilePath;

    return file.writeAsString('$summary');
  }

  /// Read JSON from local file
  Future<String> readJson() async {
    try {
      final file = await localFilePath;
      String json = await file.readAsString();
      return json;
    } catch(e) {
      return null;
    }
  }
}
