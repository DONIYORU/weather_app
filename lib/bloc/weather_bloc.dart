import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherBLocInitial()) {
    on<FetchWeather>((event, emit) async{
      emit(WeatherBLocLoading());
      try {
        WeatherFactory wf = WeatherFactory(dotenv.env['API_KEY']!, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude,
            event.position.longitude
        );
        print(weather);
        emit(WeatherBLocSuccess(weather));
      }catch (e){
        emit(WeatherBLocFailure());
      }
    });
  }
}
