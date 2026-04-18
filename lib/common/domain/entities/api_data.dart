import 'package:task_weather/common/domain/entities/entities.dart';

class ApiData {
  final LocationData? location;
  final CurrentData? current;

  ApiData({this.location, this.current});
}