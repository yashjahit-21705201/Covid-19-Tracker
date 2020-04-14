import 'package:covid19tracker/models/country.dart';
import 'package:covid19tracker/widgets/country_cases_info.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryInformation extends StatelessWidget {
  static const routeName = "./country_information";

  @override
  Widget build(BuildContext context) {
    final country = ModalRoute.of(context).settings.arguments as Country;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(country.country),
      ),
      body: ListView(
        children: <Widget>[
          Material(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Flags.getFullFlag(
                          country.countryCode, size.height / 4, size.width / 4),
                    ),
                  ),
                ),
                Divider(
                  height: size.height / 10 - 50,
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: size.width / 10,
                  indent: size.width / 10,
                ),
                Text(
                    'Last updated: ${DateFormat('dd-MM-yyyy HH:mm').format(country.updatedDate)}'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CountryCasesInfo(
                    totalConfirmed: country.totalConfirmed,
                    newConfirmed: country.newConfirmed,
                    totalDeaths: country.totalDeaths,
                    newDeaths: country.newDeaths,
                    totalRecovered: country.totalRecovered,
                    newRecovered: country.newRecovered,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
