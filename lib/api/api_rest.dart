import 'dart:convert';
import 'dart:io';

import 'package:clima_ufg/pages/home/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ApiRest extends GetxController {
  final apiKey = dotenv.env['API_KEY']!;
  final apiUrl = 'https://api.weatherapi.com/v1/current.json?q=';

  Future<WeatherModel> getWeatherData(String cityName) async {
    final response = await http.get(Uri.parse('$apiUrl$cityName&key=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final WeatherModel weatherData = WeatherModel.fromJson(data);
      return weatherData;
    } else {
      switch (response.statusCode) {
        case 400 || 401 || 403:
          throw HttpException(response.body);
        default:
          throw Exception('Algo de errado não está certo.');
      }
    }
  }
}
