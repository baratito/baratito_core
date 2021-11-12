import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shopping/domain/domain.dart';

@lazySingleton
class PurchaseSettingsSerializer {
  Map<String, dynamic> toMap(PurchaseSettings purchaseSettings) {
    return {
      'max_market_count': purchaseSettings.maxMarketCount,
      'max_market_distance': _distanceToInt(purchaseSettings.maxMarketDistance),
      'mode': purchaseSettings.mobilityMode.toString().split('.').last,
    };
  }

  int _distanceToInt(MarketDistance distance) {
    switch (distance) {
      case MarketDistance.lessThanOneKilometer:
        return 1;
      case MarketDistance.lessThanFiveKilometer:
        return 5;
      case MarketDistance.lessThanTenKilometer:
        return 10;
    }
  }
}
