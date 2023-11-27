import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_weather/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:only_weather/features/homepage/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomepageBloc>(
      create: (BuildContext context) => HomepageBloc()..add(FetchWeather()),
      child: const MaterialApp(
        home: Homepage(),
      ),
    );
  }
}
