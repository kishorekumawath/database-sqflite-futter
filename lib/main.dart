import 'dart:io';

import 'package:databasesqflitcode/databasehelper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () async{
               int? i = await databaseHelper.instance.insert(
                  {'NAME':'kishore'}
                );
               print(i);

              }, child: Text("insert")),
              ElevatedButton(onPressed: () async{
                List<Map<String, dynamic>>? row = await databaseHelper.instance.queryAll();
                print(row);
              }, child: Text("query")),
              ElevatedButton(onPressed: ()async{
                int? updateid = await databaseHelper.instance.update({'_id':3,'NAME':'hero'});
                print(updateid);
              }, child: Text("update")),
              ElevatedButton(onPressed: ()async{

                int? deleteid = await databaseHelper.instance.delete(3);
                print(deleteid);
              }, child: Text("delete")),
            ],
          ),
        ),
      ),
    );
  }
}



