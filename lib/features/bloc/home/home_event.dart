part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchData extends HomeEvent {
  final String? query;
  FetchData({required this.query});
}