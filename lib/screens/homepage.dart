import 'package:covid19tracker/models/summary.dart';
import 'package:covid19tracker/provider/summary_provider.dart';
import 'package:covid19tracker/screens/countryUI/countries_list.dart';
import 'package:covid19tracker/screens/countryUI/country_information.dart';
import 'package:covid19tracker/widgets/country_card.dart';
import 'package:covid19tracker/widgets/information_card.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
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
    _summaryProvider = Provider.of<SummaryProvider>(context).getSummary();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Homepage',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: EnhancedFutureBuilder(
              future: _summaryProvider,
              rememberFutureResult: true,
              whenNotDone: Center(child: CircularProgressIndicator()),
              initialData: _summaryProvider,
              whenNone: Text('No internet Connection'),
              whenDone: (dynamic snapshot) => buildUi(snapshot),
            ),
    );
  }

  Widget buildUi(Summary snapshot) {
    var size = MediaQuery.of(context).size;
    final height = size.height / 2;
    final width = size.width * 0.65;
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Last updated: ${DateFormat('dd-MM-yyyy HH:mm').format(snapshot.date)}'),
            ),
            Align(
              child: InformationCard(
                left: true,
                height: 100,
                width: MediaQuery.of(context).size.width * 0.9,
                information: "${snapshot.global.totalConfirmed}",
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
                    information: '${snapshot.global.totalDeaths}',
                    left: false),
                InformationCard(
                  height: 100,
                  width: 175,
                  title: 'Recovered',
                  information: '${snapshot.global.totalRecovered}',
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
                  onPressed: () =>
                      Navigator.of(context).pushNamed(CountryList.routeName),
                  icon: Text('View All'),
                  label: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
              ],
            ),
            GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: height / width,
              ),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext ctx, int index) {
                var country = Provider.of<SummaryProvider>(context)
                    .mostAffectedCountries(snapshot.countries);
                return GestureDetector(
                  child: CountryCard(country[index]),
                  onTap: () => Navigator.of(context).pushNamed(
                      CountryInformation.routeName,
                      arguments: country[index]),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
