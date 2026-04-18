import 'package:flutter/material.dart';
import 'package:task_weather/common/domain/entities/entities.dart';
import 'package:task_weather/presentation/widgets/widget.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.data});
  final ApiData data;

  @override
  Widget build(BuildContext context) {
    final location = data.location;
    final current = data.current;

    if (location == null || current == null) {
      return SizedBox.shrink();
    }
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          ConditionInfo(text: '${location.name}\n${location.region}', size: 30),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              ConditionIcon(icon: current.condition!.icon.toString(), text: current.condition!.text.toString()),
              ConditionInfo(text: 'Temperature\n${current.tempC}℃', size: 20),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              ConditionInfo(text: 'Wind speed\n${current.windMph} m/h', size: 20),
              ConditionInfo(text: 'Humidity\n${current.humidity}%', size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
