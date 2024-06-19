import 'package:clima_ufg/api/api_rest.dart';
import 'package:clima_ufg/pages/home/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final temp = 30.0.obs;
  final menuIndex = 1.obs;
  final humidity = 0.0.obs;
  final ApiRest apiRest = ApiRest();

  @override
  void onInit() {
    temp.value = 30.0;
    menuIndex.value = 1;
    fetchWeaterData('goiania');
    super.onInit();
  }

  void fetchWeaterData(String cityName) async {
    try {
      final WeatherModel weatherData = await apiRest.getWeatherData(cityName);
      temp.value = weatherData.current.tempC;
      humidity.value = weatherData.current.humidity;
    } catch (e) {
      print('Erro ao buscar os dados: $e');
    }
  }

  changeIndex(index) => menuIndex.value = index;
}
