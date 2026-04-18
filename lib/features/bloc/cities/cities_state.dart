part of 'cities_bloc.dart';

class CitiesState {
  String? lat = '';
  String? lon = '';
  EnumStatus status;
  ApiData? data;

  CitiesState({this.lat, this.lon, this.status = EnumStatus.initial, this.data});

  CitiesState copyWith({String? lat, String? lon, EnumStatus? status, ApiData? data}) =>
      CitiesState(lat: lat ?? this.lat, lon: lon ?? this.lon, status: status ?? this.status, data: data ?? this.data);
}