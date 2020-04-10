import 'package:covid19tracker/screens/homepage.dart';
import 'package:covid19tracker/screens/news.dart';
import 'package:covid19tracker/screens/settings.dart';
import 'package:covid19tracker/screens/symptoms.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainAppPage extends StatefulWidget {

  @override
  _MainAppPageState createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    News(),
    Symptoms(),
    Settings(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: GNav(
          tabMargin: EdgeInsets.all(10.0),
          gap: 8,
          activeColor: Colors.white,
          iconSize: 22,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          duration: Duration(milliseconds: 800),
          tabBackgroundColor: Colors.grey[800],
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Homepage',
            ),
            GButton(
              icon: Icons.library_books,
              text: 'News',
            ),
            GButton(
              icon: Icons.local_hospital,
              text: 'Symptoms',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
          },
        ),
      ),
    );
  }
}
