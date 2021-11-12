part of 'shopping_lists_cubit.dart';

abstract class ShoppingListsState extends Equatable {
  const ShoppingListsState();

  @override
  List<Object> get props => [];
}

class ShoppingListsInitial extends ShoppingListsState {
  const ShoppingListsInitial();
}

class ShoppingListsLoading extends ShoppingListsState {
  const ShoppingListsLoading();
}

class ShoppingListsLoadRetry extends ShoppingListsState {
  const ShoppingListsLoadRetry();
}

abstract class ShoppingListsData extends ShoppingListsState {
  final List<ShoppingList> shoppingLists;

  const ShoppingListsData(this.shoppingLists);

  @override
  List<Object> get props => [...super.props, shoppingLists];
}

class ShoppingListsEmpty extends ShoppingListsData {
  const ShoppingListsEmpty() : super(const []);
}

class ShoppingListsLoaded extends ShoppingListsData {
  const ShoppingListsLoaded(List<ShoppingList> shoppingLists)
      : super(shoppingLists);
}

class ShoppingListsCreating extends ShoppingListsData {
  const ShoppingListsCreating(List<ShoppingList> shoppingLists)
      : super(shoppingLists);
}

class ShoppingListsCreated extends ShoppingListsData {
  final ShoppingList createdShoppingList;

  const ShoppingListsCreated(
    List<ShoppingList> shoppingLists,
    this.createdShoppingList,
  ) : super(shoppingLists);

  @override
  List<Object> get props => [...super.props, createdShoppingList];
}

class ShoppingListsFailed extends ShoppingListsState {
  final ApplicationFailure failure;

  const ShoppingListsFailed(this.failure);

  @override
  List<Object> get props => [...super.props, failure];
}
