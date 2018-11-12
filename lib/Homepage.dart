import 'package:flutter/material.dart';

import './furniture.dart';
import './filter.dart';
import './houselist.dart';
import './mortage.dart';
import './Chatbot.dart';

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      // TODO: implement createState
      return _HomepageState();
    }
}
class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brick and Morty ',
      
      home: Scaffold(
      

///--------------
      appBar: AppBar(
        title: Text('Featured Houses'),
        centerTitle: true,
         actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.filter_list),
              onPressed: () {
                
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Filter()),
            );


              },
            ),

            new IconButton(
              icon: new Icon(Icons.info),
              onPressed: () {
                
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Chatbot()),
            );


              },
            ),
          ],
      ),


    
   


//bottomnavbar
     bottomNavigationBar: new BottomNavigationBar(
        items: [


          //homepage icon
          new BottomNavigationBarItem(
            backgroundColor: Colors.white,
            title: Text('Home'),
            icon: new IconButton(
              icon: new Icon(Icons.home), color: Colors.teal,
              onPressed: () {
                  
              },
            ),
          ),


          //furniture icon
          new BottomNavigationBarItem(
            title: Text('Furniture'),
            icon: new IconButton(
              icon: new Icon(Icons.airline_seat_flat),
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
              icon: new Icon(Icons.euro_symbol),
              onPressed: () {
               
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mortage()),
            );
              },
            ),
          ),



        

        ],
      ),

//--


     body: HouseList(
     query: "getFeatured", args: null,
    )

      
    

      
      
    )

    );
     
  }
}