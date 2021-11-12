part of 'purchase_cubit.dart';

abstract class PurchaseState extends Equatable {
  const PurchaseState();

  @override
  List<Object> get props => [];
}

class PurchaseInitial extends PurchaseState {}

abstract class PurchaseSettingsData extends PurchaseState {
  final ShoppingList shoppingList;
  final PurchaseSettings purchaseSettings;

  PurchaseSettingsData(this.shoppingList, this.purchaseSettings);

  @override
  List<Object> get props => [shoppingList, purchaseSettings];
}

class PurchaseSettingsLoaded extends PurchaseSettingsData {
  PurchaseSettingsLoaded(
    ShoppingList shoppingList,
    PurchaseSettings purchaseSettings,
  ) : super(shoppingList, purchaseSettings);
}

class PurchaseLoaded extends PurchaseSettingsData {
  final PurchaseList purchaseList;

  PurchaseLoaded(
    this.purchaseList,
    ShoppingList shoppingList,
    PurchaseSettings purchaseSettings,
  ) : super(shoppingList, purchaseSettings);

  @override
  List<Object> get props => [purchaseList, shoppingList, purchaseSettings];
}

class PurchaseFailed extends PurchaseState {
  final ApplicationFailure failure;
  PurchaseFailed(this.failure);
}
