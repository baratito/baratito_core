import 'package:equatable/equatable.dart';

import 'package:baratito_core/src/shopping/application/models/purchase_list_model.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

class MonthlyPurchaseSummaryModel extends Equatable {
  final String name;
  final String abbreviation;
  final double total;
  final List<PurchaseListModel> purchases;

  MonthlyPurchaseSummaryModel({
    required this.name,
    required this.abbreviation,
    required this.total,
    required this.purchases,
  });

  @override
  MonthlyPurchaseSummary toEntity() {
    return MonthlyPurchaseSummary(
      name: name,
      abbreviation: abbreviation,
      total: total,
      purchases: purchases.map((purchase) => purchase.toEntity()).toList(),
    );
  }

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
