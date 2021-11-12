import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/application.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

part 'shopping_list_state.dart';

@injectable
class ShoppingListCubit extends Cubit<ShoppingListState> {
  final UpdateShoppingListNameUsecase _updateShoppingListNameUsecase;

  ShoppingListCubit(this._updateShoppingListNameUsecase)
      : super(ShoppingListInitial());

  void load({required ShoppingList shoppingList}) {
    emit(ShoppingListLoaded(shoppingList));
  }

  Future<void> rename({required String name}) async {
    if (state is! ShoppingListLoaded) return;
    final _state = state as ShoppingListLoaded;
    final optimisticallyUpdatedShoppingList = _state.shoppingList.rename(name);
    emit(ShoppingListLoaded(optimisticallyUpdatedShoppingList));
    final result = await _updateShoppingListNameUsecase(
      shoppingList: _state.shoppingList,
      name: name,
    );
    if (result.isFailure) {
      emit(ShoppingListFailed(result.failure));
      emit(_state);
    }
  }
}
