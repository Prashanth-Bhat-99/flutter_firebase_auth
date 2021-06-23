import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:authentification/Login.dart';
import 'SignUp.dart';
import 'package:google_sign_in/google_sign_in.dart';



class Start extends StatefulWidget {
  
  @override
  _StartState createState() => _StartState();
}



class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink,Colors.blue]
          )
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 1),
            Container(
              height:325,

              child: Image(
                image: AssetImage("images/Home.png"),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 1),
            RichText(
              
                text: TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                ]),
                textAlign: TextAlign.center),
            SizedBox(height: 10.0),
            
            Text(
              'Firebase Authentication',
              style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[500]),
                          textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'VERZEO Task 3',
            
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
              
              
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    onPressed: navigateToLogin,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange),
                SizedBox(width: 20.0),
                RaisedButton(
                    padding: EdgeInsets.only(left: 38, right: 38),
                    onPressed: navigateToRegister,
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange),
              ],
            ),
            SizedBox(height: 30.0),
            SignInButton(Buttons.Google,
            
                text: "Sign up with Google", onPressed: googleSignIn,)
                
          ],
        ),
      ),
    );
  }
}
