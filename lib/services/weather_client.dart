import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mausam/api/api_keys.dart';
import 'package:mausam/api/weather_api.dart';
import 'package:mausam/models/error_model.dart';
import 'package:mausam/models/forecast_model/forecast_model.dart';
import 'package:mausam/models/historical_list_model/historical_list_model.dart';
import 'package:mausam/models/location_model.dart';
import 'package:mausam/models/weather_model/weather_model.dart';
import 'package:mausam/services/location_client.dart';

import '../models/historical_model/historical_model.dart';

class HttpWeatherRepository {
  HttpWeatherRepository({required this.api, required this.client});
  final OpenWeatherMapAPI api;
  final http.Client client;
/*static LocationClient locationClient=LocationClient();
  LocationModel? getL(){
    LocationModel? lm;
   Provider((ref)  {
      // use ref to obtain other providers
       ref.read(locationClientProvider).when(data: (data) => lm=data, error: (_,_a){debugPrint('error');}, loading: (){ref.refresh(locationClientProvider);debugPrint('loading');});

    });
   return lm;
  }*/
  Future<Forecast> getForecast(LocationModel locationModel)  {

    // LocationModel locationModel=   locationClient.lm;

    return _getData(
  uri: api.forecast(locationModel),
  builder: (data) => Forecast.fromJson(data),
  );
}
Future<HistoricalList> getHistorical(LocationModel locationModel,DateTime dt)  {

    // LocationModel locationModel=   locationClient.lm;

    return _getData(
  uri: api.historical(locationModel,dt),
  builder: (data) => HistoricalList.fromJson(data),
  );
}

  Future<Weather> getWeather(LocationModel locationModel)  {
// =  locationClient.lm;
 return  _getData(
  uri: api.weather(locationModel),
  builder: (data) => Weather.fromJson(data),
  );
}

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      debugPrint('Get: '+uri.toString());
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw const APIError.invalidApiKey();
        default:
          throw const APIError.unknown();
      }
    } on SocketException catch (_) {
      throw const APIError.noInternetConnection();
    }
  }
}

/// Providers used by rest of the app
//* Repo Provider Defined Globally
final weatherRepositoryProvider = FutureProvider<HttpWeatherRepository>((ref) {
  final apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: APIKeys.weatherKey,
  );
  return HttpWeatherRepository(
    api: OpenWeatherMapAPI(apiKey),
    client: http.Client(),
  );
});