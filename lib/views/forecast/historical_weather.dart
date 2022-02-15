import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mausam/models/historical_model/historical_data.dart';
import 'package:mausam/views/forecast/weather_icon_image.dart';

import '../controllers/historical_weather_controller.dart';

class HistoricalWeather extends ConsumerWidget {
  const HistoricalWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue = ref.watch(historicalWeatherControllerProvider);
    return forecastDataValue.when(
      data: (forecastData) {
        // API returns data points in 3-hour intervals -> 1 day = 8 intervals
        final ul = forecastData.list.length - 1;
        final items = [0, ul ~/ 3, 2 * ul ~/ 3, ul];
        return HourlyWeatherRow(
          historicalDataItems: [
            for (var i in items) forecastData.list[i],
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Text(e.toString()),
    );
  }
}

class HourlyWeatherRow extends StatelessWidget {
  const HourlyWeatherRow({Key? key, required this.historicalDataItems})
      : super(key: key);
  final List<HistoricalData> historicalDataItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: historicalDataItems
          .map((data) => HourlyWeatherItem(data: data))
          .toList(),
    );
  }
}

class HourlyWeatherItem extends ConsumerWidget {
  const HourlyWeatherItem({Key? key, required this.data}) : super(key: key);
  final HistoricalData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    final temp = data.temp.celsius.toInt().toString();
    return Expanded(
      child: Column(
        children: [
          Text(
            DateFormat.E().format(data.date) +
                "\n" +
                DateFormat.Hm().format(data.date),
            style: textTheme.caption!.copyWith(fontWeight: fontWeight),
          ),
          const SizedBox(height: 8),
          WeatherIconImage(iconUrl: data.iconUrl, size: 48),
          const SizedBox(height: 8),
          Text(
            '$temp°',
            style: textTheme.bodyText1!.copyWith(fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
