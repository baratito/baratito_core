part of 'products_search_cubit.dart';

abstract class ProductsSearchState extends Equatable {
  const ProductsSearchState();

  @override
  List<Object?> get props => [];
}

class ProductsSearchInitial extends ProductsSearchState {}

class ProductsSearchQueryState extends ProductsSearchState {
  final String query;
  final Category? category;

  const ProductsSearchQueryState(this.query, this.category);

  @override
  List<Object?> get props => [...super.props, query, category];
}

class ProductsSearchResultsFound extends ProductsSearchQueryState {
  final PageInfo pageInfo;
  final List<Product> products;

  const ProductsSearchResultsFound(
    this.pageInfo,
    this.products,
    String query,
    Category? category,
  ) : super(query, category);

  @override
  List<Object?> get props => [...super.props, pageInfo, products];
}

class ProductsSearchResultsNextPageAvailable
    extends ProductsSearchResultsFound {
  const ProductsSearchResultsNextPageAvailable({
    required PageInfo currentPageInfo,
    required List<Product> products,
    required String query,
    Category? category,
  }) : super(currentPageInfo, products, query, category);
}

class ProductsSearchResultsComplete extends ProductsSearchResultsFound {
  const ProductsSearchResultsComplete({
    required PageInfo currentPageInfo,
    required List<Product> products,
    required String query,
    Category? category,
  }) : super(currentPageInfo, products, query, category);
}

class ProductsSearchLoading extends ProductsSearchQueryState {
  const ProductsSearchLoading({
    required String query,
    Category? category,
  }) : super(query, category);
}

class ProductsSearchNoResults extends ProductsSearchQueryState {
  const ProductsSearchNoResults({
    required String query,
    Category? category,
  }) : super(query, category);
}

class ProductsSearchFailed extends ProductsSearchQueryState {
  final ApplicationFailure failure;

  const ProductsSearchFailed({
    required String query,
    required this.failure,
    Category? category,
  }) : super(query, category);

  @override
  List<Object?> get props => [...super.props, failure];
}
