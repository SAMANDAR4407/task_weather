part of 'home_bloc.dart';

class HomeState {
  String? lat = '';
  String? lon = '';
  EnumStatus status;
  ApiData? data;

  HomeState({this.lat, this.lon, this.status = EnumStatus.initial, this.data});

  HomeState copyWith({String? lat, String? lon, EnumStatus? status, ApiData? data}) =>
      HomeState(lat: lat ?? this.lat, lon: lon ?? this.lon, status: status ?? this.status, data: data ?? this.data);
}

