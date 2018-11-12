import 'package:flutter/material.dart';
import 'Utility.dart';

class HouseList extends StatefulWidget  {
 final String query;
 final List<String> args;

 HouseList({Key key, @required this.query, @required this.args}) : super(key: key);

 State<StatefulWidget> createState() {

   return _HouseListState();
 }
}

class _HouseListState extends State<HouseList> {
 List<List<Object>> _houses = new List<List<Object>>();

 refreshHouses(List<List<Object>> newHouses){
   setState((){
     _houses = newHouses;
   });
 }

 @override
 void initState(){
   super.initState();

   // Additional initialization of the State

   Utility.query(widget.query, widget.args).then((results) => refreshHouses(results));
 }

 Widget build(BuildContext context ) {


   return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
           body: Column(
         children: (_houses.map((element) => Card (
           child: Column(  children : <Widget>[Text(element[0]), Text("world")],))
         ).toList()),
       )));
 }
}




