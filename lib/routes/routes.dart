import 'package:clima_ufg/pages/home/page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(
        name: '/home',
        page: () => const HomePage(),
        transition: Transition.fade)
  ];
}
