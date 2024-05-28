import 'package:clima_ufg/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerPhoto extends GetWidget {
  const ContainerPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
