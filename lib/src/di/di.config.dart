// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_maps_webservice/src/places.dart' as _i18;
import 'package:google_sign_in/google_sign_in.dart' as _i19;
import 'package:http/http.dart' as _i15;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i26;

import '../auth/application/repositories/authentication_repository.dart'
    as _i50;
import '../auth/application/repositories/authorization_repository.dart' as _i52;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i54;
import '../auth/application/usecases/sign_out_usecase.dart' as _i69;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i36;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i45;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i49;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i11;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i14;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i40;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i39;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i44;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i53;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i77;
import '../location/application/repositories/user_locations_repository.dart'
    as _i75;
import '../location/application/usecases/create_user_location_usecase.dart'
    as _i79;
import '../location/application/usecases/enable_user_location_usecase.dart'
    as _i81;
import '../location/application/usecases/get_user_locations_usecase.dart'
    as _i84;
import '../location/infrastructure/persistence/api_user_locations_provider.dart'
    as _i66;
import '../location/infrastructure/persistence/api_user_locations_provider_endpoint.dart'
    as _i10;
import '../location/infrastructure/persistence/google_maps_places.dart'
    as _i110;
import '../location/infrastructure/persistence/remote_user_locations_provider.dart'
    as _i65;
import '../location/infrastructure/persistence/user_location_create_model_serializer.dart'
    as _i32;
import '../location/infrastructure/persistence/user_location_model_serializer.dart'
    as _i33;
import '../location/infrastructure/persistence/user_location_update_model_serializer.dart'
    as _i34;
import '../location/infrastructure/repositories/user_locations_repository_impl.dart'
    as _i76;
import '../location/presentation/map_locations_search_cubit/map_locations_search_cubit.dart'
    as _i21;
import '../location/presentation/user_location_create_cubit/user_location_create_cubit.dart'
    as _i97;
import '../location/presentation/user_locations_cubit/user_locations_cubit.dart'
    as _i98;
import '../market/application/repositories/prices_repository.dart' as _i85;
import '../market/application/repositories/products_repository.dart' as _i87;
import '../market/application/usecases/get_product_prices_usecase.dart'
    as _i101;
import '../market/application/usecases/get_product_recommendations_usecase.dart'
    as _i102;
import '../market/application/usecases/search_products_usecase.dart' as _i93;
import '../market/infrastructure/persistence/api_prices_provider.dart' as _i56;
import '../market/infrastructure/persistence/api_prices_provider_endpoint.dart'
    as _i3;
import '../market/infrastructure/persistence/api_products_provider.dart'
    as _i58;
import '../market/infrastructure/persistence/api_products_provider_endpoint.dart'
    as _i4;
import '../market/infrastructure/persistence/establishment_model_serializer.dart'
    as _i17;
import '../market/infrastructure/persistence/price_model_serializer.dart'
    as _i41;
import '../market/infrastructure/persistence/product_model_serializer.dart'
    as _i22;
import '../market/infrastructure/persistence/remote_prices_provider.dart'
    as _i55;
import '../market/infrastructure/persistence/remote_products_provider.dart'
    as _i57;
import '../market/infrastructure/repositories/prices_repository_impl.dart'
    as _i86;
import '../market/infrastructure/repositories/products_repository_impl.dart'
    as _i88;
import '../market/presentation/product_detail_cubit/product_detail_cubit.dart'
    as _i103;
import '../market/presentation/product_recommendations_cubit/product_recommendations_cubit.dart'
    as _i104;
import '../market/presentation/products_search_cubit/products_search_cubit.dart'
    as _i105;
import '../profiles/application/repositories/profiles_repository.dart' as _i89;
import '../profiles/application/usecases/get_authenticated_user_profile_usecase.dart'
    as _i100;
import '../profiles/infrastructure/persistence/api_profiles_provider.dart'
    as _i60;
import '../profiles/infrastructure/persistence/api_profiles_provider_endpoint.dart'
    as _i5;
import '../profiles/infrastructure/persistence/profile_model_serializer.dart'
    as _i23;
import '../profiles/infrastructure/persistence/remote_profiles_provider.dart'
    as _i59;
