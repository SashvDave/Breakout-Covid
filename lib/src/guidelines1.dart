import 'package:CovidHacksApp/src/Stats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Guideline1Screen());
}

class Guideline1Screen extends StatelessWidget {
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
        title: Text('Guidelines for Consideration'),
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Stats()));
            }),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 15),
                  width: 95.0,
                  child: Text(
                    'Tips for Considering whether or not \n                        to open!',
                    style: TextStyle(fontSize: 20),
                  )),
              new Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 155.0,
                  width: 95.0,
                  child: Image.asset('lib/src/assets/logo.png')),
              new Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  height: 150.0,
                  width: 95.0,
                  child: Text(
                    '1. Do you really need it? With Covid-19 spreading around at an exponential rate and continuing to rise, is it worth going back into business, putting so many employees at risk and having to constantly worry about making sure everyone is screened. The answer might not be no for everyone but it is something to think about. ',
                    style: TextStyle(fontSize: 15),
                  )),
              new Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 215.0,
                  width: 95.0,
                  child: Text(
                      '2. What value does your company bring about being in-person? Does your average customer experience drastically increase when you reopen? If not, recommendations from the CDC and WHO strongly suggest that you should continue online operations, and again, the answer is not the same for everyone, but be sure to consider!'))
            ],
          ),
        ),
      ),
    );
  }
}
