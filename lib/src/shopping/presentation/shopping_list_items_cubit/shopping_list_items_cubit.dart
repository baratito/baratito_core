import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:optional/optional.dart';

import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';
import 'package:baratito_core/src/market/market.dart';
import 'package:baratito_core/src/shared/shared.dart';

part 'shopping_list_items_state.dart';

@injectable
class ShoppingListItemsCubit extends Cubit<ShoppingListItemsState> {
  final GetShoppingListItemsUsecase _getShoppingListItemsUsecase;
  final UpdateShoppingListItemsUsecase _updateShoppingListItemsUsecase;

  ShoppingListItemsCubit(
    this._getShoppingListItemsUsecase,
    this._updateShoppingListItemsUsecase,
  ) : super(ShoppingListItemsInitial());

  Future<void> load({required ShoppingList shoppingList}) async {
    emit(ShoppingListItemsLoading());
    final result = await _getShoppingListItemsUsecase(
      shoppingList: shoppingList,
    );
    if (result.isFailure) {
      emit(ShoppingListItemsFailed(result.failure));
      return;
    }
    final items = result.success;
    emit(ShoppingListItemsLoaded(shoppingList, items));
  }

  Future<void> addProduct({required Product product}) async {
    if (state is! ShoppingListItemsData) return;
    if (state is ShoppingListItemsAddingProduct) return;
    final _state = state as ShoppingListItemsData;
    final currentItems = _state.items;
    final shoppingList = _state.shoppingList;
    if (_productExistsInItems(currentItems, product)) return;
    emit(ShoppingListItemsAddingProduct(shoppingList, currentItems));
    final newItems = _appendProductToItems(currentItems, product);
    final result = await _updateShoppingListItemsUsecase(
      shoppingList: shoppingList,
      shoppingListItems: newItems,
    );
    if (result.isFailure) {
      emit(ShoppingListItemsFailed(result.failure));
      emit(_state);
      return;
    }
    final updatedItems = result.success;
    emit(ShoppingListItemsLoaded(shoppingList, updatedItems));
  }

  Future<void> updateItemQuantity({
    required ShoppingListItem item,
    required int quantity,
  }) async {
    if (state is! ShoppingListItemsData) return;
    if (state is ShoppingListItemsAddingProduct) return;
    final _state = state as ShoppingListItemsData;
    final currentItems = _state.items;
    final shoppingList = _state.shoppingList;
    final optimisticallyUpdatedItems = _updateItemQuantity(
      currentItems,
      item,
      quantity,
    );
    emit(ShoppingListItemsLoaded(shoppingList, optimisticallyUpdatedItems));

    final result = await _updateShoppingListItemsUsecase(
      shoppingList: shoppingList,
      shoppingListItems: optimisticallyUpdatedItems,
    );
    if (result.isFailure) {
      emit(ShoppingListItemsFailed(result.failure));
      emit(_state);
    }
  }

  bool _productExistsInItems(List<ShoppingListItem> items, Product product) {
    return items.where((item) => item.product.id == product.id).isNotEmpty;
  }

  List<ShoppingListItem> _appendProductToItems(
    List<ShoppingListItem> items,
    Product product,
  ) {
    final newItem = ShoppingListItem(
      id: Optional.empty(),
      product: product,
      quantity: 1,
    );
    return [...items, newItem];
  }

  List<ShoppingListItem> _updateItemQuantity(
    List<ShoppingListItem> items,
    ShoppingListItem targetItem,
    int newQuantity,
  ) {
    final newItems = items.map((item) {
      if (item == targetItem) return item.changeQuantity(newQuantity);
      return item;
    });
    final zeroesRemoved = newItems.where((item) => item.quantity > 0);
    return zeroesRemoved.toList();
  }
}
