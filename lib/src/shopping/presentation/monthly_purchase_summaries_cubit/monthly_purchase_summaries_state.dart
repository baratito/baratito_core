part of 'monthly_purchase_summaries_cubit.dart';

abstract class MonthlyPurchaseSummariesState extends Equatable {
  const MonthlyPurchaseSummariesState();

  @override
  List<Object> get props => [];
}

class MonthlyPurchaseSummariesInitial extends MonthlyPurchaseSummariesState {
  const MonthlyPurchaseSummariesInitial();
}

class MonthlyPurchaseSummariesLoading extends MonthlyPurchaseSummariesState {
  const MonthlyPurchaseSummariesLoading();
}

class MonthlyPurchaseSummariesLoaded extends MonthlyPurchaseSummariesState {
  final List<MonthlyPurchaseSummary> summaries;
  const MonthlyPurchaseSummariesLoaded(this.summaries);
}

class MonthlyPurchaseSummariesFailure extends MonthlyPurchaseSummariesState {
  final ApplicationFailure failure;

  const MonthlyPurchaseSummariesFailure(this.failure);
}
