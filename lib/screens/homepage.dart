import 'package:covid19tracker/models/summary.dart';
import 'package:covid19tracker/provider/summary_provider.dart';
import 'package:covid19tracker/widgets/information_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<Summary> _summaryProvider;

  @override
  Widget build(BuildContext context) {
    _summaryProvider =
        Provider.of<SummaryProvider>(context, listen: false).getSummary();
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
              ? buildUi(snapshot)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildUi(AsyncSnapshot<Summary> snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              'Last updated: ${DateFormat('dd-MM-yyyy HH:mm').format(snapshot.data.date)}'),
        ),
        Align(
          child: InformationCard(
            left: true,
            height: 100,
            width: MediaQuery.of(context).size.width * 0.9,
            information: "${snapshot.data.global.totalConfirmed}",
            title: 'Total Cases: ',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InformationCard(
                height: 100,
                width: 175,
                title: 'Deaths',
                information: '${snapshot.data.global.totalDeaths}',
                left: false),
            InformationCard(
              height: 100,
              width: 175,
              title: 'Recovered',
              information: '${snapshot.data.global.totalRecovered}',
              left: false,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Most Affected Countries',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FlatButton.icon(
              onPressed: null,
              icon: Text('View All'),
              label: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          ],
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext ctx, int index) => Divider(),
            itemBuilder: (BuildContext ctx, int index) {
              return ListTile(
                title: Text('Hello'),
              );
            },
          ),
        ),
      ],
    );
  }
}
