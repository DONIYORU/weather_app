part of 'weather_bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBLocInitial extends WeatherBlocState{}

final class WeatherBLocLoading extends WeatherBlocState{}
final class WeatherBLocFailure extends WeatherBlocState{}
final class WeatherBLocSuccess extends WeatherBlocState{
  final Weather weather;

  const WeatherBLocSuccess(this.weather);


  @override
  List<Object> get props => [weather];
}


