import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

void main() => runApp(new MyApp());

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  } 
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  
  

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser != null) {
      return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/Login_background.png"),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.lighten,
              //color: Colors.white54,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text("Welcome \n" + _currentUser.displayName,
                      style: TextStyle(
                          fontSize: 40.0,
                          fontFamily: 'Righteous',
                          color: Colors.black87)),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(_currentUser.email,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Righteous',
                          color: Colors.black54)),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Colors.blue[200],
                    color: Colors.blueAccent,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(
                            'Sign out',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                    onPressed: _handleSignOut,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    } else {
      return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/Login_background.png"),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.lighten,
              //color: Colors.white54,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text("People's \nChoice",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontFamily: 'Righteous',
                          color: Colors.black87)),
                ),
                SizedBox(height: 50.0),
                Container(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.black54),
                      hintText: 'Username or Email',
                      contentPadding: EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.black54),
                      hintText: 'Password',
                      contentPadding: EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Colors.blue[200],
                    color: Colors.blueAccent,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(
                            'Sign in',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => {},
                  ),
                ),
                SizedBox(height: 15.0),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 50.0, right: 50.0, top: 5.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          margin: EdgeInsets.all(8.0),
                          decoration:
                              BoxDecoration(border: Border.all(width: 0.25)),
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Expanded(
                        child: new Container(
                          margin: EdgeInsets.all(8.0),
                          decoration:
                              BoxDecoration(border: Border.all(width: 0.25)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Colors.white,
                    color: Colors.red,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(
                            'Sign in with Google',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                        new Image(
                          image: new AssetImage("assets/icon_googleplus.png"),
                        ),
                      ],
                    ),
                    onPressed: _handleSignIn,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }
  }
}
