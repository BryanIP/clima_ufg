import 'package:clima_ufg/api/api_rest.dart';
import 'package:clima_ufg/pages/home/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../selected_city/controller.dart';

class HomeController extends GetxController {
  final menuIndex = 1.obs;
  final temp = 0.0.obs;

  final ApiRest apiRest = ApiRest();
  final defaultCityName = 'goiania';
  final cityNameSearch = TextEditingController().obs;

  @override
  void onInit() async {
    menuIndex.value = 1;
    FlutterNativeSplash.remove();
    await fetchWeaterData(defaultCityName);
    super.onInit();
  }

  fetchWeaterData(String cityName) async {
    try {
      final WeatherModel weatherData = await apiRest.getWeatherData(cityName);
      final current = weatherData.current;

      temp.value = current.tempC;
    } catch (e) {
      print('Erro ao buscar os dados: $e');
    }
  }

  selectedCity() async {
    final cityName = cityNameSearch.value.text.isEmpty
        ? defaultCityName
        : cityNameSearch.value.text;
    Get.lazyPut(() => SelectedCityController());
    Get.find<SelectedCityController>().fetchWeaterData(cityName);
    Get.toNamed('/selected_city');
  }

  void searchOnEnter() {
    if (cityNameSearch.value.text.isNotEmpty) {
      selectedCity();
    }
  }

  changeIndex(index) => menuIndex.value = index;
}
