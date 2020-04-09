import 'package:covid19tracker/models/summary.dart';
import 'package:covid19tracker/provider/summary_provider.dart';
import 'package:covid19tracker/screens/main_app_page.dart';
import 'package:covid19tracker/screens/news.dart';
import 'package:covid19tracker/screens/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SummaryProvider()),
      ],
      child: MaterialApp(
        title: 'Covid19 Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,
          fontFamily: 'Open Sans',
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Open Sans',
        ),
        home: MainAppPage(),
        routes: {
          News.routeName: (ctx) => News(),
          Symptoms.routeName: (ctx) => Symptoms(),
        },
      ),
    );
  }
}
