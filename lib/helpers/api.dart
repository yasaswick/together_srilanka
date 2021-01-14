
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:together_we_fight/models/restApi.dart';


class Api {

Future<Report> fetchReport() async {
  final response = await http.get('http://hpb.health.gov.lk/api/get-current-statistical');

  if (response.statusCode == 200) {
     var data = await json.decode(response.body);
     //print(data);
    return Report.fromJson(data['data']);
   
  } else {
    throw Exception('Failed');
  }
}







}

