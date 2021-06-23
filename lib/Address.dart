import 'package:authentification/seeaddress.dart';
import 'package:flutter/material.dart';

import 'Account.dart';
import 'global.dart' as global;
import 'HomePage.dart';

class Address extends StatefulWidget {
 final String hno,hname,loc,city,pin;
  Address({required this.city,required this.hname,required this.hno,required this.loc,required this.pin});

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
var hnocontroller = new TextEditingController(text:"");
var hnamecontroller = new TextEditingController(text:"");
var loccontroller = new TextEditingController(text:"");
var pincontroller = new TextEditingController(text:"");
var citycontroller = new TextEditingController(text:"");


  @override
  Widget build(BuildContext context) {
    
        return MaterialApp(
          
          debugShowCheckedModeBanner: false,
          title: 'Address',
          home: Scaffold(
            backgroundColor: Color(0xFFFFBE9E7),
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:(){Navigator.pop(context);}),
              
              centerTitle: true,
            backgroundColor: Colors.pink[300],
              title: const Text('Add Address'),
            ),
            body: Column(
             
              children: [
               



                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: hnocontroller,
                      onSaved:(value){setState(() {
                        global.housenumber = value!;
                      });} ,
                      onChanged:(value){setState(() {
                        global.housenumber=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'House No.',
               prefixIcon: Icon(Icons.pin)
               ),
               ),
                  ),




                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: hnamecontroller,
                      onChanged:(value){setState(() {
                        global.housename=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'House Name',
               prefixIcon: Icon(Icons.home)
               ),
               ),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: loccontroller,
                      onChanged:(value){setState(() {
                        global.locality=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'Locality',
               prefixIcon: Icon(Icons.local_activity)
               ),
               ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: citycontroller,
                      onChanged:(value){setState(() {
                        global.city=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'City',
               prefixIcon: Icon(Icons.location_city)
              
               ),
               ),
                  ),

                  Padding(
                    
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: pincontroller,
                      onChanged:(value){setState(() {
                        global.pincode=value;
                      });} ,
               decoration: InputDecoration(
               border : UnderlineInputBorder(),
               hintText: 'Pincode',
               prefixIcon: Icon(Icons.pin_drop)
               ),
               ),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => seeaddress(value:Address(hno:hnocontroller.text.toString(),hname:hnamecontroller.text.toString(),
              loc:loccontroller.text.toString(),city:citycontroller.text.toString(),pin: pincontroller.text.toString(),) ),
              ),
            );
                  }, 
                  
                  child: Text('Add',
                  
                          style: TextStyle(
                              
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              
                               )),
                              
                              ),

                    SizedBox(height:30),
                  RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                     onPressed: () {
                      Navigator.pop(context);
},
                      child: Text('Go Back',
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

                
            )
            
              
        
      ),
    );
  }
}
