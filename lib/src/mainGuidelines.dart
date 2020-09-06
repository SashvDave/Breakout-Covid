import 'package:CovidHacksApp/src/login.dart';
import 'package:CovidHacksApp/src/stats.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';


void main() {
  runApp(MainGuidelineScreen());
}

class MainGuidelineScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  
}



class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Main',
      style: optionStyle,
    ),
    Text(
      'Index 1: Chart',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        _selectedIndex = 0;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainGuidelineScreen()));
      } else {
        _selectedIndex = 1;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Stats()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidelines to stay safe'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen())));
                  },
                  child: Icon(Icons.portrait)))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              title: Text('Main')),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.table_chart,
              color: Colors.blueAccent,
            ),
            title: Text('Chart'),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Container(
                  margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                  width: 95.0,
                  child: Text('Tips for staying hygenic and healthy!',
                  style: TextStyle(fontSize: 20),)
              ),
              new Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 155.0,
                  width: 95.0,
                  child: Image.asset('lib/src/assets/logo.png')),
              new Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  height: 500.0,
                  width: 95.0,
                  child: Text('As we are hitting the peak in COVID-19 Cases, it is of utmost importance that we all do our due diligence by abiding by the following guidelines: \n\nWash your hands often with soap and water for at least 20 seconds, especially after being in a public place, or after blowing your nose, coughing or sneezing. If you do not have soap and water available, use 60% alcohol hand sanitizer\n\nAvoid close contact with others around you as the virus can be spread even if symptoms are not apparent.\n\n      - Don’t unnecessarily travel\n\n      - Stay 6 feet away from others at all times\n\nCover your coughs and sneezes. Use a tissue to cover your nose and mouth, and throw used tissues in a lined trash can. If a tissue isn’t available, cough or sneeze into your elbow — not your hands. Wash your hands immediately.',
                  style: TextStyle(fontSize: 15),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
