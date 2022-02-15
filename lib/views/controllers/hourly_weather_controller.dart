import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mausam/models/error_model.dart';
import 'package:mausam/models/forecast_model/forecast_data.dart';
import 'package:mausam/models/location_model.dart';
import 'package:mausam/services/location_client.dart';
import 'package:mausam/services/weather_client.dart';

//* state notifier of Async ForecastData
class HourlyWeatherController extends StateNotifier<AsyncValue<ForecastData>> {
  HourlyWeatherController(this._weatherRepository, this.asyncLocationModelValue)
      : super(const AsyncValue.loading()) {
    // getWeather();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        getWeather(tempLm);
      },
    );
  }

  final AsyncValue<HttpWeatherRepository> _weatherRepository;
  final AsyncValue<LocationModel> asyncLocationModelValue;

  Future<void> getWeather(LocationModel locationModel) async {
    try {
      state = const AsyncValue.loading();
      _weatherRepository.whenData((value) async {
        final forecast = await value.getForecast(locationModel);
        state = AsyncValue.data(ForecastData.from(forecast));
      });
    } on APIError catch (e) {
      state = e.asAsyncValue();
    }
  }
}

//* state notifier provider of HourlyWeatherController
final hourlyWeatherControllerProvider =
    StateNotifierProvider<HourlyWeatherController, AsyncValue<ForecastData>>(
        (ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  var v = ref.watch(
      locationClientProvider); //whenData((value) => ref.refresh(weatherRepositoryProvider));
  return HourlyWeatherController(weatherRepository, v);
});
