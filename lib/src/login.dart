import 'package:CovidHacksApp/src/Stats.dart';
import 'package:CovidHacksApp/src/intro.dart';
import 'package:CovidHacksApp/src/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

final FirebaseAuth _auth = FirebaseAuth.instance;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GoogleSignIn googleSignIn = GoogleSignIn();

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<FirebaseUser> _handleSigninWithEmail(
      String email, String password) async {
    print(email);
    print(password);
    AuthResult authResult = await _auth.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    final FirebaseUser user = authResult.user;

    //assert(user != null);
    //assert(await user.getIdToken() != null);

    print("Signed in user");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Stats()));
    return user;
  }

  Future<FirebaseUser> _handleSigninWithGoogle(
      GoogleSignIn googleSignIn) async {
    print("hi");
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in ");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Stats()));
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Container(
                  margin: EdgeInsets.only(top: 50, bottom: 10),
                  height: 175.0,
                  width: 115.0,
                  child: Image.asset('lib/src/assets/logo.png')),
              new Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: new InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    hintText: 'Enter your email ID',
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    contentPadding:
                        new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                  controller: _emailController,
                  validator: (input) =>
                      input.isEmpty ? 'You must enter an email' : null,
                ),
              ),
              new Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: new InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    hintText: 'Enter your password here',
                    prefixIcon: Icon(Icons.security),
                    labelText: 'Password',
                    contentPadding: new EdgeInsets.fromLTRB(
                      20.0,
                      10.0,
                      20.0,
                      10.0,
                    ),
                  ),
                  obscureText: true,
                  validator: (input) =>
                      input.isEmpty ? 'You must enter a password' : null,
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(10.0),
                child: RaisedButton.icon(
                    onPressed: () {
                      _handleSigninWithEmail(_emailController.text.trim(),
                          _passwordController.text);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    label: Text('Log in',
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    icon:
                        Icon(Icons.supervised_user_circle, color: Colors.white),
                    padding: const EdgeInsets.all(13.0),
                    textColor: Colors.white,
                    splashColor: Colors.red,
                    color: Colors.transparent),
              ),
              new Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                padding: EdgeInsets.all(10.0),
                child: RaisedButton.icon(
                    onPressed: () async {
                      _handleSigninWithGoogle(googleSignIn);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    label: Text('Sign in with Google',
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    icon: Icon(
                      Icons.explore,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(13.0),
                    textColor: Colors.white,
                    splashColor: Colors.red,
                    color: Colors.transparent),
              ),
              new Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Dont have an account? Sign up!',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
