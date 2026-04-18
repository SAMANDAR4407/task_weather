import 'entities.dart';

class CurrentData {
  final double? tempC;
  final int? isDay;
  final ConditionData? condition;
  final double? windMph;
  final double? windKph;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;

  CurrentData({this.tempC, this.isDay, this.condition, this.windMph, this.windKph, this.humidity, this.cloud, this.feelslikeC});
}