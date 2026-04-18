import '../../domain/entities/entities.dart';

class Location {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;

  Location({this.name, this.region, this.country, this.lat, this.lon});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );
  }
}

extension LocationMapper on Location {
  LocationData toDomain() {
    return LocationData(
        name: name,
        region: region,
        country: country,
        lat: lat,
        lon: lon,
    );
  }
}

