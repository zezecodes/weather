import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/data/images.dart';
import '../widgets/forecast_container.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 249, 173, 61),
                        Colors.deepPurple
                      ],
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '📍 Accra, Ghana',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const Text(
                          'Good Morning',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(Images.thunderstorm),
                        const Center(
                          child: Column(
                            children: [
                              Text(
                                '21 °C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'THUNDERSTORM',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                'Thursday 23 - 2:14pm',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ForecastContainer(
                                time: '5:34 pm',
                                weather: 'Sunrise',
                                image: Images.sunny,
                              ),
                              ForecastContainer(
                                time: '6:34 pm',
                                weather: 'Sunset',
                                image: Images.night,
                              )
                            ],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ForecastContainer(
                                time: '12 °C',
                                weather: 'Temp Max',
                                image: Images.hotTemperature),
                            ForecastContainer(
                                time: '8 °C',
                                weather: 'Temp Min',
                                image: Images.coolTemperature)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
