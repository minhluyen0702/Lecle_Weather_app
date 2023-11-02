part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];

  get position => null;

  String get cityName => '';


}

class FetchWeather extends WeatherEvent {
  final Position position;

  FetchWeather(this.position);

  @override
  List<Object?> get props => [position];
}

class FetchCityName extends WeatherEvent {
  final String cityName;
  FetchCityName(this.cityName);
  @override
  List<Object?> get props => [cityName];
}
