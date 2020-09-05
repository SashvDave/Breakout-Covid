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
        primaryColor: Colors.blue,
      ),
    );
  }
}

class BarGraphScreen extends StatefulWidget {
  BarGraphScreen({Key key}) : super(key: key);

  @override
  _BarGraphDemoState createState() => _BarGraphDemoState();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Graph Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: RaisedButton.icon(
                onPressed: () {
                  handleInformation("california");
                },
                icon: Icon(Icons.security),
                label: Text('click here')),
          ),
        ],
      ),
    );
  }
}
