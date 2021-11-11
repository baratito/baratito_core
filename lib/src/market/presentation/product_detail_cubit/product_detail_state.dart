part of 'product_detail_cubit.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

class ProductDetailData extends ProductDetailState {
  final Product product;

  const ProductDetailData(this.product);

  @override
  List<Object> get props => [...super.props, product];
}

class ProductDetailLoading extends ProductDetailData {
  const ProductDetailLoading({required Product product}) : super(product);
}

class ProductDetailLoadSucceded extends ProductDetailData {
  final List<Price> prices;

  const ProductDetailLoadSucceded({
    required Product product,
    required this.prices,
  }) : super(product);

  @override
  List<Object> get props => [...super.props, prices];
}

class ProductDetailLoadFailed extends ProductDetailData {
  final ApplicationFailure failure;

  const ProductDetailLoadFailed({
    required Product product,
    required this.failure,
  }) : super(product);

  @override
  List<Object> get props => [...super.props, failure];
}
