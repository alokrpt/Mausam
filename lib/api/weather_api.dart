import 'package:mausam/models/location_model.dart';

class OpenWeatherMapAPI {
  OpenWeatherMapAPI(this.apiKey);
  final String apiKey;

  static const String _apiBaseUrl = "api.openweathermap.org";
  static const String _apiPath = "/data/2.5/";

  Uri weather(LocationModel _locationModel) => _buildUri(
    endpoint: "weather",
    parametersBuilder: () => queryParameters(_locationModel),
  );

  Uri forecast(LocationModel _locationModel) => _buildUri(
    endpoint: "forecast",
    parametersBuilder: () => queryParameters(_locationModel),
  );
  Uri historical(LocationModel _locationModel,DateTime _dt) => _buildUri(
    endpoint: "onecall/timemachine",
    parametersBuilder: () => dtQueryParameters(_locationModel,_dt),
  );
  Uri getMapUri(int zoom, int x, int y,String mapType) => Uri.https("tile.openweathermap.org", "/map/$mapType/$zoom/$x/$y.png",{'appid': apiKey});

  Uri _buildUri({
    required String endpoint,
    required Map<String, dynamic> Function() parametersBuilder,
  }) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoint",
      queryParameters: parametersBuilder(),
    );
  }

  Map<String, dynamic> queryParameters(LocationModel _locationModel) => {
    "lat": _locationModel.lat.toString(),
    "lon": _locationModel.lon.toString(),
    "appid": apiKey,
    "units": "metric",
  };
  Map<String, dynamic> dtQueryParameters(LocationModel _locationModel,DateTime _dt) => {
    "lat": _locationModel.lat.toString(),
    "lon": _locationModel.lon.toString(),
    "dt": (_dt.millisecondsSinceEpoch~/1000).toString(),
    "appid": apiKey,
    "units": "metric",
  };
}