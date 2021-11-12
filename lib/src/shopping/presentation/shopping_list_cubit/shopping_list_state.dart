part of 'shopping_list_cubit.dart';

abstract class ShoppingListState extends Equatable {
  const ShoppingListState();

  @override
  List<Object> get props => [];
}

class ShoppingListInitial extends ShoppingListState {}

class ShoppingListLoaded extends ShoppingListState {
  final ShoppingList shoppingList;

  ShoppingListLoaded(this.shoppingList);

  @override
  List<Object> get props => [...super.props, shoppingList];
}

class ShoppingListFailed extends ShoppingListState {
  final ApplicationFailure failure;

  ShoppingListFailed(this.failure);

  @override
  List<Object> get props => [...super.props, failure];
}
