import 'package:flutter/material.dart';

class CountryCasesInfo extends StatelessWidget {
  final int totalConfirmed;
  final int newConfirmed;
  final int totalDeaths;
  final int newDeaths;
  final int totalRecovered;
  final int newRecovered;

  CountryCasesInfo(
      {@required this.totalConfirmed,
      @required this.newConfirmed,
      @required this.totalDeaths,
      @required this.newDeaths,
      @required this.totalRecovered,
      @required this.newRecovered});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 125,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Total Confirmed'),
                    Text('$totalConfirmed', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                VerticalDivider(width: 10, thickness: 0.5, color: Colors.grey,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('New Confirmed'),
                    Text('$newConfirmed', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: 125,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Total Recovered'),
                    Text('$totalRecovered', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                VerticalDivider(width: 10, thickness: 0.5, color: Colors.grey,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('New Recovered'),
                    Text('$newRecovered', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: 125,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Total Deaths'),
                    Text('$totalDeaths', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                VerticalDivider(width: 10, thickness: 0.5, color: Colors.grey,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('New Deaths'),
                    Text('$newDeaths', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
