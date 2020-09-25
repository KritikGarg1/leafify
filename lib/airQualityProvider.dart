import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AirQuality {
  String temp;
  String aqi;
  String level;
}

String baseUrl = "http://api.airvisual.com/v2/nearest_city?";
String apiKey = "95f8289f-f71a-4201-9ca4-e2845e183807";

Future getAirQuality(String lat, String long) async {
  await http
      .get(baseUrl + "lat=" + lat + "&lon=" + long + "&key=" + apiKey)
      .then((response) {
    print(response);
  });
}
