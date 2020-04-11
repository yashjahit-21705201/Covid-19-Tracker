import 'package:covid19tracker/provider/summary_provider.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryList extends StatelessWidget {
  static const routeName = "/country_list";

  @override
  Widget build(BuildContext context) {
    final countries = Provider.of<SummaryProvider>(context).getCountryList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Countries'),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (ctx, index) =>
            Card(
              child: ListTile(
                leading: Flags.getMiniFlag(countries[index].countryCode, 50, 50),
                title: Text(countries[index].country),
              ),
            ),
      ),
    );
  }
}
