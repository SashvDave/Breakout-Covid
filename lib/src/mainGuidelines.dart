import 'package:CovidHacksApp/src/Stats.dart';
import 'package:flutter/material.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidelines for Staying Healthy'),
        backgroundColor: Colors.deepOrange,
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
