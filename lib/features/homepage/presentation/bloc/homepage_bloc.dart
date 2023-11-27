import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../../data/datasources/keys.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(HomepageLoading());
      try {
        WeatherFactory weatherData =
            WeatherFactory(Keys.apiKey, language: Language.ENGLISH);
        Weather weather = await weatherData.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(HomepageSuccess(weather));
      } catch (e) {
        emit(HomepageFailure());
      }
    });
  }
}
