import 'package:flutter/material.dart';

import './furniture.dart';
import './homepage.dart';

class Mortage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title: Text("Mortage"),
      ),




      body: null,
      


    //homepage icon
      bottomNavigationBar: new BottomNavigationBar(
        items: [


          new BottomNavigationBarItem(
            backgroundColor: Colors.white,
            title: Text('Home'),
            icon: new IconButton(
              icon: new Icon(Icons.home),color: Colors.grey,
              onPressed: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
              }
            ),
          ),


          //furniture icon
          new BottomNavigationBarItem(
            title: Text('Furniture'),
            icon: new IconButton(
              icon: new Icon(Icons.airline_seat_flat),color: Colors.grey,
              onPressed: () {
               
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Furniture()),
            );
              },
            ),
          ),


      //Mortage
        new BottomNavigationBarItem(
            title: Text('Mortage'),
            icon: new IconButton(
              icon: new Icon(Icons.euro_symbol),color: Colors.teal,
              onPressed: () {
               
                
              },
            ),
          ),
        ],
      ),





    )

    );
    
  }
}