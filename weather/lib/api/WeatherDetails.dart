import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherDetails {
  static Future<Map<String, dynamic>> getWeatherDetails(String city) async {
    const String apiKey = "80f61246985245c197c71249243108";
    final String url =
        "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&aqi=yes";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to fetch weather data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
