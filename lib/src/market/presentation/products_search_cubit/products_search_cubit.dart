import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:baratito_core/src/configs/configs.dart';
import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/application/application.dart';

part 'products_search_state.dart';

@injectable
class ProductsSearchCubit extends Cubit<ProductsSearchState> {
  final SearchProductsUsecase _searchProductsUsecase;

  ProductsSearchCubit(this._searchProductsUsecase)
      : super(ProductsSearchInitial());

  String get _currentQuery {
    final _state = (state as ProductsSearchQueryState);
    return _state.query;
  }

  Category? get _currentCategory {
    final _state = (state as ProductsSearchQueryState);
    return _state.category;
  }

  PageInfo get _currentPageInfo {
    final _state = (state as ProductsSearchResultsFound);
    return _state.pageInfo;
  }

  Future<void> setQuery({required String query}) async {
    final isCategorySet =
        state is ProductsSearchQueryState && _currentCategory != null;
    if (query.isEmpty && !isCategorySet) {
      emit(ProductsSearchInitial());
      return;
    }
    if (state is ProductsSearchInitial) {
      return _search(query);
    }
    return _search(query, _currentCategory);
  }

  Future<void> setCategory({required Category? category}) async {
    final isQuerySet =
        state is ProductsSearchQueryState && _currentQuery.isNotEmpty;
    if (category == null && !isQuerySet) {
      emit(ProductsSearchInitial());
      return;
    }
    if (state is ProductsSearchInitial) {
      return _search('', category);
    }
    return _search(_currentQuery, category);
  }

  Future<void> _search(String query, [Category? category]) async {
    final _state = state;
    emit(ProductsSearchLoading(query: query, category: category));
    const firstPageInfo = PageInfo(
      pageNumber: 1,
      pageSize: Constants.defaultPageSize,
    );
    await _emitSearchResults(firstPageInfo, query, category, [], _state);
  }

  Future<void> getNextPage() async {
    final _state = state;
    if (_state is! ProductsSearchResultsNextPageAvailable) return;

    final newPageInfo = _currentPageInfo.next();
    final currentProducts = _state.products;

    await _emitSearchResults(
      newPageInfo,
      _currentQuery,
      _currentCategory,
      currentProducts,
      _state,
    );
  }

  Future<void> _emitSearchResults(
    PageInfo pageInfo,
    String query,
    Category? category,
    List<Product> previousProducts,
    ProductsSearchState fallbackState,
  ) async {
    final result = await _searchProductsUsecase(
      pageInfo: pageInfo,
      query: query,
      category: category,
    );

    if (result.isFailure) {
      final failure = result.failure;
      emit(ProductsSearchFailed(
        query: query,
        category: category,
        failure: failure,
      ));
      emit(fallbackState);
      return;
    }

    final pagedList = result.success;

    if (previousProducts.isEmpty && pagedList.isEmpty) {
      emit(ProductsSearchNoResults(query: query, category: category));
      return;
    }

    final currentProducts = [...previousProducts, ...pagedList.elements];
    final hasPagesLeft = currentProducts.length < pagedList.totalSize;
    if (hasPagesLeft) {
      emit(ProductsSearchResultsNextPageAvailable(
        currentPageInfo: pageInfo,
        products: currentProducts,
        query: query,
        category: category,
      ));
      return;
    }
    emit(ProductsSearchResultsComplete(
      currentPageInfo: pageInfo,
      products: currentProducts,
      query: query,
      category: category,
    ));
  }
}
