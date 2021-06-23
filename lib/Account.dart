import 'package:authentification/Address.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'Address.dart';
import 'HomePage.dart';



class Account extends StatefulWidget {

  
 

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  get email => null;
  get displayName=>null;

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



  @override
  Widget build(BuildContext context) {
    
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Welcome',
          home: Scaffold(
            backgroundColor: Color(0xFFFFBE9E7),
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:(){Navigator.pop(context);}),
              
              centerTitle: true,
            backgroundColor: Colors.pink[300],
              title: const Text('Account'),
            ),
            
            body: Column(
             
              children: [
                SizedBox(height: 20),
                Image.network('https://previews.123rf.com/images/valentint/valentint1611/valentint161105164/66183942-my-account-icon-my-account-website-button-on-white-background-.jpg',width:400,height: 200),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
              
             decoration: InputDecoration(
               border : UnderlineInputBorder(),
               labelText: ' prashanthbhatraja99@gmail.com',
               prefixIcon: Icon(Icons.email)
               
               ),
               
              
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
              
             decoration: InputDecoration(
               border : UnderlineInputBorder(),
               labelText: ' Prashanth Bhat',
               prefixIcon: Icon(Icons.account_box_sharp)
               
               ),
               
              
                ),
                  ),
                  ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context){return Address(city: '', hname: '', hno: '', loc: '', pin: '',);}));}, child:Text("Add Address")),

                  
                ],

                
            )
              
        
      ),
    );
  }
}