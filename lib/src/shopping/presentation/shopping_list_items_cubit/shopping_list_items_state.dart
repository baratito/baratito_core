part of 'shopping_list_items_cubit.dart';

abstract class ShoppingListItemsState extends Equatable {
  const ShoppingListItemsState();

  @override
  List<Object> get props => [];
}

class ShoppingListItemsInitial extends ShoppingListItemsState {}

class ShoppingListItemsLoading extends ShoppingListItemsState {}

abstract class ShoppingListItemsData extends ShoppingListItemsState {
  final ShoppingList shoppingList;
  final List<ShoppingListItem> items;

  const ShoppingListItemsData(this.shoppingList, this.items);

  @override
  List<Object> get props => [...super.props, items];
}

class ShoppingListItemsLoaded extends ShoppingListItemsData {
  const ShoppingListItemsLoaded(
    ShoppingList shoppingList,
    List<ShoppingListItem> items,
  ) : super(shoppingList, items);
}

class ShoppingListItemsAddingProduct extends ShoppingListItemsData {
  const ShoppingListItemsAddingProduct(
    ShoppingList shoppingList,
    List<ShoppingListItem> items,
  ) : super(shoppingList, items);
}

class ShoppingListItemsFailed extends ShoppingListItemsState {
  final ApplicationFailure failure;

  ShoppingListItemsFailed(this.failure);

  @override
  List<Object> get props => [...super.props, failure];
}
