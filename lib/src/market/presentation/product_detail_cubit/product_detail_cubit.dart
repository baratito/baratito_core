import 'package:baratito_core/src/market/application/application.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

part 'product_detail_state.dart';

@injectable
class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductPricesUsecase _getProductPricesUsecase;

  ProductDetailCubit(this._getProductPricesUsecase)
      : super(ProductDetailInitial());

  Future<void> load({required Product product}) async {
    emit(ProductDetailLoading(product: product));
    final result = await _getProductPricesUsecase(product: product);
    if (result.isFailure) {
      final failure = result.failure;
      emit(ProductDetailLoadFailed(
        product: product,
        failure: failure,
      ));
      return;
    }
    final prices = result.success;
    emit(ProductDetailLoadSucceded(product: product, prices: prices));
  }
}
