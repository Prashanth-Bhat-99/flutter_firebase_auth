import 'dart:ffi';

import 'package:authentification/Account.dart';
import 'package:authentification/Address.dart';
import 'package:authentification/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'Account.dart';
import 'Address.dart';
import 'SignUp.dart';
import 'Start.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
          _razorpay = Razorpay();
          _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
          _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
          _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      }
    
    
    
      
      late Razorpay _razorpay;
    
        
    
        @override
        void dispose() {
          super.dispose();
          _razorpay.clear();
      }
    
        void openCheckout() async {
          var options = {
            'key': 'rzp_test_bc7mbbF5DcB6lB',
            'amount': 2000,
            'name': 'Prashanth Bhat',
            'description': 'Payment',
            'prefill': {'contact': '9513893576', 'email': 'test@razorpay.com'},
            'external': {
            'wallets': ['paytm']
          }
        };
    
    
        try {
          _razorpay.open(options);
        } catch (e) {
          debugPrint('Error: e');
        }
      }
    
      void _handlePaymentSuccess(PaymentSuccessResponse response) {
        Fluttertoast.showToast(
            msg: "SUCCESS: " + response.paymentId!, toastLength: Toast.LENGTH_SHORT);
      }
    
      void _handlePaymentError(PaymentFailureResponse response) {
        Fluttertoast.showToast(
            msg: "ERROR: " + response.code.toString() + " - " + response.message!,
            toastLength: Toast.LENGTH_SHORT);
      }
    
      void _handleExternalWallet(ExternalWalletResponse response) {
        Fluttertoast.showToast(
            msg: "EXTERNAL_WALLET: " + response.walletName!, toastLength: Toast.LENGTH_SHORT);
      }
    
    
    
    
    
    
    @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Color(0xFFFFBE9E7),
          appBar: AppBar(
            
          title: const Text('Welcome Home !'),
          
      ),
      
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 24),
            DrawerHeader(
              
              decoration: BoxDecoration(
                
                color: Colors.orange[400],
              ),
              
              child: Text(
                'What are you looking for ?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('My Account'),
              onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){return Account();}));
            },


              
            ),
            ListTile(
              leading: Icon(Icons.location_city_rounded),
              title: Text('Add Address'),
              onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){return Address(city: '', hname: '', hno: '', loc: '', pin: '',);}));
            },
            ),
            ListTile(
              leading: Icon(Icons.login_rounded),
              title: Text('Sign Out'),
              onTap: (){
              showDialog(context: context, builder:(BuildContext context)=>AlertDialog(title: Text("Sign Out"),content: Text("Long Press on 'YES' to Sign Out"), 
              actions: [
                
               ElevatedButton(onPressed:(){Navigator.pop(context);}, child: Text("Yes"),onLongPress: signOut),
               ElevatedButton(onPressed:(){Navigator.pop(context);}, child: Text("No"),),
              ],
              ),
              );
              },


              
            ),
          ],
        ),
      ),
              
            body: Container(
              decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.5,1],
            colors: [Colors.white,Colors.pink]
          )
        ),
          child: !isloggedin
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    Container(
                      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink,Colors.blue]
          )
        ),
                      height: 300,
                      width: 400,
                      child: Image(
                        image: AssetImage("images/android.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      
                      child: Text(
                        "Hello, you are Logged in as ${user.email}",
                        style:
                            TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    


                    SizedBox(height: 40.0),
                  InkWell(
                      onTap: () {
                        openCheckout();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left:18.0,right: 18),
                        child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(25.0),
                                color: Colors.black),
                            child: Center(
                                child: Text('Checkout to Razorpay',
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)))),
                      )),

                    SizedBox(height: 40),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: signOut,
                      child: Text('Sign out',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  
    
                  ],
                ),
        ));
      }
    
    }


    
    




  