part of 'product_recommendations_cubit.dart';

abstract class ProductRecommendationsState extends Equatable {
  const ProductRecommendationsState();

  @override
  List<Object> get props => [];
}

class ProductRecommendationsInitial extends ProductRecommendationsState {
  const ProductRecommendationsInitial();
}

class ProductRecommendationsData extends ProductRecommendationsState {
  final List<Product> products;

  const ProductRecommendationsData(this.products);

  @override
  List<Object> get props => [...super.props, products];
}

class ProductRecommendationsLoading extends ProductRecommendationsState {
  const ProductRecommendationsLoading();
}

class ProductRecommendationsLoaded extends ProductRecommendationsData {
  const ProductRecommendationsLoaded({required List<Product> products})
      : super(products);
}
