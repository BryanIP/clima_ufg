import 'dart:convert';
import 'dart:io';

import 'package:clima_ufg/api/api_rest.dart';
import 'package:clima_ufg/pages/home/models.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/utils.dart';

class SelectedCityController extends GetxController {
  final ApiRest apiRest = ApiRest();

  final tempC = 0.0.obs;
  final humidity = 0.obs;
  final uvIndex = 0.0.obs;
  final feelsLike = 0.0.obs;
  final preciptation = 0.0.obs;
  final city = ''.obs;

  fetchWeaterData(String cityName) async {
    try {
      final WeatherModel weatherData = await apiRest.getWeatherData(cityName);
      final current = weatherData.current;

      tempC.value = current.tempC;
      humidity.value = current.humidity.toInt();
      uvIndex.value = current.uv;
      feelsLike.value = current.feelslikeC;
      preciptation.value = current.precipMm;
      city.value = weatherData.location.name;
    } on HttpException catch (err) {
      Get.back();

      final Map<String, dynamic> errors = jsonDecode(err.message);
      final code = errors['error']['code'];

      switch (code) {
        case 1003:
          showWarning('Parâmetro Cidade não informado.');
          break;
        case 1006:
          showWarning('Cidade não encontrada.');
          break;
        default:
          if (kDebugMode) {
            showError(err.message);
            print(err.message);
          }
      }
    } catch (e) {
      if (kDebugMode) {
        showError(e.toString());
        print('Erro ao buscar os dados: $e');
      }
    }
  }
}
