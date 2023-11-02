import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../../data/keys/my_keys.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory weatherFactory =
            WeatherFactory(API_KEY_openweathermap, language: Language.ENGLISH);
        Weather weather = event.cityName.isEmpty
            ? await weatherFactory.currentWeatherByLocation(
                event.position.latitude, event.position.longitude)
            : await weatherFactory.currentWeatherByCityName(event.cityName);
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        log(e.toString());
        emit(WeatherFailure());
      }
    });
  }
}
