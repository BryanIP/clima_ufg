import 'package:clima_ufg/api/api_rest.dart';
import 'package:clima_ufg/pages/home/models.dart';
import 'package:get/get.dart';

class SelectedCityController extends GetxController {
  final ApiRest apiRest = ApiRest();

  final tempC = 30.0.obs;
  final humidity = 0.obs;
  final uvIndex = 0.0.obs;
  final feelsLike = 0.0.obs;
  final preciptation = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchWeaterData(String cityName) async {
    try {
      final WeatherModel weatherData = await apiRest.getWeatherData(cityName);
      final current = weatherData.current;

      tempC.value = current.tempC;
      humidity.value = current.humidity.toInt();
      uvIndex.value = current.uv;
      feelsLike.value = current.feelslikeC;
      preciptation.value = current.precipMm;
    } catch (e) {
      print('Erro ao buscar os dados: $e');
    }
  }
}
