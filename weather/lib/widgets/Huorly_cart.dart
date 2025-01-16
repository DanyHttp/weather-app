import 'package:flutter/material.dart';

import 'dart:math';

class Huorly_Cart extends StatelessWidget {
  const Huorly_Cart({
    super.key,
    required this.screensize,
    required this.index,
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
  });

  final Size screensize;
  final int index;
  final String cityName;
  final String temperature;
  final String weatherCondition;

  @override
  Widget build(BuildContext context) {
    final currentHour = DateTime.now().hour;
    final displayHour = (currentHour + index) % 24;

    final random = Random();
    final baseTemperature = double.tryParse(temperature);

    if (baseTemperature == null) {
      debugPrint('Error: Invalid temperature input - "$temperature"');
    }

    final validTemperature = baseTemperature ?? 20.0;

    final variationPercentage = (random.nextDouble() * 0.2) - 0.1;
    final adjustedTemperature =
        (validTemperature * (1 + variationPercentage)).toStringAsFixed(1);

    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      width: screensize.width / 5.5,
      height: screensize.height / 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff9BC6FD), Color(0xff5099FC)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$displayHour:00',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            adjustedTemperature + " °C",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
