import 'package:clima_ufg/core/colors.dart';
import 'package:clima_ufg/pages/home/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerPhoto extends GetWidget<HomeController> {
  const ContainerPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => HomeController(),
    );

    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      width: 300,
      decoration: BoxDecoration(
          color: defaultBlue.withOpacity(0.5),
          image: DecorationImage(
              image: Image.network(
                      'https://www.qualviagem.com.br/wp-content/uploads/2015/12/pra%C3%A7a-goiania-goias.jpg')
                  .image,
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(50.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Opacity(
            opacity: 0.9,
            child: Container(
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0)),
                  gradient: LinearGradient(colors: [
                    controller.temp < 30.0 ? defaultBlue : defaultRed,
                    controller.temp < 30.0 ? defaultGreen : defaultYellow
                  ])),
              child: Center(
                child: Obx(() => Text(
                      '${controller.temp}°',
                      style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: defaultWhite,
                          shadows: [
                            Shadow(
                                color: defaultBlack,
                                blurRadius: 10.0,
                                offset: Offset(2.0, 2.0))
                          ]),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
