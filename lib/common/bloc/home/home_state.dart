part of 'home_bloc.dart';

@immutable
class HomeState {
  String? latLong = '';
  HomeState({this.latLong});
  HomeState copyWith({String? latLong}) => HomeState(latLong: latLong ?? this.latLong);
}