import '../profiles/infrastructure/repositories/profiles_repository_impl.dart'
    as _i90;
import '../profiles/presentation/authenticated_user_profile_cubit/authenticated_user_profile_cubit.dart'
    as _i107;
import '../shared/domain/clock.dart' as _i109;
import '../shared/infrastructure/api_authorization_service.dart' as _i48;
import '../shared/infrastructure/api_client.dart' as _i35;
import '../shared/infrastructure/api_provider_base_url.dart' as _i6;
import '../shared/infrastructure/http_client.dart' as _i108;
import '../shared/infrastructure/key_value_store.dart' as _i37;
import '../shared/infrastructure/preferences_key_value_store.dart' as _i38;
import '../shared/infrastructure/shared_preferences.dart' as _i112;
import '../shopping/application/repositories/purchase_lists_repository.dart'
    as _i91;
import '../shopping/application/repositories/shopping_lists_repository.dart'
    as _i67;
import '../shopping/application/usecases/complete_purchase_usecase.dart'
    as _i99;
import '../shopping/application/usecases/create_shopping_list_usecase.dart'
    as _i78;
import '../shopping/application/usecases/delete_shopping_list_usecase.dart'
    as _i80;
import '../shopping/application/usecases/get_shopping_list_items_usecase.dart'
    as _i82;
import '../shopping/application/usecases/get_shopping_lists_usecase.dart'
    as _i83;
import '../shopping/application/usecases/start_purchase_usecase.dart' as _i72;
import '../shopping/application/usecases/update_shopping_list_items_usecase.dart'
    as _i73;
import '../shopping/application/usecases/update_shopping_list_name_usecase.dart'
    as _i74;
import '../shopping/infrastructure/persistence/api_purchase_lists_provider.dart'
    as _i62;
import '../shopping/infrastructure/persistence/api_purchase_lists_provider_endpoint.dart'
    as _i7;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider.dart'
    as _i64;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider_endpoint.dart'
    as _i8;
import '../shopping/infrastructure/persistence/purchase_list_establishment_model_serializer.dart'
    as _i42;
import '../shopping/infrastructure/persistence/purchase_list_item_model_serializer.dart'
    as _i24;
import '../shopping/infrastructure/persistence/purchase_list_model_serializer.dart'
    as _i43;
import '../shopping/infrastructure/persistence/purchase_settings_serializer.dart'
    as _i25;
import '../shopping/infrastructure/persistence/remote_purchase_lists_provider.dart'
    as _i61;
import '../shopping/infrastructure/persistence/remote_shopping_lists_provider.dart'
    as _i63;
import '../shopping/infrastructure/persistence/shopping_list_create_model_serializer.dart'
    as _i27;
import '../shopping/infrastructure/persistence/shopping_list_item_model_serializer.dart'
    as _i28;
import '../shopping/infrastructure/persistence/shopping_list_item_update_model_serializer.dart'
    as _i29;
import '../shopping/infrastructure/persistence/shopping_list_model_serializer.dart'
    as _i30;
import '../shopping/infrastructure/persistence/shopping_list_update_model_serializer.dart'
    as _i31;
import '../shopping/infrastructure/repositories/purchase_lists_repository_impl.dart'
    as _i92;
import '../shopping/infrastructure/repositories/shopping_lists_repository_impl.dart'
    as _i68;
import '../shopping/presentation/purchase_cubit/purchase_cubit.dart' as _i106;
import '../shopping/presentation/shopping_list_cubit/shopping_list_cubit.dart'
    as _i94;
import '../shopping/presentation/shopping_list_items_cubit/shopping_list_items_cubit.dart'
    as _i95;
import '../shopping/presentation/shopping_lists_cubit/shopping_lists_cubit.dart'
    as _i96;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i70;
