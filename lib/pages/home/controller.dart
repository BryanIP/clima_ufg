import 'package:clima_ufg/api/api_rest.dart';
import 'package:clima_ufg/pages/home/models.dart';
import 'package:clima_ufg/pages/selected_city/controller.dart';
import 'package:clima_ufg/pages/selected_city/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final menuIndex = 1.obs;
  final temp = 30.0.obs;

  final ApiRest apiRest = ApiRest();
  final cityNameSearch = TextEditingController().obs;

  @override
  void onInit() {
    menuIndex.value = 1;
    temp.value = 30.0;
    fetchWeaterData('goiania');
    super.onInit();
  }

  void fetchWeaterData(String cityName) async {
    try {
      final WeatherModel weatherData = await apiRest.getWeatherData(cityName);
      final current = weatherData.current;

      temp.value = current.tempC;
    } catch (e) {
      print('Erro ao buscar os dados: $e');
    }
  }

  selectedCity() async {
    Get.lazyPut(() => SelectedCityController());
    Get.find<SelectedCityController>()
        .fetchWeaterData(cityNameSearch.value.text);
    Get.toNamed('/selected_city');
  }

  changeIndex(index) => menuIndex.value = index;
}
