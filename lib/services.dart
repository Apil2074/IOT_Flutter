import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iotirr/weathermode.dart';

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=27.9903&lon=84.0643&appid=319aa7f19728dd2383c255afd3e17f88"),
    );
    // now we can cange latitude and longitude and let's see how it perfrom.
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
        // print(json).toString();
      } else {
        throw Exception('Failed to load Weather data');
      }
      // print(json);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      // print(json);
    }
  }
}
// replace the api key with your api key thay openWeathemap provide you
// for your current location provide the longitude and latitude of your current location