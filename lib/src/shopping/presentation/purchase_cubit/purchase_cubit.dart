import 'package:baratito_core/src/shared/shared.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:injectable/injectable.dart';

part 'purchase_state.dart';

@injectable
class PurchaseCubit extends Cubit<PurchaseState> {
  final StartPurchaseUsecase _startPurchaseUsecase;
  final CompletePurchaseUsecase _completePurchaseUsecase;

  PurchaseCubit(
    this._startPurchaseUsecase,
    this._completePurchaseUsecase,
  ) : super(PurchaseInitial());

  void load({required ShoppingList shoppingList}) {
    final defaultSettings = PurchaseSettings(
      maxMarketCount: 1,
      maxMarketDistance: MarketDistance.lessThanOneKilometer,
      mobilityMode: MobilityMode.driving,
    );

    emit(PurchaseSettingsLoaded(shoppingList, defaultSettings));
  }

  void updateSettings({
    int? maxMarketCount,
    MarketDistance? maxMarketDistance,
    MobilityMode? mobilityMode,
  }) {
    if (state is! PurchaseSettingsData) return;
    final _state = state as PurchaseSettingsData;
    final shoppingList = _state.shoppingList;
    final currentSettings = _state.purchaseSettings;
    final updatedSettings = currentSettings.copyWith(
      maxMarketCount: maxMarketCount,
      maxMarketDistance: maxMarketDistance,
      mobilityMode: mobilityMode,
    );
    emit(PurchaseSettingsLoaded(shoppingList, updatedSettings));
  }

  Future<void> startPurchase() async {
    if (state is! PurchaseSettingsData) return;
    final _state = state as PurchaseSettingsData;
    final shoppingList = _state.shoppingList;
    final currentSettings = _state.purchaseSettings;
    final result = await _startPurchaseUsecase(
      shoppingList: shoppingList,
      purchaseSettings: currentSettings,
    );
    if (result.isFailure) {
      emit(PurchaseFailed(result.failure));
      emit(_state);
      return;
    }
    final purchaseList = result.success;
    emit(PurchaseLoaded(purchaseList, shoppingList, currentSettings));
  }

  Future<void> completePurchase() async {
    if (state is! PurchaseLoaded) return;
    final _state = state as PurchaseLoaded;
    final purchaseList = _state.purchaseList;
    final shoppingList = _state.shoppingList;
    final currentSettings = _state.purchaseSettings;
    emit(PurchaseCompleting(purchaseList, shoppingList, currentSettings));
    final result = await _completePurchaseUsecase(purchaseList: purchaseList);
    if (result.isFailure) {
      emit(PurchaseFailed(result.failure));
      emit(_state);
      return;
    }
    emit(PurchaseCompleted(purchaseList, shoppingList, currentSettings));
  }
}
