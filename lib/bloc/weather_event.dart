part of 'weather_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class FetchWeather extends WeatherBlocEvent{
    final Position position;

    const FetchWeather(this.position);
}