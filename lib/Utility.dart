import 'dart:io';
import 'dart:async';

import 'package:sqljocky5/auth/auth_handler.dart';
import 'package:sqljocky5/auth/character_set.dart';
import 'package:sqljocky5/auth/handshake_handler.dart';
import 'package:sqljocky5/auth/ssl_handler.dart';
import 'package:sqljocky5/common/logging.dart';
import 'package:sqljocky5/comm/buffered_socket.dart';
import 'package:sqljocky5/comm/comm.dart';
import 'package:sqljocky5/comm/common.dart';
import 'package:sqljocky5/comm/receiver.dart';
import 'package:sqljocky5/comm/sender.dart';
import 'package:sqljocky5/connection/connection.dart';
import 'package:sqljocky5/connection/impl.dart';
import 'package:sqljocky5/connection/settings.dart';
import 'package:sqljocky5/constants.dart';
import 'package:sqljocky5/exceptions/client_error.dart';
import 'package:sqljocky5/exceptions/exceptions.dart';
import 'package:sqljocky5/exceptions/mysql_exception.dart';
import 'package:sqljocky5/exceptions/protocol_error.dart';
import 'package:sqljocky5/handlers/debug_handler.dart';
import 'package:sqljocky5/handlers/handler.dart';
import 'package:sqljocky5/handlers/ok_packet.dart';
import 'package:sqljocky5/handlers/parameter_packet.dart';
import 'package:sqljocky5/handlers/ping_handler.dart';
import 'package:sqljocky5/handlers/quit_handler.dart';
import 'package:sqljocky5/handlers/use_db_handler.dart';
import 'package:sqljocky5/prepared_statements/close_statement_handler.dart';
import 'package:sqljocky5/prepared_statements/execute_query_handler.dart';
import 'package:sqljocky5/prepared_statements/prepared_query.dart';
import 'package:sqljocky5/prepared_statements/prepare_handler.dart';
import 'package:sqljocky5/prepared_statements/prepare_ok_packet.dart';
import 'package:sqljocky5/query/query_stream_handler.dart';
import 'package:sqljocky5/query/result_set_header_packet.dart';
import 'package:sqljocky5/results/binary_data_packet.dart';
import 'package:sqljocky5/results/blob.dart';
import 'package:sqljocky5/results/field.dart';
import 'package:sqljocky5/results/results.dart';
import 'package:sqljocky5/results/row.dart';
import 'package:sqljocky5/results/standard_data_packet.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils/buffer.dart';


class Utility {
 static Socket socket;
 static String result;


 static Future<Object> query(String query, List<String> args) async{

   //create that hot sex connection
   var s = ConnectionSettings(
     user: "root",
     password: "butterMilkMonsterAttack",
     host: "10.0.2.2",
     port: 3306,
     db: "brick_and_mortar",
   );

   var conn =  await MySqlConnection.connect(s);

   if(query == "getFeatured"){
     return getFeatured(conn);
   }
   else if(query == "searchHouses"){
     return getSearch(conn, args);
   }

   return null;
 }

 static Future<List<List<Object>>> getSearch(var conn, List<String> args) async {
//
//
//    //execute that queeeery
//
//    Prepared statement = await conn.
//    Results results = await conn.execute("select * from houses");
//
//    List<List<Object>> info = new List<List<Object>>();
//
//    //process results
//    int counter = 0, i = 0;
//    results.forEach((Row row) {
//      info.add(new List<Object>());
//      i = 0;
//
//      while(true) {
//        try {
//          info[counter].add(row[i]);
//          i++;
//        }
//        catch
//        (e) {
//
//          counter++;
//          break;
//        }
//      }
//    });
//
//    await conn.close();
//
//    return info;
 }

 static Future<List<List<Object>>> getFeatured(var conn) async {

   //execute that queeeery
   Results results = await conn.execute("select * from houses");

   List<List<Object>> info = new List<List<Object>>();

   //process results
   int counter = 0, i = 0;
   results.forEach((Row row) {
       info.add(new List<Object>());
       i = 0;

       while(true) {
         try {
           info[counter].add(row[i]);
           i++;
         }
         catch
         (e) {

           counter++;
           break;
         }
       }
   });

   await conn.close();

   return info;
 }



}

