import 'dart:convert';

import 'package:covid_19/constants/strings.dart';
import 'package:covid_19/models/coronainfo.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Corona_api {
  Future<CoronaModel> getCorona() async {
    var client = http.Client();
    // ignore: avoid_init_to_null
    var coronaModel = null;

    try {
      var response = await client.get(Strings.corona_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        coronaModel = CoronaModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return coronaModel;
    }
    return coronaModel;
  }
}
