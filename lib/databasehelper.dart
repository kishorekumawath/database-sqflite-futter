import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class databaseHelper{
    databaseHelper._privateConstructor();
    static final databaseHelper instance = databaseHelper._privateConstructor();

    static final _dbName = 'myDatabase.db';
    static final _dbVersion = 1;
    static final _dbTable = 'Mynote';

    static Database? _database;
   Future<Database?> get database async{
       if(_database == null ){
         print("ishnukk");
         _database = await _initiateDatabase();
         return _database;
       }
       return _database;
   }

   _initiateDatabase() async{
       Directory directory = await getApplicationDocumentsDirectory();
       String path = join(directory.path,_dbName);
       return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);

   }

   Future _onCreate(Database db, int version) => db.execute(
            '''
            CREATE TABLE MYNOTE( _id INTEGER PRIMARY KEY, NAME TEXT NOT NULL)
            '''
        );

   Future<int?> insert(Map<String,dynamic> row) async{
       Database? db = await instance.database;
      return await db?.insert("MYNOTE",row);
   }

   Future<List<Map<String,dynamic>>?> queryAll() async{
       Database? db = await instance.database;
       return await db?.query("MYNOTE");
   }

   Future<int?> update(Map<String,dynamic> row) async{
       Database? db = await instance.database;
       int id = row['_id'];
       return await db?.update("MYNOTE",row,where: '_id = ?',whereArgs: [id] );
   }

   Future<int?> delete(int id)async{
       Database? db =await instance.database;
       return await db?.delete("MYNOTE",where: '_id = ?',whereArgs: [id]);

   }
}