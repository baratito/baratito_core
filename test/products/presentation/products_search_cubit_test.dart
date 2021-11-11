import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_type/result_type.dart';
import 'package:test/test.dart';

import 'package:baratito_core/src/configs/configs.dart';
import 'package:baratito_core/src/market/market.dart';
import 'package:baratito_core/src/shared/shared.dart';

void main() {
  late MockSearchProductsUsecase mockSearchProductsUsecase;
  late ProductsSearchCubit productsSearchCubit;

  setUp(() {
    mockSearchProductsUsecase = MockSearchProductsUsecase();
    productsSearchCubit = ProductsSearchCubit(mockSearchProductsUsecase);
  });

  final query = 'product';
  final category = Category.frozenFood;

  group('on setQuery() without category set', () {
    final products = [FakeProduct(1)];
    final firstPageInfo = PageInfo(
      pageNumber: 1,
      pageSize: Constants.defaultPageSize,
    );
    final singleProductPagedList = PagedList(
      totalSize: 1,
      elements: products,
    );
    final completeState = ProductsSearchResultsComplete(
      currentPageInfo: firstPageInfo,
      products: products,
      query: query,
    );
    final multipleProductsPagedList = PagedList(
      totalSize: 100,
      elements: products,
    );
    final nextAvailableState = ProductsSearchResultsNextPageAvailable(
      currentPageInfo: firstPageInfo,
      products: products,
      query: query,
    );
    final emptyPagedList = PagedList<Product>(
      totalSize: 0,
      elements: [],
    );
    blocTest<ProductsSearchCubit, ProductsSearchState>(
      'emits [ProductsSearchLoading, ProductsSearchResultsComplete] when there '
      'are no next result pages available',
      build: () => productsSearchCubit,
      act: (cubit) {
        when(
          () => mockSearchProductsUsecase(
            pageInfo: firstPageInfo,
            query: query,
          ),
        ).thenAnswer((_) async => Success(singleProductPagedList));

        cubit.setQuery(query: query);
      },
      expect: () => [
        ProductsSearchLoading(query: query),
        completeState,
      ],
    );

    blocTest<ProductsSearchCubit, ProductsSearchState>(
      'emits [ProductsSearchLoading, ProductsSearchNoResults] when there '
      'are no results available',
      build: () => productsSearchCubit,
      act: (cubit) {
        when(
          () => mockSearchProductsUsecase(
            pageInfo: firstPageInfo,
            query: query,
          ),
        ).thenAnswer((_) async => Success(emptyPagedList));

        cubit.setQuery(query: query);
      },
      expect: () => [
        ProductsSearchLoading(query: query),
        ProductsSearchNoResults(query: query),
      ],
    );

    blocTest<ProductsSearchCubit, ProductsSearchState>(
      'emits [ProductsSearchLoading, ProductsSearchResultsNextPageAvailable] '
      'when there are next result pages available',
      build: () => productsSearchCubit,
      act: (cubit) {
        when(
          () => mockSearchProductsUsecase(
            pageInfo: firstPageInfo,
            query: query,
          ),
        ).thenAnswer((_) async => Success(multipleProductsPagedList));

        cubit.setQuery(query: query);
      },
      expect: () => [
        ProductsSearchLoading(query: query),
        nextAvailableState,
      ],
    );

    blocTest<ProductsSearchCubit, ProductsSearchState>(
      'emits [ProductsSearchLoading, ProductsSearchFailed(ServerFailure)] '
      'when usecase call fails with ServerFailure',
      build: () => productsSearchCubit,
      act: (cubit) {
        when(
          () => mockSearchProductsUsecase(
            pageInfo: firstPageInfo,
            query: query,
          ),
        ).thenAnswer((_) async => Failure(ServerFailure()));

        cubit.setQuery(query: query);
      },
      expect: () => [
        ProductsSearchLoading(query: query),
        ProductsSearchFailed(query: query, failure: ServerFailure()),
        ProductsSearchInitial(),
      ],
    );

    blocTest<ProductsSearchCubit, ProductsSearchState>(
      'emits [ProductsSearchLoading, ProductsSearchFailed(NotFoundFailure)] '
      'when usecase call fails with NotFoundFailure',
      build: () => productsSearchCubit,
      act: (cubit) {
        when(
          () => mockSearchProductsUsecase(
            pageInfo: firstPageInfo,
            query: query,
          ),
        ).thenAnswer((_) async => Failure(NotFoundFailure()));

        cubit.setQuery(query: query);
      },
      expect: () => [
        ProductsSearchLoading(query: query),
        ProductsSearchFailed(query: query, failure: NotFoundFailure()),
        ProductsSearchInitial(),
      ],
    );

    blocTest<ProductsSearchCubit, ProductsSearchState>(
      'emits [ProductsSearchLoading, ProductsSearchFailed(ConnectionFailure)] '
      'when usecase call fails with ConnectionFailure',
      build: () => productsSearchCubit,
      act: (cubit) {
        when(
          () => mockSearchProductsUsecase(
            pageInfo: firstPageInfo,
            query: query,
          ),
        ).thenAnswer((_) async => Failure(ConnectionFailure()));

        cubit.setQuery(query: query);
      },
      expect: () => [
        ProductsSearchLoading(query: query),
        ProductsSearchFailed(query: query, failure: ConnectionFailure()),
        ProductsSearchInitial(),
      ],
    );
  });

  group('on getNextPage()', () {
    final previousProducts = [FakeProduct(1)];
    final newProducts = [FakeProduct(2)];
    final totalProducts = [...previousProducts, ...newProducts];
    final currentPageInfo = PageInfo(
      pageNumber: 1,
      pageSize: Constants.defaultPageSize,
    );
    final newPageInfo = PageInfo(
      pageNumber: 2,
      pageSize: Constants.defaultPageSize,
    );

    final completePagedList = PagedList(
      totalSize: 2,
      elements: newProducts,
    );
    final currentState = ProductsSearchResultsNextPageAvailable(
      currentPageInfo: currentPageInfo,
      products: previousProducts,
      query: query,
      category: category,
    );
    final completeState = ProductsSearchResultsComplete(
      currentPageInfo: newPageInfo,
      products: totalProducts,
      query: query,
      category: category,
    );

    final pagesLeftPagedList = PagedList(
      totalSize: 3,
      elements: newProducts,
    );
    final pagesLeftState = ProductsSearchResultsNextPageAvailable(
      currentPageInfo: newPageInfo,
      products: totalProducts,
      query: query,
      category: category,
    );
    blocTest<ProductsSearchCubit, ProductsSearchState>(
      'emits [ProductsSearchResultsComplete] when there '
      'are no next result pages available',
      build: () => productsSearchCubit,
      seed: () => currentState,
      act: (cubit) {
        when(
          () => mockSearchProductsUsecase(
            pageInfo: newPageInfo,
            query: query,
            category: category,
          ),
        ).thenAnswer((_) async => Success(completePagedList));

        cubit.getNextPage();
      },
      expect: () => [completeState],
    );

    blocTest<ProductsSearchCubit, ProductsSearchState>(
      'emits [ProductsSearchResultsNextPageAvailable] when there '
      'are next result pages available',
      build: () => productsSearchCubit,
      seed: () => currentState,
      act: (cubit) {
        when(
          () => mockSearchProductsUsecase(
            pageInfo: newPageInfo,
            query: query,
            category: category,
          ),
        ).thenAnswer((_) async => Success(pagesLeftPagedList));

        cubit.getNextPage();
      },
      expect: () => [pagesLeftState],
    );
  });
}

class FakeProduct extends Fake implements Product {
  @override
  final int id;

  FakeProduct(this.id);
}

class MockSearchProductsUsecase extends Mock implements SearchProductsUsecase {}
