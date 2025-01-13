import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchWeather(String city) async {
  final response = await http.get(
    Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=80f61246985245c197c71249243108&q={city}&aqi=yes'),
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
