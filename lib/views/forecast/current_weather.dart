import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mausam/models/weather_model/weather_data.dart';
import 'package:mausam/services/location_client.dart';
import 'package:mausam/views/controllers/current_weather_controller.dart';
import 'package:mausam/views/forecast/weather_icon_image.dart';

class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationDataValue = ref.watch(locationClientProvider);
    var weatherDataValue = ref.watch(currentWeatherControllerProvider);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
            "current Lat: ${tempLm.lat != 0 ? tempLm.lat : '...'}, Lon: ${tempLm.lon != 0 ? tempLm.lon : '...'}"
                .toString(),
            style: textTheme.bodyMedium),
        weatherDataValue.when(
          data: (weatherData) => CurrentWeatherContents(data: weatherData),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, __) => Text(e.toString()),
        ),
      ],
    );
  }
}

class CurrentWeatherContents extends ConsumerWidget {
  const CurrentWeatherContents({Key? key, required this.data})
      : super(key: key);
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final temp = data.temp.celsius.toInt().toString() + '°';
    final minTemp = data.minTemp.celsius.toInt().toString();
    final maxTemp = data.maxTemp.celsius.toInt().toString();
    final highAndLow = '🔼 $maxTemp°  🔽 $minTemp°';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconImage(iconUrl: data.iconUrl, size: 120),
        Text(temp, style: textTheme.headline2),
        Text(highAndLow, style: textTheme.bodyText2),
      ],
    );
  }
}
