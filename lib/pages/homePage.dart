// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_json/provider/myHomePageProvider.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

   var jsonList;
  @override
  void initState(){
    super.initState();
    getData();
  }
  void getData()  async{
    try {
      var response = await Dio().get("https://api.metaflix.az/api/filter/slidercontents/AZ");
      if(response.statusCode == 200){
        setState(() {
          jsonList =response.data["result"]  as List;
        });
      }else{
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
      
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          // ignore: prefer_const_constructors
          return Card(
            // ignore: prefer_const_constructors
            child: Column(
              children: [
                ListTile(
                  // ignore: prefer_const_constructors
                  title: Text(jsonList[index]["id"]),
                  // ignore: prefer_const_constructors
                  subtitle: Text(jsonList[index]["name"]),
                  // trailing: Text(jsonList[index]["name"]["url"]),
                ),
                ListTile(
                  // ignore: prefer_const_constructors
                  // title: Text(jsonList[index]["trailers"]),
                  // ignore: prefer_const_constructors
                  // subtitle: Text(jsonList[index]["name"]),
                ),
              ],
            ),
          );
        },
        itemCount: jsonList == null?0:jsonList.length, 
      ),
    );
  }
}