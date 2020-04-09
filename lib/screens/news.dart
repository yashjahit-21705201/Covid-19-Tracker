import 'package:flutter/material.dart';

class News extends StatefulWidget {

  static const routeName = '/news';

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
