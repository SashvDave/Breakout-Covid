import 'package:CovidHacksApp/src/guidelines0.dart';
import 'package:CovidHacksApp/src/guidelines1.dart';
import 'package:CovidHacksApp/src/guidelines2.dart';
import 'package:CovidHacksApp/src/home.dart';
import 'package:CovidHacksApp/src/login.dart';
import 'package:CovidHacksApp/src/mainGuidelines.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(Stats());

class Stats extends StatefulWidget {
  Stats({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bar Graph Demo',
      debugShowCheckedModeBanner: false,
      home: BarGraphScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepOrange,
      ),
    );
  }
}

class BarGraphScreen extends StatefulWidget {
  BarGraphScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BarGraphDemoState createState() => _BarGraphDemoState();
}

class StatsbyState {
  final String category;
  final int numbers;
  final charts.Color color;

  StatsbyState(this.category, this.numbers, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

final stateNames = {
  'AZ': 'arizona',
  'AK': 'alaska',
  'AL': 'alabama',
  'CO': 'colorado',
  'CA': 'california',
  'GA': 'georgia',
  'HI': 'hawaii',
  'ID': 'idaho',
  'IL': 'illinois',
  'IN': 'indiana',
  'KY': 'kentuchy',
  'LA': 'louisiana',
  'Md': 'maryland',
  'DE': 'delaware',
  'FL': 'florida',
  'MI': 'michigan',
  'MN': 'minnesota',
  'MT': 'montana',
  'NE': 'nebraska',
  'MA': 'massachusetts',
  'NM': 'new mexico',
  'OH': 'ohio',
  'OK': 'oklahoma',
  'OR': 'oregon',
  'NV': 'nevada',
  'NC': 'north carolina',
  'SC': 'south carolina',
  'NJ': 'new-jersey',
  'NY': 'new-york',
  'PA': 'pennsylvania',
  'TN': 'tennessee',
  'TX': 'texas',
  'UT': 'utah',
  'WA': 'washington',
};
final statenums = {
  'AZ': 4,
  'AK': 0,
  'AL': 1,
  'CO': 6,
  'CA': 5,
  'GA': 11,
  'HI': 13,
  'ID': 15,
  'IL': 16,
  'IN': 17,
  'KY': 19,
  'LA': 20,
  'MD': 22,
  'DE': 9,
  'FL': 10,
  'MI': 24,
  'MN': 25,
  'MT': 29,
  'NE': 32,
  'MA': 21,
  'NM': 35,
  'OH': 38,
  'OK': 39,
  'OR': 40,
  'NV': 36,
  'NC': 30,
  'SC': 44,
  'NJ': 34,
  'NY': 37,
  'PA': 41,
  'TN': 46,
  'TX': 47,
  'UT': 48,
  'WA': 52,
};

var caseNum;
var positivityRates;
var currentHospitalized;
var totalTestsViral;
var death;

class _BarGraphDemoState extends State<BarGraphScreen> {
  @override
  void initState() {
    super.initState();
  }

  handleInformation(String state) async {
    final url =
        await http.get('https://api.covidtracking.com/v1/states/current.json');
    state = "california";
    var reversed = stateNames.map((k, v) => MapEntry(v, k));
    var statename = reversed[state.toLowerCase()];
    var stateNum = statenums[statename];
    print(stateNum);
    print(statename);
    var response = await http.get(url);
    final data = json.decode(response.body);
    var numOfState = statenums.values.toList();
    caseNum = await data[stateNum]["positive"];
    positivityRates = await data[stateNum]["positiveIncrease"];
    currentHospitalized = await data[stateNum]["hospitalizedCurrently"];
    totalTestsViral = await data[stateNum]["totalTestsViral"];
    death = await data[stateNum]["death"];
    print(int.parse(caseNum.toString()));
    print(int.parse(positivityRates.toString()));
    print(int.parse(currentHospitalized.toString()));
    print(int.parse(totalTestsViral.toString()));
    print(int.parse(death.toString()));
  }

  makingPredictions() async {
    final url = await http.get('http://127.0.0.1:5000/api?Quer=Predictions');
    final data = json.decode(url.body);
    var predictionVal = data["Predictions"];
    print(predictionVal);
    if (predictionVal == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Guideline0Screen()));
    } else if (predictionVal == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Guideline1Screen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Guideline2Screen()));
    }
  }

  void getData() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    FirebaseDatabase.instance
        .reference()
        .child(user.uid)
        .child('state')
        .once()
        .then((DataSnapshot snapshot) {
      state = snapshot.value.toString();
    });
  }

  String state;
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainGuidelineScreen()));
      } else {
        _selectedIndex = 1;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Stats()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      StatsbyState(
          'Number of Cases', int.parse(caseNum.toString()), Colors.red),
      StatsbyState('Positive Test Rate', int.parse(positivityRates.toString()),
          Colors.yellow),
      StatsbyState('Number hopsitalized',
          int.parse(currentHospitalized.toString()), Colors.green),
      StatsbyState('Number dead', int.parse(death.toString()), Colors.orange),
      StatsbyState('Number infected', int.parse(totalTestsViral.toString()),
          Colors.purpleAccent),
    ];

    var series = [
      charts.Series(
        domainFn: (StatsbyState clickData, _) => clickData.category,
        measureFn: (StatsbyState clickData, _) => clickData.numbers,
        colorFn: (StatsbyState clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(
              labelRotation: 55,

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 15, // size in Pts.
                  color: charts.MaterialPalette.white),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),

      /// Assign a custom style for the measure axis.
      primaryMeasureAxis: new charts.NumericAxisSpec(
        renderSpec: new charts.GridlineRendererSpec(

            // Tick and Label styling here.
            labelStyle: new charts.TextStyleSpec(
                fontSize: 15, // size in Pts.
                color: charts.MaterialPalette.white),

            // Change the line colors to match text color.
            lineStyle:
                new charts.LineStyleSpec(color: charts.MaterialPalette.white)),
      ),
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 300.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 In Your Area'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          chartWidget,
          Container(
              height: 50,
              width: 250,
              padding: const EdgeInsets.all(10),
              child: RaisedButton.icon(
                onPressed: () {
                  makingPredictions();
                },
                label: Text('Get Evaluation'),
                icon: Icon(Icons.assignment_return),
              )),
        ],
      ),
    );
  }
}
