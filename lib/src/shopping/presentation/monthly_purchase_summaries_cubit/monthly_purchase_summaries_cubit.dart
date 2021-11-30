import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

part 'monthly_purchase_summaries_state.dart';

@injectable
class MonthlyPurchaseSummariesCubit
    extends Cubit<MonthlyPurchaseSummariesState> {
  final GetPurchaseSummariesUsecase _getPurchaseSummariesUsecase;

  MonthlyPurchaseSummariesCubit(
    this._getPurchaseSummariesUsecase,
  ) : super(MonthlyPurchaseSummariesInitial());

  Future<void> get() async {
    emit(MonthlyPurchaseSummariesLoading());
    final result = await _getPurchaseSummariesUsecase();
    if (result.isFailure) {
      emit(MonthlyPurchaseSummariesFailure(result.failure));
      return;
    }
    emit(MonthlyPurchaseSummariesLoaded(result.success));
  }
}