import '../social_auth/domain/social_authentication_credentials.dart' as _i12;
import '../social_auth/infrastructure/google_sign_in.dart' as _i111;
import '../social_auth/infrastructure/google_sign_in_service.dart' as _i20;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i47;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider_login_endpoint.dart'
    as _i9;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i46;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i13;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i51;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i71; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final httpClientModule = _$HttpClientModule();
  final clockModule = _$ClockModule();
  final googleMapsPlacesModule = _$GoogleMapsPlacesModule();
  final googleSignInModule = _$GoogleSignInModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.lazySingleton<_i3.ApiPricesProviderEndpoint>(
      () => _i3.ApiPricesProviderEndpoint());
  gh.lazySingleton<_i4.ApiProductsProviderEndpoint>(
      () => _i4.ApiProductsProviderEndpoint());
  gh.lazySingleton<_i5.ApiProfilesProviderEndpoint>(
      () => _i5.ApiProfilesProviderEndpoint());
  gh.lazySingleton<_i6.ApiProviderBaseUrl>(() => _i6.ApiProviderBaseUrl());
  gh.lazySingleton<_i7.ApiPurchaseListsProviderEndpoint>(
      () => _i7.ApiPurchaseListsProviderEndpoint());
  gh.lazySingleton<_i8.ApiShoppingListsProviderEndpoint>(
      () => _i8.ApiShoppingListsProviderEndpoint());
  gh.lazySingleton<_i9.ApiSocialAuthenticationProviderLoginEndpoint>(
      () => _i9.ApiSocialAuthenticationProviderLoginEndpoint());
  gh.lazySingleton<_i10.ApiUserLocationsProviderEndpoint>(
      () => _i10.ApiUserLocationsProviderEndpoint());
  gh.lazySingleton<
          _i11.AuthenticationCredentialsSerializer<
              _i12.SocialAuthenticationCredentials>>(
      () => _i13.SocialAuthenticationCredentialsSerializer());
  gh.lazySingleton<_i14.AuthorizationCredentialsSerializer>(
      () => _i14.AuthorizationCredentialsSerializer());
  gh.lazySingleton<_i15.Client>(() => httpClientModule.httpClient);
  gh.lazySingleton<_i16.Clock>(() => clockModule.clock);
  gh.lazySingleton<_i17.EstablishmentModelSerializer>(
      () => _i17.EstablishmentModelSerializer());
  gh.lazySingleton<_i18.GoogleMapsPlaces>(
      () => googleMapsPlacesModule.googleMapsPlaces);
  gh.factory<_i19.GoogleSignIn>(() => googleSignInModule.signIn);
  gh.lazySingleton<_i20.GoogleSignInService>(
      () => _i20.GoogleSignInService(get<_i19.GoogleSignIn>()));
  gh.factory<_i21.MapLocationsSearchCubit>(
      () => _i21.MapLocationsSearchCubit(get<_i18.GoogleMapsPlaces>()));
  gh.lazySingleton<_i22.ProductModelSerializer>(
      () => _i22.ProductModelSerializer());
  gh.lazySingleton<_i23.ProfileModelSerializer>(
      () => _i23.ProfileModelSerializer());
  gh.lazySingleton<_i24.PurchaseListItemModelSerializer>(
      () => _i24.PurchaseListItemModelSerializer());
  gh.lazySingleton<_i25.PurchaseSettingsSerializer>(
      () => _i25.PurchaseSettingsSerializer());
  await gh.factoryAsync<_i26.SharedPreferences>(
      () => sharedPreferencesModule.preferences,
      preResolve: true);
  gh.lazySingleton<_i27.ShoppingListCreateModelSerializer>(
      () => _i27.ShoppingListCreateModelSerializer());
  gh.lazySingleton<_i28.ShoppingListItemModelSerializer>(() =>
      _i28.ShoppingListItemModelSerializer(get<_i22.ProductModelSerializer>()));
  gh.lazySingleton<_i29.ShoppingListItemUpdateModelSerializer>(
      () => _i29.ShoppingListItemUpdateModelSerializer());
  gh.lazySingleton<_i30.ShoppingListModelSerializer>(
      () => _i30.ShoppingListModelSerializer());
  gh.lazySingleton<_i31.ShoppingListUpdateModelSerializer>(
      () => _i31.ShoppingListUpdateModelSerializer());
  gh.lazySingleton<_i32.UserLocationCreateModelSerializer>(
      () => _i32.UserLocationCreateModelSerializer());
  gh.lazySingleton<_i33.UserLocationModelSerializer>(
      () => _i33.UserLocationModelSerializer());
  gh.lazySingleton<_i34.UserLocationUpdateModelSerializer>(
      () => _i34.UserLocationUpdateModelSerializer());
  gh.lazySingleton<_i35.ApiClient>(() => _i35.ApiClient(get<_i15.Client>()));
  gh.lazySingleton<_i36.AuthorizationCredentialsExpirationChecker>(
      () => _i36.AuthorizationCredentialsExpirationChecker(get<_i16.Clock>()));
  gh.lazySingleton<_i37.KeyValueStore>(
      () => _i38.PreferencesKeyValueStore(get<_i26.SharedPreferences>()));
  gh.lazySingleton<_i39.LocalAuthorizationProvider>(() =>
      _i40.KeyValueStoreAuthorizationProvider(get<_i37.KeyValueStore>(),
          get<_i14.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i41.PriceModelSerializer>(() => _i41.PriceModelSerializer(
      get<_i22.ProductModelSerializer>(),
      get<_i17.EstablishmentModelSerializer>()));
  gh.lazySingleton<_i42.PurchaseListItemEstablishmentModelSerializer>(() =>
      _i42.PurchaseListItemEstablishmentModelSerializer(
          get<_i17.EstablishmentModelSerializer>(),
          get<_i24.PurchaseListItemModelSerializer>()));
  gh.lazySingleton<_i43.PurchaseListModelSerializer>(() =>
      _i43.PurchaseListModelSerializer(
          get<_i42.PurchaseListItemEstablishmentModelSerializer>()));
  gh.lazySingleton<_i44.RemoteAuthorizationRefresher>(() =>
      _i45.ApiAuthorizationRefresher(get<_i35.ApiClient>(),
          get<_i14.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i46.RemoteSocialAuthenticationProvider>(() =>
      _i47.ApiSocialAuthenticationProvider(
          get<_i35.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i9.ApiSocialAuthenticationProviderLoginEndpoint>(),
          get<
              _i11.AuthenticationCredentialsSerializer<
                  _i12.SocialAuthenticationCredentials>>(),
          get<_i14.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i48.ApiAuthorizationService>(() =>
      _i49.ApiAuthorizationServiceImpl(
          get<_i39.LocalAuthorizationProvider>(),
          get<_i36.AuthorizationCredentialsExpirationChecker>(),
          get<_i44.RemoteAuthorizationRefresher>()));
  gh.lazySingleton<
          _i50.AuthenticationRepository<_i12.SocialAuthenticationCredentials>>(
      () => _i51.SocialAuthenticationRepository(
          get<_i46.RemoteSocialAuthenticationProvider>()));
  gh.lazySingleton<_i52.AuthorizationRepository>(() =>
      _i53.AuthorizationRepositoryImpl(get<_i39.LocalAuthorizationProvider>()));
  gh.lazySingleton<_i54.GetAuthorizationCredentialsUsecase>(() =>
      _i54.GetAuthorizationCredentialsUsecase(
          get<_i52.AuthorizationRepository>()));
  gh.lazySingleton<_i55.RemotePricesProvider>(() => _i56.ApiPricesProvider(
      get<_i35.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i3.ApiPricesProviderEndpoint>(),
      get<_i48.ApiAuthorizationService>(),
      get<_i41.PriceModelSerializer>()));
  gh.lazySingleton<_i57.RemoteProductsProvider>(() =>
      _i58.RemoteProductsProviderImpl(
          get<_i35.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i4.ApiProductsProviderEndpoint>(),
          get<_i48.ApiAuthorizationService>(),
          get<_i22.ProductModelSerializer>()));
  gh.lazySingleton<_i59.RemoteProfilesProvider>(() => _i60.ApiProfilesProvider(
      get<_i35.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i5.ApiProfilesProviderEndpoint>(),
      get<_i48.ApiAuthorizationService>(),
      get<_i23.ProfileModelSerializer>()));
  gh.lazySingleton<_i61.RemotePurchaseListsProvider>(() =>
      _i62.ApiPurchaseListsProvider(
          get<_i35.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i7.ApiPurchaseListsProviderEndpoint>(),
          get<_i48.ApiAuthorizationService>(),
          get<_i43.PurchaseListModelSerializer>()));
  gh.lazySingleton<_i63.RemoteShoppingListsProvider>(() =>
      _i64.ApiShoppingListsProvider(
          get<_i35.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i8.ApiShoppingListsProviderEndpoint>(),
          get<_i48.ApiAuthorizationService>(),
          get<_i30.ShoppingListModelSerializer>(),
          get<_i27.ShoppingListCreateModelSerializer>(),
          get<_i31.ShoppingListUpdateModelSerializer>(),
          get<_i29.ShoppingListItemUpdateModelSerializer>(),
          get<_i28.ShoppingListItemModelSerializer>(),
          get<_i25.PurchaseSettingsSerializer>(),
          get<_i43.PurchaseListModelSerializer>()));
  gh.lazySingleton<_i65.RemoteUserLocationsProvider>(() =>
      _i66.RemoteUserLocationsProviderImpl(
          get<_i35.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i10.ApiUserLocationsProviderEndpoint>(),
          get<_i48.ApiAuthorizationService>(),
          get<_i33.UserLocationModelSerializer>(),
          get<_i32.UserLocationCreateModelSerializer>(),
          get<_i34.UserLocationUpdateModelSerializer>()));
  gh.lazySingleton<_i67.ShoppingListsRepository>(() =>
      _i68.ShoppingListsRespositoryImpl(
          get<_i63.RemoteShoppingListsProvider>()));
  gh.lazySingleton<_i69.SignOutUsecase>(
      () => _i69.SignOutUsecase(get<_i52.AuthorizationRepository>()));
  gh.lazySingleton<_i70.SocialAuthenticateUsecase>(() =>
      _i70.SocialAuthenticateUsecase(
          get<
              _i50.AuthenticationRepository<
                  _i12.SocialAuthenticationCredentials>>(),
          get<_i52.AuthorizationRepository>()));
  gh.factory<_i71.SocialAuthenticationCubit>(() =>
      _i71.SocialAuthenticationCubit(get<_i70.SocialAuthenticateUsecase>()));
  gh.lazySingleton<_i72.StartPurchaseUsecase>(
      () => _i72.StartPurchaseUsecase(get<_i67.ShoppingListsRepository>()));
  gh.lazySingleton<_i73.UpdateShoppingListItemsUsecase>(() =>
      _i73.UpdateShoppingListItemsUsecase(get<_i67.ShoppingListsRepository>()));
  gh.lazySingleton<_i74.UpdateShoppingListNameUsecase>(() =>
      _i74.UpdateShoppingListNameUsecase(get<_i67.ShoppingListsRepository>()));
  gh.lazySingleton<_i75.UserLocationsRepository>(() =>
      _i76.UserLocationsRepositoryImpl(
          get<_i65.RemoteUserLocationsProvider>()));
  gh.factory<_i77.AuthorizationCubit>(() => _i77.AuthorizationCubit(
      get<_i54.GetAuthorizationCredentialsUsecase>(),
      get<_i69.SignOutUsecase>()));
  gh.lazySingleton<_i78.CreateShoppingListUsecase>(() =>
      _i78.CreateShoppingListUsecase(get<_i67.ShoppingListsRepository>()));
  gh.lazySingleton<_i79.CreateUserLocationUsecase>(() =>
      _i79.CreateUserLocationUsecase(get<_i75.UserLocationsRepository>()));
  gh.lazySingleton<_i80.DeleteShoppingListUsecase>(() =>
      _i80.DeleteShoppingListUsecase(get<_i67.ShoppingListsRepository>()));
  gh.lazySingleton<_i81.EnableUserLocationUsecase>(() =>
      _i81.EnableUserLocationUsecase(get<_i75.UserLocationsRepository>()));
  gh.lazySingleton<_i82.GetShoppingListItemsUsecase>(() =>
      _i82.GetShoppingListItemsUsecase(get<_i67.ShoppingListsRepository>()));
  gh.lazySingleton<_i83.GetShoppingListsUsecase>(
      () => _i83.GetShoppingListsUsecase(get<_i67.ShoppingListsRepository>()));
  gh.lazySingleton<_i84.GetUserLocationsUsecase>(
      () => _i84.GetUserLocationsUsecase(get<_i75.UserLocationsRepository>()));
  gh.lazySingleton<_i85.PricesRepository>(
      () => _i86.PricesRepositoryImpl(get<_i55.RemotePricesProvider>()));
  gh.lazySingleton<_i87.ProductsRepository>(
      () => _i88.ProductsRepositoryImpl(get<_i57.RemoteProductsProvider>()));
  gh.lazySingleton<_i89.ProfilesRepository>(
      () => _i90.ProfilesRepositoryImpl(get<_i59.RemoteProfilesProvider>()));
  gh.lazySingleton<_i91.PurchaseListsRepository>(() =>
      _i92.PurchaseListRepositoryImpl(get<_i61.RemotePurchaseListsProvider>()));
  gh.lazySingleton<_i93.SearchProductsUsecase>(
      () => _i93.SearchProductsUsecase(get<_i87.ProductsRepository>()));
  gh.factory<_i94.ShoppingListCubit>(
      () => _i94.ShoppingListCubit(get<_i74.UpdateShoppingListNameUsecase>()));
  gh.factory<_i95.ShoppingListItemsCubit>(() => _i95.ShoppingListItemsCubit(
      get<_i82.GetShoppingListItemsUsecase>(),
      get<_i73.UpdateShoppingListItemsUsecase>()));
  gh.factory<_i96.ShoppingListsCubit>(() => _i96.ShoppingListsCubit(
      get<_i83.GetShoppingListsUsecase>(),
      get<_i78.CreateShoppingListUsecase>(),
      get<_i80.DeleteShoppingListUsecase>()));
  gh.factory<_i97.UserLocationCreateCubit>(() =>
      _i97.UserLocationCreateCubit(get<_i79.CreateUserLocationUsecase>()));
  gh.factory<_i98.UserLocationsCubit>(() => _i98.UserLocationsCubit(
      get<_i84.GetUserLocationsUsecase>(),
      get<_i81.EnableUserLocationUsecase>()));
  gh.lazySingleton<_i99.CompletePurchaseUsecase>(
      () => _i99.CompletePurchaseUsecase(get<_i91.PurchaseListsRepository>()));
  gh.lazySingleton<_i100.GetAuthenticatedUserProfileUsecase>(() =>
      _i100.GetAuthenticatedUserProfileUsecase(get<_i89.ProfilesRepository>()));
  gh.lazySingleton<_i101.GetProductPricesUsecase>(
      () => _i101.GetProductPricesUsecase(get<_i85.PricesRepository>()));
  gh.lazySingleton<_i102.GetProductRecommendationsUsecase>(() =>
      _i102.GetProductRecommendationsUsecase(get<_i87.ProductsRepository>()));
  gh.factory<_i103.ProductDetailCubit>(
      () => _i103.ProductDetailCubit(get<_i101.GetProductPricesUsecase>()));
  gh.factory<_i104.ProductRecommendationsCubit>(() =>
      _i104.ProductRecommendationsCubit(
          get<_i102.GetProductRecommendationsUsecase>()));
  gh.factory<_i105.ProductsSearchCubit>(
      () => _i105.ProductsSearchCubit(get<_i93.SearchProductsUsecase>()));
  gh.factory<_i106.PurchaseCubit>(() => _i106.PurchaseCubit(
      get<_i72.StartPurchaseUsecase>(), get<_i99.CompletePurchaseUsecase>()));
  gh.factory<_i107.AuthenticatedUserProfileCubit>(() =>
      _i107.AuthenticatedUserProfileCubit(
          get<_i100.GetAuthenticatedUserProfileUsecase>()));
  return get;
}

class _$HttpClientModule extends _i108.HttpClientModule {}

class _$ClockModule extends _i109.ClockModule {}

class _$GoogleMapsPlacesModule extends _i110.GoogleMapsPlacesModule {}

class _$GoogleSignInModule extends _i111.GoogleSignInModule {}

class _$SharedPreferencesModule extends _i112.SharedPreferencesModule {}
