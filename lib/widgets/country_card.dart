import 'package:covid19tracker/models/country.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryCard extends StatelessWidget {
  final Country country;

  CountryCard(this.country);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Flags.getFullFlag(country.countryCode, 25, 25),
                ),
                Text('Total Cases')
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('${country.totalConfirmed}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
