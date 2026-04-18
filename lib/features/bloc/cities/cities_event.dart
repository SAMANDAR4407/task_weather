part of 'cities_bloc.dart';

@immutable
sealed class CitiesEvent {}

class FetchData extends CitiesEvent {
  final String? query;
  FetchData({required this.query});
}
