import 'package:flutter/material.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Container(
                margin: EdgeInsets.only(top: 50, bottom:10),
                height: 175.0, width: 115.0, child: Image.asset('assets/logo.png')),
              new Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: new InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.green, width: 2.0),
                    ),
                    hintText: 'Enter your email ID',
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    contentPadding:
                    new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                  validator: (input) =>
                  input.isEmpty
                      ? 'You must enter an email'
                      : null,
                ),
              ),
              new Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: new InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                    ),
                    hintText: 'Enter your password here',
                    prefixIcon: Icon(Icons.security),
                    labelText: 'Password',
                    contentPadding:
                    new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0,),
                  ),
                  obscureText: true,
                  validator: (input) =>
                  input.isEmpty
                      ? 'You must enter a password'
                      : null,
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top:5),
                padding: EdgeInsets.all(10.0),
                child:  RaisedButton.icon(
                  onPressed: (){ Navigator.of(context).pushNamed('/register');  },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                        label: Text('Log in', style: TextStyle(color: Colors.white)),
                        icon: Icon(Icons.supervised_user_circle, color: Colors.white), 
                          padding: const EdgeInsets.all(13.0),
                          textColor: Colors.white,
                          splashColor: Colors.red,
                          color: Colors.transparent
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 5, bottom:10),
                padding: EdgeInsets.all(10.0),
                child:  RaisedButton.icon(
                  onPressed: (){ Navigator.of(context).pushNamed('/register');},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                        label: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
                        icon: Icon(Icons.explore, color: Colors.white,), 
                          padding: const EdgeInsets.all(13.0),
                          textColor: Colors.white,
                          splashColor: Colors.red,
                          color: Colors.transparent
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
