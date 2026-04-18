import '../../domain/entities/entities.dart';
import 'models.dart';

class ApiResponse {
  final Location? location;
  final Current? current;

  ApiResponse({this.location, this.current});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      location: json['location'] != null ? Location.fromJson(json['location']) : null,
      current: json['current'] != null ? Current.fromJson(json['current']) : null,
    );
  }
}

extension ApiResponseMapper on ApiResponse {
  ApiData toDomain() {
    return ApiData(
      location: location?.toDomain(),
      current: current?.toDomain(),
    );
  }
}

