import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/domain/domain.dart';

part 'product_recommendations_state.dart';

@injectable
class ProductRecommendationsCubit extends Cubit<ProductRecommendationsState> {
  final GetProductRecommendationsUsecase _getProductRecommendationsUsecase;

  ProductRecommendationsCubit(this._getProductRecommendationsUsecase)
      : super(ProductRecommendationsInitial());

  Future<void> load() async {
    emit(ProductRecommendationsLoading());
    final result = await _getProductRecommendationsUsecase();
    if (result.isFailure) return;
    final products = result.success;
    emit(ProductRecommendationsLoaded(products: products));
  }
}
