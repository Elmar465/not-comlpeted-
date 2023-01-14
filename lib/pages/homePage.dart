// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_json/provider/myHomePageProvider.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Json Parsing"),
      ),
      body: ChangeNotifierProvider<MyHomePageProvider>(
        create: (context) => MyHomePageProvider(),
        child: Consumer<MyHomePageProvider>(
          builder: (context, provider, child ) {
            if(provider.data == null ) {
              provider.getData(context);
              // ignore: prefer_const_constructors
              return Center( child: CircularProgressIndicator(),
              );             
            }
            // ignore: prefer_const_constructors
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                   // ignore: prefer_const_literals_to_create_immutables
                   columns: [
                    // ignore: prefer_const_constructors
                    DataColumn(label:Text("Verified"),tooltip: "User info" ),
                    DataColumn(label:Text("First Name"),tooltip: "User info" ),
                    DataColumn(label:Text("Last Name"),tooltip: "User info" ),
                    DataColumn(label:Text("Email"),tooltip: "User info" ),
                    DataColumn(label:Text("Phone"),tooltip: "User info" ),

                    
                   ], rows: provider.data!.result!.map((data) => 
                    
                   DataRow(
                    cells: [
                      DataCell(Text(data.id)),
                      DataCell(Text(data.imdb)),
                      DataCell(Text(data.name)),
                      DataCell(Text(data.description)),
                      DataCell(Text(data.trailers)),
                    ]
                   )
                   ).toList(), 
                ),
              )
            );
          }  
          
        )
    )
    );
  }
}