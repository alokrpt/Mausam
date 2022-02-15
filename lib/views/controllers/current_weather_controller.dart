import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mausam/models/error_model.dart';
import 'package:mausam/models/location_model.dart';
import 'package:mausam/models/weather_model/weather_data.dart';
import 'package:mausam/services/location_client.dart';
import 'package:mausam/services/weather_client.dart';

class CurrentWeatherController extends StateNotifier<AsyncValue<WeatherData>> {
  CurrentWeatherController(this._weatherRepository)
      : super(const AsyncValue.loading()) {
    LocationClient().getLocation().then((value) => getWeather(value));
  }

  final AsyncValue<HttpWeatherRepository> _weatherRepository;

  Future<void> getWeather(LocationModel locationModel) async {
    try {
      state = const AsyncValue.loading();
      _weatherRepository.whenData((value) async {
        final weather = await value.getWeather(locationModel);
        state = AsyncValue.data(WeatherData.from(weather));
      });
    } on APIError catch (e) {
      state = e.asAsyncValue();
    }
  }
}

final currentWeatherControllerProvider =
    StateNotifierProvider<CurrentWeatherController, AsyncValue<WeatherData>>(
        (ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);

  return CurrentWeatherController(weatherRepository);
});
