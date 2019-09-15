import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:nasa/Rocket/Model/ModelClass.dart';


Future<List<Launch>> getLaunches() async {
  DateTime _date= DateTime.now();
  String _todayDate=DateFormat('yyyy-MM-dd').format(_date);
  List<Launch> _launches=[];
  try {
    Response response = await Dio().get("https://launchlibrary.net/1.4/launch/$_todayDate");
    Map data=jsonDecode('$response');
    List _launcheData=data['launches']??[];
    _launcheData.forEach((launchInfo){
     Launch _launch= Launch();
     _launch.setLaunch(launchInfo);
      _launches.add(_launch);
    });
return _launches;

  } catch (e) {
    print(e);
    return _launches;
  }



}