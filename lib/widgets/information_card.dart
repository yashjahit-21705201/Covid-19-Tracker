import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  double height;
  double width;
  String title;
  String country;
  dynamic information;
  bool center;
  BorderRadius radius = BorderRadius.circular(15.0);

  InformationCard({
    @required this.height,
    @required this.width,
    @required this.title,
    @required this.information,
    this.center,
    this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: width,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: radius,),
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15),
                width: width / 2,
                child: Text(title, style: TextStyle(
                  fontSize: 18,

                ),),
              ),
              Container(
                child: Text(information, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
