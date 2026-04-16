part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchData extends HomeEvent {
  final String latLong;
  FetchData({required this.latLong});
}