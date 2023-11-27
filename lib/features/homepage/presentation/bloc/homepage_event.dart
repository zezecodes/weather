part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends HomepageEvent {
  final Position position;

  const FetchWeather({required this.position});

  @override
  List<Object> get props => [];
}
