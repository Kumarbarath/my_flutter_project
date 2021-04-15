import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:listofimages/list.dart';
import 'package:listofimages/page1.dart';

void main(){
  runApp(MyApp());
}









class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ImageModel> images =[];
 int count =1;


  void fetch() async{

    var response = await http.get(Uri.http("jsonplaceholder.typicode.com", "photos/$count"));
    //
    //print(response);
    var parsedJson =json.decode(response.body);
    var imageModel= new ImageModel.fromJson(parsedJson);
     setState(() {
       images.add(imageModel);
     });


  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("List of images "),
          centerTitle: true ,
        ),
        body:ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              fetch();
              count++;
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}










