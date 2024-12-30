import 'dart:async';

import 'package:learnings_app/modules/authentication/presentation/login/viewModel/user_model.dart';
import 'package:learnings_app/modules/booking/presentation/flight_result/viewmodel/flight_response_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDetailsProvider{
   var database;
  UserDetailsProvider({this.database});
  Future initializeDataBase() async{
   database=openDatabase(join(await getDatabasesPath(),'user.db'),version: 1,
  onCreate: (db, version) {
    return db.execute('CREATE TABLE  IF NOT EXISTS userdetails(email TEXT PRIMARY KEY, password TEXT)');
  }, );
  print("table creates");
  
  }
  Future insertUserDetails(UserDetails details) async{
   Database db=await database;
   await db.insert("userdetails", details.toJson());
   print(details.email);
  }
  Future updateUserDetails(UserDetails details) async{
    Database db=await database;
    
  }
  Future<List<UserDetails>> fetchUserDetails(UserDetails details) async{
    Database db=await database;
   final List<Map<String,dynamic>> userMap =await db.query('userdetails');
   final users=List<UserDetails>.from(userMap.map((e) => UserDetails.fromJson(e)));

return users;
    
  }
  Future<UserDetails> getUser(String email) async{
    final db=await database;
   //final res=await db.rawQuery("SELECT * FROM userdetails WHERE EMAIL=email")
   
   var details =await db.rawQuery("SELECT * FROM userdetails WHERE EMAIL=$email");
  //return UserDetails.fromJson(details);
  //print(details[0]);
   // return UserDetails.fromJson( await db.rawQuery("SELECT * FROM userdetails WHERE EMAIL=email"));
    //var details= await db.query('userdetails',where:'email=?',whereArgs:[email]);
  //print(details.first);
  return UserDetails.fromJson(details.first);
   
   //);
  }
  Future addNewColumn() async{
      final db=await database;
      await db.execute("ALTER TABLE userdetails ADD COLUMN name TEXT");
     await db.query('userdetails');
    print("cloumn created");
  }
}