import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:only_weather/features/homepage/presentation/bloc/homepage_bloc.dart';

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
                  child: BlocBuilder<HomepageBloc, HomepageState>(
                    builder: (BuildContext context, HomepageState state) {
                      if (state is HomepageSuccess) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '📍 ${state.weather.areaName}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const Text(
                                'Good Evening',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset(Images.thunderstorm),
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      '${state.weather.temperature!.celsius?.round()}°C',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${state.weather.weatherMain}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      DateFormat('EEEE dd •')
                                          .add_jm()
                                          .format(state.weather.date!),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30, bottom: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ForecastContainer(
                                      time: DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunrise!),
                                      weather: 'Sunrise',
                                      image: Images.sunny,
                                    ),
                                    ForecastContainer(
                                      time: DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunset!),
                                      weather: 'Sunset',
                                      image: Images.night,
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ForecastContainer(
                                      time:
                                          '${state.weather.tempMin?.celsius!.round()}°C',
                                      weather: 'Temp Max',
                                      image: Images.hotTemperature),
                                  ForecastContainer(
                                      time:
                                          '${state.weather.tempMax!.celsius?.round()}°C',
                                      weather: 'Temp Min',
                                      image: Images.coolTemperature)
                                ],
                              )
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
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
