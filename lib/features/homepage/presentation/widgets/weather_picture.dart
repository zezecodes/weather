import 'package:flutter/material.dart';

import '../../../../core/data/images.dart';

class WeatherPicture extends StatelessWidget {
  const WeatherPicture({
    super.key,
    required this.code,
  });

  final int code;

  @override
  Widget build(BuildContext context) {
    switch (code) {
      case >= 200 && <= 232:
        return Image.asset(Images.thunderstorm);
      case >= 300 && <= 321:
        return Image.asset(Images.drizzles);

      case >= 500 && <= 531:
        return Image.asset(Images.rainfall);

      case >= 600 && <= 622:
        return Image.asset(Images.showers);
      case >= 701 && <= 781:
        return Image.asset(Images.windy);

      case == 800:
        return Image.asset(Images.cloudy);

      case >= 801 && <= 804:
        return Image.asset(Images.cloudySunshine);
      default:
        return Image.asset(Images.cloudy);
    }
  }
}