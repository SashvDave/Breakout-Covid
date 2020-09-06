import 'package:CovidHacksApp/src/Stats.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(Guideline0Screen());
}

class Guideline0Screen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidelines for Businesses'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Container(
                  margin: EdgeInsets.only(top: 10, left: 65, right: 15),
                  width: 95.0,
                  child: Text('Tips for staying at Home!',
                  style: TextStyle(fontSize: 20),)
              ),
              new Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 155.0,
                  width: 95.0,
                  child: Image.asset('lib/src/assets/logo.png')),
              new Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  height: 120.0,
                  width: 95.0,
                  child: Text('1. Start Right at the Front Door With Screeners: Screeners perform temperature checks and other health assessments to ensure that anyone who could potentially be infected does not get into your building. ',
                  style: TextStyle(fontSize: 15),)
              ),
              new Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 215.0,
                  width: 95.0,
                  child: Text('2. Keep mindly with shifts: With a pandemic through contact spreading around, simply screening is not always reliable and with many employees in the store, customers coming in and out, and essentially everyone touching everything, it is important that as a reopening business you keep employee shifts mindly. \n\n        - Rigorous Disinfection Protocols \n\n        - Reasonable Travel Restrictions')
              )
            ],
          ),
        ),
      ),
    );
  }
}
