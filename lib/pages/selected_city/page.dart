import 'package:clima_ufg/core/colors.dart';
import 'package:clima_ufg/pages/home/widgets/city_info.dart';
import 'package:clima_ufg/pages/home/widgets/container_goiania.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedCity extends GetView {
  const SelectedCity({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          color: defaultWhite,
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              Container(
                height: Get.height * 0.9,
                width: Get.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        transform: const GradientRotation(-0.5),
                        colors: [
                          defaultGreen.withOpacity(0.4),
                          defaultBlue.withOpacity(0.7)
                        ]),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const CityInfo(),
                          const ContainerGoiania(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Descrição',
                                  style: GoogleFonts.alatsi(fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Goiânia é a capital do estado de Goiás, no Brasil, e foi fundada em 24 de outubro de 1933. É uma cidade planejada, concebida para substituir a antiga capital estadual, Vila Boa, atual Cidade de Goiás. A construção de Goiânia foi parte de um esforço para modernizar e desenvolver a região central do Brasil, promovido pelo então governador Pedro Ludovico Teixeira.',
                              style: GoogleFonts.raleway(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            height: 70,
                            width: 150,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.0),
                                    bottomRight: Radius.circular(50.0)),
                                gradient: LinearGradient(
                                    colors: [defaultGreen, defaultBlue])),
                            child: Center(
                              child: Text('Voltar',
                                  style: GoogleFonts.alatsi(
                                      fontSize: 20.0, color: defaultWhite)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
