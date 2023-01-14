// ignore_for_file: unused_local_variable, unnecessary_this

import 'dart:convert';
import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_json/model/myData.dart';

class MyHomePageProvider  extends ChangeNotifier{
    MyData? data;

    Future getData(BuildContext context) async{
        var response = await DefaultAssetBundle.of(context).loadString("assets/raw/examples._api.Json");
        var mjson = json.decode(response);
        this.data  = MyData.fromJson(mjson);
        this.notifyListeners();
    }
}