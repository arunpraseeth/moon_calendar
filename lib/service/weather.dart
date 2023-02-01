import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moon_calendar/weather_serialization.dart';

class WeatherService with ChangeNotifier {
  late WeatherSerialization _weather;
  Future weatherService() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Peterborough,On?key=CZTVB3DZDCZH52EC7GSM8CS4E"),
      );
      _weather = weatherSerializationFromJson(response.body);
      notifyListeners();
      return _weather;
    } catch (e) {
      print(e);
      return throw e;
    }
  }

  WeatherSerialization get weatherData => _weather;
}
