import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';



class AirQuality {
  int temp=30;
  int aqi=100;
  String level="Moderate";
  AirQuality(this.temp,this.aqi,this.level);

}

AirQuality aq;
class AirState with ChangeNotifier {
  AirState();


  void setAirQuality(AirQuality air) {
    aq = air;
    notifyListeners();
  }

  AirQuality get getAir => aq;
}

String baseUrl = "http://api.airvisual.com/v2/nearest_city?";
String apiKey = "95f8289f-f71a-4201-9ca4-e2845e183807";

Future getAirQuality(String lat, String long) async {

  String url=baseUrl + "lat=" + lat + "&lon=" + long + "&key=" + apiKey;
  print(url);
  await http
      .get(url)
      .then((response) {
    final responseJson = json.decode(response.body);
    String lvl;
    int pol=responseJson["data"]["current"]["pollution"]["aqius"];
    var x=pol;
    if(x>=140)lvl="Unhealthy";
    else if(x>=100)lvl="Bad";
    else if(x>=80)lvl="Moderate";
    else lvl="Good";
    AirQuality airQuality=AirQuality(responseJson["data"]["current"]["weather"]["tp"],responseJson["data"]["current"]["pollution"]["aqius"],lvl);
    print(airQuality.aqi);
    print(",,,,,,,,,,,,,,,,");
    AirState().setAirQuality(airQuality);

  });
}
