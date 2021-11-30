import 'package:equatable/equatable.dart';

import 'package:baratito_core/src/shopping/domain/purchase_list.dart';

class MonthlyPurchaseSummary extends Equatable {
  final String name;
  final String abbreviation;
  final double total;
  final List<PurchaseList> purchases;

  MonthlyPurchaseSummary({
    required this.name,
    required this.abbreviation,
    required this.total,
    required this.purchases,
  });

  @override
  List<Object?> get props {
    return [
      name,
      abbreviation,
      total,
      purchases,
    ];
  }
}
