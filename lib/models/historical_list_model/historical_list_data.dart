

import 'package:mausam/models/historical_list_model/historical_list_model.dart';
import 'package:mausam/models/historical_model/historical_data.dart';

class HistoricalListData {
  const HistoricalListData(this.list);
  factory HistoricalListData.from(HistoricalList historicalList) {
    return HistoricalListData(
      historicalList.hourly.map((item) => HistoricalData.from(item)).toList(),
    );
  }
  final List<HistoricalData> list;
}