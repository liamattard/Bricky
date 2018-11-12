import 'package:flutter/material.dart';

class Housepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title: Text('House1'),
      ),




      body: null,
      


    //homepage icon
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