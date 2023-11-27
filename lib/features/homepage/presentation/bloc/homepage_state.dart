part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();

  @override
  List<Object> get props => [];
}

class HomepageInitial extends HomepageState {}

class HomepageLoading extends HomepageState {}

class HomepageFailure extends HomepageState {}

class HomepageSuccess extends HomepageState {
  final Weather weather;

  const HomepageSuccess(this.weather);
}
