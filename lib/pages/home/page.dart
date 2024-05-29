import 'package:clima_ufg/core/colors.dart';
import 'package:clima_ufg/pages/home/widgets/container_brasilia.dart';
import 'package:clima_ufg/pages/home/widgets/container_goiania.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: defaultWhite,
          selectedItemColor: defaultBlue,
          unselectedItemColor: defaultGreen,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
      appBar: AppBar(
        title: const Text('Clima UFG'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Goiânia
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.location_on),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Goiânia',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Container(
              height: Get.height * 0.3,
              width: Get.width,
              color: defaultBlue.withOpacity(0.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ContainerGoiania();
                },
              ),
            ),

            // Brasília
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.location_on),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Brasília',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Container(
              height: Get.height * 0.3,
              width: Get.width,
              color: defaultBlue.withOpacity(0.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ContainerBrasilia();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
