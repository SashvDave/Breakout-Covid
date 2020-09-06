import 'package:CovidHacksApp/src/Stats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Guideline2Screen());
}

class Guideline2Screen extends StatelessWidget {
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
        title: Text('Guidelines for Home'),
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
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
                  child: Text(
                    'Tips for staying at Home!',
                    style: TextStyle(fontSize: 20),
                  )),
              new Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 155.0,
                  width: 95.0,
                  child: Image.asset('lib/src/assets/logo.png')),
              new Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  height: 215.0,
                  width: 95.0,
                  child: Text(
                    '1. There are hundreds of counselors available to help you relieve any anxiousness or concerns you may have about your business. If you are ever under duress, or require any help, the first thing you should always do is reach out for your help, whether or not you know it, everyone is here for you. Below are some helplines to call if in need of help: \n\n        - Crisis Services: 716-834-3131 \n        - Open Counseling: (800)-662-4357',
                    style: TextStyle(fontSize: 15),
                  )),
              new Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 215.0,
                  width: 95.0,
                  child: Text(
                      '2. Get some fresh air. Social distancing doesn’t mean you can’t go outside as long as you keep a distance from anyone who isn’t part of your family. Go for a walk! Take a hike! Do some outdoor yoga! The natural world is your oyster. Dive in. Some examples: \n\n        - Pilates \n        - Virtual Spin classes'))
            ],
          ),
        ),
      ),
    );
  }
}
