import 'package:flutter/material.dart';


class HouseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        //Appbar
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),




      body: null,



    //bottomNavBar
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            title: Text('data'),
            icon: new IconButton(
              icon: new Icon(Icons.ac_unit),
              onPressed: () {},
            ),
          ),
          new BottomNavigationBarItem(
            title: Text('data'),
            icon: new IconButton(
              icon: new Icon(Icons.ac_unit),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    )

    );
    
  }
}