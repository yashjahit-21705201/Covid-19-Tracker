import 'package:covid19tracker/models/summary.dart';
import 'package:covid19tracker/provider/summary_provider.dart';
import 'package:covid19tracker/widgets/information_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<Summary> _summaryProvider;

  @override
  Widget build(BuildContext context) {
    _summaryProvider = Provider.of<SummaryProvider>(context, listen: false).getSummary();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Homepage',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<Summary>(
        future: _summaryProvider,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? buildCards(snapshot)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildCards(snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InformationCard(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.9,
          information: "${snapshot.data.global.totalConfirmed}",
          title: 'Total Cases Confirmed',
        ),
      ],
    );
  }
}
