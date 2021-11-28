import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

part 'shopping_lists_state.dart';

@injectable
class ShoppingListsCubit extends Cubit<ShoppingListsState> {
  final GetShoppingListsUsecase _getShoppingListsUsecase;
  final CreateShoppingListUsecase _createShoppingListUsecase;
  final DeleteShoppingListUsecase _deleteShoppingListUsecase;

  ShoppingListsCubit(
    this._getShoppingListsUsecase,
    this._createShoppingListUsecase,
    this._deleteShoppingListUsecase,
  ) : super(ShoppingListsInitial());

  Future<void> get() async {
    emit(ShoppingListsLoading());
    final result = await _getShoppingListsUsecase();
    if (result.isFailure) {
      emit(ShoppingListsFailed(result.failure));
      emit(ShoppingListsLoadRetry());
      return;
    }
    final shoppingLists = result.success;
    if (shoppingLists.isEmpty) {
      emit(ShoppingListsEmpty());
      return;
    }
    emit(ShoppingListsLoaded(shoppingLists));
  }

  Future<void> create() async {
    if (state is! ShoppingListsData) return;
    if (state is ShoppingListsCreating) return;
    final fallback = state;
    emit(ShoppingListsCreating((state as ShoppingListsData).shoppingLists));
    // TODO: localize this somehow
    final result = await _createShoppingListUsecase(name: 'Nueva lista');
    if (result.isFailure) {
      emit(ShoppingListsFailed(result.failure));
      emit(fallback);
      return;
    }
    final addedShoppingList = result.success;
    final shoppingLists = _appendToCurrentLists(addedShoppingList);
    emit(ShoppingListsCreated(shoppingLists, addedShoppingList));
  }

  Future<void> delete({required ShoppingList shoppingList}) async {
    if (state is! ShoppingListsData) return;
    if (state is ShoppingListsCreating) return;
    final fallback = state;
    final shoppingLists = _deleteFromCurrentLists(shoppingList);
    if (shoppingLists.isEmpty) {
      emit(ShoppingListsEmpty());
    } else {
      emit(ShoppingListsLoaded(shoppingLists));
    }
    final result = await _deleteShoppingListUsecase(shoppingList: shoppingList);
    if (result.isFailure) {
      emit(ShoppingListsFailed(result.failure));
      emit(fallback);
      return;
    }
  }

  Future<void> replace({required ShoppingList shoppingList}) async {
    if (state is! ShoppingListsData) return;
    if (state is ShoppingListsCreating) return;
    final shoppingLists = _replaceFromCurrentLists(shoppingList);
    emit(ShoppingListsLoaded(shoppingLists));
  }

  List<ShoppingList> _appendToCurrentLists(ShoppingList shoppingList) {
    final currentLists = (state as ShoppingListsData).shoppingLists;
    return [...currentLists, shoppingList];
  }

  List<ShoppingList> _deleteFromCurrentLists(ShoppingList shoppingList) {
    final currentLists = (state as ShoppingListsData).shoppingLists;
    final updatedLists = List<ShoppingList>.from(currentLists)
      ..remove(shoppingList);
    return updatedLists;
  }

  List<ShoppingList> _replaceFromCurrentLists(ShoppingList shoppingList) {
    final currentLists = (state as ShoppingListsData).shoppingLists;
    final updatedLists = currentLists.map((list) {
      if (list.id == shoppingList.id) return shoppingList;
      return list;
    }).toList();
    return updatedLists;
  }
}
