import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

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
    var reversed = stateNames.map((k, v) => MapEntry(v, k));
    var statename = reversed[state.toLowerCase()];
    var stateNum = statenums[statename];
    print(stateNum);
    print(statename);
    final data = json.decode(url.body);
    var numOfState = statenums.values.toList();
    caseNum = data[stateNum]["positive"];
    positivityRates = data[stateNum]["positiveIncrease"];
    currentHospitalized = data[stateNum]["hospitalizedCurrently"];
    totalTestsViral = data[stateNum]["totalTestsViral"];
    death = data[stateNum]["death"];
    print(caseNum);
    print(positivityRates);
    print(currentHospitalized);
    print(totalTestsViral);
    print(death);
  }

  @override
  Widget build(BuildContext context) {

    var data = [
      StatsbyState('Number of Cases', 10, Colors.red),
      StatsbyState('Positive Test Rate', 20, Colors.yellow),
      StatsbyState('Number hopsitalized', 200, Colors.green),
      StatsbyState('Number dead', 40, Colors.orange),
      StatsbyState('Number infected', 20, Colors.purpleAccent),
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
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white)),
        
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
        title: Text('Bar Graph Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: RaisedButton.icon(
                onPressed: () {
                  handleInformation("california");
                },
                icon: Icon(Icons.security),
                label: Text('click here')),
          ),
          new Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  padding: EdgeInsets.all(10.0),
                  child: Text('Displaying Data for the area:'),
          ),
          chartWidget
        ],
      ),
    );
  }
}


