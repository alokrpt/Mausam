import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mausam/api/weather_api.dart';

import '../api/api_keys.dart';

class TestTileProvider implements TileProvider {
  static const int TILE_SIZE = 256;
  Tile transparentTile = Tile(0, 0, Uint8List.fromList([1]));

  final String mapType;

  TestTileProvider({this.mapType = "temp_new"});

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    // `domain` is an object in which are stored the kml datas fetched before
    zoom = zoom ?? 3;
    if (zoom >= 3 && zoom <= 20) {
      final uri =
          OpenWeatherMapAPI(APIKeys.weatherKey).getMapUri(zoom, x, y, mapType);
      try {
        final ByteData imageData = await NetworkAssetBundle(uri).load("");
        final Uint8List bytes = imageData.buffer.asUint8List();
        return Tile(TILE_SIZE, TILE_SIZE, bytes);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    // return transparent tile
    return transparentTile;
  }

  LatLng reverseMercatorFromTileCoordinates(int x, int y, int zoom) {
    // Reverse mercator projection.
    // Reverse of above function (kept for readibility)
    //
    // 1) Compute longitude
    //
    // TILE_SIZE * (0.5 + latLng.longitude / 360) = x
    //0.5 + latLng.longitude / 360 = x / TILE_SIZE
    // latLng.longitude / 360 = x / TILE_SIZE - 0.5
    // latLng.longitude = (x / TILE_SIZE - 0.5) *360

    int pixelCoordinateX = x * TILE_SIZE;
    int pixelCoordinateY = y * TILE_SIZE;

    double worldCoordinateX = pixelCoordinateX / math.pow(2, zoom);
    double worldCoordinateY = pixelCoordinateY / math.pow(2, zoom);

    double long = (worldCoordinateX / TILE_SIZE - 0.5) * 360;

    //
    // 2) compute sin(y)
    //
    // TILE_SIZE * (0.5 - math.log((1 + siny) / (1 - siny)) / (4 * math.pi)) = y
    // 0.5 - math.log((1 + siny) / (1 - siny)) / (4 * math.pi) = y / TILE_SIZE
    // math.log((1 + siny) / (1 - siny)) / (4 * math.pi) = -(y / TILE_SIZE) + 0.5
    // math.log((1 + siny) / (1 - siny)) = (-(y / TILE_SIZE) + 0.5)(4 * math.pi)
    // (1 + siny) / (1 - siny) = math.pow(math.e, (-(y / TILE_SIZE) + 0.5)(4 * math.pi))
    // siny = (math.pow(math.e, (-(y / TILE_SIZE) + 0.5)(4 * math.pi)) - 1) / (1+math.pow(math.e, (-(y / TILE_SIZE) + 0.5)(4 * math.pi)));
    num part = math.pow(
        math.e, ((-(worldCoordinateY / TILE_SIZE) + 0.5) * (4 * math.pi)));
    double siny = (part - 1) / (1 + part);
    //
    // 3) Compute latitude
    //
    // siny = math.sin((latLng.latitude * math.pi) / 180)
    // math.asin(siny) = (latLng.latitude * math.pi) / 180
    // math.asin(siny) * 180 = (latLng.latitude * math.pi)
    // (math.asin(siny) * 180) / math.pi = latLng.latitude
    double lat = (math.asin(siny) * 180) / math.pi;
    return LatLng(lat, long);
  }
}
