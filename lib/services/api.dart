import 'dart:convert';

import 'package:covid_19/models/coronavirus.dart';
import 'package:http/http.dart' as http;

class Info {
  Future<CoronaVirusModel> get(String) async {
    // ignore: unused_local_variable
    var coronaVirusModel = null;

    const apiUrl = 'https://disease.sh/v3/covid-19/countries';

    final response = await http.get("${country.displayName}");

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      coronaVirusModel = CoronaVirusModel.fromJson(jsonMap);
    }
  }
}
