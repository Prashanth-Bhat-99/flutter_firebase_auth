import 'package:authentification/Address.dart';
import 'package:flutter/material.dart';

import 'Address.dart';




class seeaddress extends StatefulWidget {

  final Address value;

seeaddress( {Key? key,required this.value}):super(key:key);
 

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<seeaddress> {





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
              title: const Text('Address'),
            ),
            body: Column(
             
              children: [
                Image.network('https://letterhub.com/wp-content/uploads/2018/02/location-1200x675.jpg',width:400,height: 300),
                

                  Container(child: Text("The Address is ${widget.value.hno},${widget.value.hname},${widget.value.loc},${widget.value.city},${widget.value.pin}", 
                              style: TextStyle(
                              color: Colors.black,
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center)
                  
                  
                  
                  ),
                  SizedBox(height:50),
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