import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  double height;
  double width;
  String title;
  String country;
  dynamic information;
  bool left;
  BorderRadius radius = BorderRadius.circular(15.0);

  InformationCard({
    @required this.height,
    @required this.title,
    @required this.information,
    @required this.left,
    @required this.width,
    this.country,
  });

  @override
  Widget build(BuildContext context) {
    return left
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height,
              width: width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: radius,
                ),
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      width: width / 2,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        information,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            /// WRITE TITLE BELOW VALUE
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width,
              height: height,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: radius,
                ),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        information,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
