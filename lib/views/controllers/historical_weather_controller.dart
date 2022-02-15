import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mausam/models/error_model.dart';
import 'package:mausam/models/historical_list_model/historical_list_data.dart';

import '../../models/location_model.dart';
import '../../services/location_client.dart';
import '../../services/weather_client.dart';

class HistoricalWeatherController
    extends StateNotifier<AsyncValue<HistoricalListData>> {
  HistoricalWeatherController(
      this._weatherRepository, this.asyncLocationModelValue)
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
        final hist = await value.getHistorical(locationModel, DateTime.now());
        state = AsyncValue.data(HistoricalListData.from(hist));
      });
    } on APIError catch (e) {
      state = e.asAsyncValue();
    }
  }
}

//* state notifier provider of HourlyWeatherController
final historicalWeatherControllerProvider = StateNotifierProvider<
    HistoricalWeatherController, AsyncValue<HistoricalListData>>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  var v = ref.watch(
      locationClientProvider); //whenData((value) => ref.refresh(weatherRepositoryProvider));
  return HistoricalWeatherController(weatherRepository, v);
});
