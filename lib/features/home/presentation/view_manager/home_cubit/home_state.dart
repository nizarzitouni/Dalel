part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class GetHistoricalPeridosLoadingState extends HomeState {}

class GetHistoricalPeridosSuccessState extends HomeState {}

class GetHistoricalPeridosFailureState extends HomeState {
  final String errorMessage;
  GetHistoricalPeridosFailureState({required this.errorMessage});
}
