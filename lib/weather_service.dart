import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class WeatherService {
  static const _apiKey = 'bdaf83e9ca2fce2fd887215af87cc72d';
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<double> getCurrentTemperature() async {
    final locationData = await Location().getLocation();
    final latitude = locationData.latitude;
    final longitude = locationData.longitude;

    final url =
        '$_baseUrl?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final temp = jsonData['main']['temp'];
      return temp;
    } else {
      throw Exception('Failed to fetch temperature');
    }
  }
}