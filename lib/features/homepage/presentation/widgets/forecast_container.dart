import 'package:flutter/material.dart';

class ForecastContainer extends StatelessWidget {
  final String time;
  final String weather;
  final String image;
  const ForecastContainer({
    super.key,
    required this.time,
    required this.weather,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.transparent),
      child: Row(
        children: [
          Image.asset(image),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 5),
            child: Column(
              children: [
                Text(
                  weather,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(time, style: const TextStyle(color: Colors.white))
              ],
            ),
          )
        ],
      ),
    );
  }
}
