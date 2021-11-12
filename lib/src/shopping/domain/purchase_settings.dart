import 'package:baratito_core/baratito_core.dart';

enum MarketDistance {
  lessThanOneKilometer,
  lessThanFiveKilometer,
  lessThanTenKilometer,
}

enum MobilityMode {
  driving,
  walking,
  bicycle,
}

class PurchaseSettings extends Equatable {
  final int maxMarketCount;
  final MarketDistance maxMarketDistance;
  final MobilityMode mobilityMode;

  PurchaseSettings({
    required this.maxMarketCount,
    required this.maxMarketDistance,
    required this.mobilityMode,
  });

  PurchaseSettings copyWith({
    int? maxMarketCount,
    MarketDistance? maxMarketDistance,
    MobilityMode? mobilityMode,
  }) {
    return PurchaseSettings(
      maxMarketCount: maxMarketCount ?? this.maxMarketCount,
      maxMarketDistance: maxMarketDistance ?? this.maxMarketDistance,
      mobilityMode: mobilityMode ?? this.mobilityMode,
    );
  }

  PurchaseSettings updateMaxMarketCount(int count) {
    return copyWith(maxMarketCount: count);
  }

  PurchaseSettings updateMaxMarketDistance(MarketDistance marketDistance) {
    return copyWith(maxMarketDistance: marketDistance);
  }

  PurchaseSettings updateMobilityMode(MobilityMode mode) {
    return copyWith(mobilityMode: mode);
  }

  @override
  List<Object?> get props {
    return [
      maxMarketCount,
      maxMarketDistance,
      mobilityMode,
    ];
  }
}
