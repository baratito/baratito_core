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

abstract class PurchaseData extends PurchaseSettingsData {
  final PurchaseList purchaseList;

  PurchaseData(
    this.purchaseList,
    ShoppingList shoppingList,
    PurchaseSettings purchaseSettings,
  ) : super(shoppingList, purchaseSettings);

  @override
  List<Object> get props => [...super.props, purchaseList];
}

class PurchaseLoaded extends PurchaseData {
  PurchaseLoaded(
    PurchaseList purchaseList,
    ShoppingList shoppingList,
    PurchaseSettings purchaseSettings,
  ) : super(purchaseList, shoppingList, purchaseSettings);
}

class PurchaseCompleting extends PurchaseData {
  PurchaseCompleting(
    PurchaseList purchaseList,
    ShoppingList shoppingList,
    PurchaseSettings purchaseSettings,
  ) : super(purchaseList, shoppingList, purchaseSettings);
}

class PurchaseCompleted extends PurchaseData {
  PurchaseCompleted(
    PurchaseList purchaseList,
    ShoppingList shoppingList,
    PurchaseSettings purchaseSettings,
  ) : super(purchaseList, shoppingList, purchaseSettings);
}

class PurchaseFailed extends PurchaseState {
  final ApplicationFailure failure;
  PurchaseFailed(this.failure);
}
