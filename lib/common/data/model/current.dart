import '../../domain/entities/entities.dart';
import 'models.dart';

class Current {
  final double? tempC;
  final int? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;

  Current({this.tempC, this.isDay, this.condition, this.windMph, this.windKph, this.humidity, this.cloud, this.feelslikeC});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      tempC: (json['temp_c'] as num?)?.toDouble(),
      isDay: json['is_day'],
      condition: json['condition'] != null ? Condition.fromJson(json['condition']) : null,
      windMph: (json['wind_mph'] as num?)?.toDouble(),
      windKph: (json['wind_kph'] as num?)?.toDouble(),
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
    );
  }
}

extension CurrentMapper on Current {
  CurrentData toDomain() {
    return CurrentData(
        tempC: tempC,
        isDay: isDay,
        condition: condition?.toDomain(),
        windMph: windMph,
        windKph: windKph,
        humidity: humidity,
        cloud: cloud,
        feelslikeC: feelslikeC,
    );
  }
}

