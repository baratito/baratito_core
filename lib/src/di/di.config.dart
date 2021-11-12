// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_maps_webservice/src/places.dart' as _i17;
import 'package:google_sign_in/google_sign_in.dart' as _i18;
import 'package:http/http.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i25;

import '../auth/application/repositories/authentication_repository.dart'
    as _i49;
import '../auth/application/repositories/authorization_repository.dart' as _i51;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i53;
import '../auth/application/usecases/sign_out_usecase.dart' as _i66;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i35;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i44;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i48;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i10;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i13;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i39;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i38;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i43;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i52;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i74;
import '../location/application/repositories/user_locations_repository.dart'
    as _i72;
import '../location/application/usecases/create_user_location_usecase.dart'
    as _i76;
import '../location/application/usecases/enable_user_location_usecase.dart'
    as _i78;
import '../location/application/usecases/get_user_locations_usecase.dart'
    as _i81;
import '../location/infrastructure/persistence/api_user_locations_provider.dart'
    as _i63;
import '../location/infrastructure/persistence/api_user_locations_provider_endpoint.dart'
    as _i9;
import '../location/infrastructure/persistence/google_maps_places.dart'
    as _i104;
import '../location/infrastructure/persistence/remote_user_locations_provider.dart'
    as _i62;
import '../location/infrastructure/persistence/user_location_create_model_serializer.dart'
    as _i31;
import '../location/infrastructure/persistence/user_location_model_serializer.dart'
    as _i32;
import '../location/infrastructure/persistence/user_location_update_model_serializer.dart'
    as _i33;
import '../location/infrastructure/repositories/user_locations_repository_impl.dart'
    as _i73;
import '../location/presentation/map_locations_search_cubit/map_locations_search_cubit.dart'
    as _i20;
import '../location/presentation/user_location_create_cubit/user_location_create_cubit.dart'
    as _i93;
import '../location/presentation/user_locations_cubit/user_locations_cubit.dart'
    as _i94;
import '../market/application/repositories/prices_repository.dart' as _i82;
import '../market/application/repositories/products_repository.dart' as _i84;
import '../market/application/usecases/get_product_prices_usecase.dart' as _i96;
import '../market/application/usecases/get_product_recommendations_usecase.dart'
    as _i97;
import '../market/application/usecases/search_products_usecase.dart' as _i89;
import '../market/infrastructure/persistence/api_prices_provider.dart' as _i55;
import '../market/infrastructure/persistence/api_prices_provider_endpoint.dart'
    as _i3;
import '../market/infrastructure/persistence/api_products_provider.dart'
    as _i57;
import '../market/infrastructure/persistence/api_products_provider_endpoint.dart'
    as _i4;
import '../market/infrastructure/persistence/establishment_model_serializer.dart'
    as _i16;
import '../market/infrastructure/persistence/price_model_serializer.dart'
    as _i40;
import '../market/infrastructure/persistence/product_model_serializer.dart'
    as _i21;
import '../market/infrastructure/persistence/remote_prices_provider.dart'
    as _i54;
import '../market/infrastructure/persistence/remote_products_provider.dart'
    as _i56;
import '../market/infrastructure/repositories/prices_repository_impl.dart'
    as _i83;
import '../market/infrastructure/repositories/products_repository_impl.dart'
    as _i85;
import '../market/presentation/product_detail_cubit/product_detail_cubit.dart'
    as _i98;
import '../market/presentation/product_recommendations_cubit/product_recommendations_cubit.dart'
    as _i99;
import '../market/presentation/products_search_cubit/products_search_cubit.dart'
    as _i100;
import '../profiles/application/repositories/profiles_repository.dart' as _i86;
import '../profiles/application/usecases/get_authenticated_user_profile_usecase.dart'
    as _i95;
import '../profiles/infrastructure/persistence/api_profiles_provider.dart'
    as _i59;
import '../profiles/infrastructure/persistence/api_profiles_provider_endpoint.dart'
    as _i5;
import '../profiles/infrastructure/persistence/profile_model_serializer.dart'
    as _i22;
import '../profiles/infrastructure/persistence/remote_profiles_provider.dart'
    as _i58;
import '../profiles/infrastructure/repositories/profiles_repository_impl.dart'
    as _i87;
import '../profiles/presentation/authenticated_user_profile_cubit/authenticated_user_profile_cubit.dart'
    as _i101;
import '../shared/domain/clock.dart' as _i103;
import '../shared/infrastructure/api_authorization_service.dart' as _i47;
import '../shared/infrastructure/api_client.dart' as _i34;
import '../shared/infrastructure/api_provider_base_url.dart' as _i6;
import '../shared/infrastructure/http_client.dart' as _i102;
import '../shared/infrastructure/key_value_store.dart' as _i36;
import '../shared/infrastructure/preferences_key_value_store.dart' as _i37;
import '../shared/infrastructure/shared_preferences.dart' as _i106;
import '../shopping/application/repositories/shopping_lists_repository.dart'
    as _i64;
import '../shopping/application/usecases/create_shopping_list_usecase.dart'
    as _i75;
import '../shopping/application/usecases/delete_shopping_list_usecase.dart'
    as _i77;
import '../shopping/application/usecases/get_shopping_list_items_usecase.dart'
    as _i79;
import '../shopping/application/usecases/get_shopping_lists_usecase.dart'
    as _i80;
import '../shopping/application/usecases/start_purchase_usecase.dart' as _i69;
import '../shopping/application/usecases/update_shopping_list_items_usecase.dart'
    as _i70;
import '../shopping/application/usecases/update_shopping_list_name_usecase.dart'
    as _i71;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider.dart'
    as _i61;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider_endpoint.dart'
    as _i7;
import '../shopping/infrastructure/persistence/purchase_list_establishment_model_serializer.dart'
    as _i41;
import '../shopping/infrastructure/persistence/purchase_list_item_model_serializer.dart'
    as _i23;
import '../shopping/infrastructure/persistence/purchase_list_model_serializer.dart'
    as _i42;
import '../shopping/infrastructure/persistence/purchase_settings_serializer.dart'
    as _i24;
import '../shopping/infrastructure/persistence/remote_shopping_lists_provider.dart'
    as _i60;
import '../shopping/infrastructure/persistence/shopping_list_create_model_serializer.dart'
    as _i26;
import '../shopping/infrastructure/persistence/shopping_list_item_model_serializer.dart'
    as _i27;
import '../shopping/infrastructure/persistence/shopping_list_item_update_model_serializer.dart'
    as _i28;
import '../shopping/infrastructure/persistence/shopping_list_model_serializer.dart'
    as _i29;
import '../shopping/infrastructure/persistence/shopping_list_update_model_serializer.dart'
    as _i30;
import '../shopping/infrastructure/repositories/shopping_lists_repository_impl.dart'
    as _i65;
import '../shopping/presentation/purchase_cubit/purchase_cubit.dart' as _i88;
import '../shopping/presentation/shopping_list_cubit/shopping_list_cubit.dart'
    as _i90;
import '../shopping/presentation/shopping_list_items_cubit/shopping_list_items_cubit.dart'
    as _i91;
import '../shopping/presentation/shopping_lists_cubit/shopping_lists_cubit.dart'
    as _i92;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i67;
import '../social_auth/domain/social_authentication_credentials.dart' as _i11;
import '../social_auth/infrastructure/google_sign_in.dart' as _i105;
import '../social_auth/infrastructure/google_sign_in_service.dart' as _i19;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i46;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider_login_endpoint.dart'
    as _i8;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i45;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i12;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i50;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i68; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.ApiShoppingListsProviderEndpoint>(
      () => _i7.ApiShoppingListsProviderEndpoint());
  gh.lazySingleton<_i8.ApiSocialAuthenticationProviderLoginEndpoint>(
      () => _i8.ApiSocialAuthenticationProviderLoginEndpoint());
  gh.lazySingleton<_i9.ApiUserLocationsProviderEndpoint>(
      () => _i9.ApiUserLocationsProviderEndpoint());
  gh.lazySingleton<
          _i10.AuthenticationCredentialsSerializer<
              _i11.SocialAuthenticationCredentials>>(
      () => _i12.SocialAuthenticationCredentialsSerializer());
  gh.lazySingleton<_i13.AuthorizationCredentialsSerializer>(
      () => _i13.AuthorizationCredentialsSerializer());
  gh.lazySingleton<_i14.Client>(() => httpClientModule.httpClient);
  gh.lazySingleton<_i15.Clock>(() => clockModule.clock);
  gh.lazySingleton<_i16.EstablishmentModelSerializer>(
      () => _i16.EstablishmentModelSerializer());
  gh.lazySingleton<_i17.GoogleMapsPlaces>(
      () => googleMapsPlacesModule.googleMapsPlaces);
  gh.factory<_i18.GoogleSignIn>(() => googleSignInModule.signIn);
  gh.lazySingleton<_i19.GoogleSignInService>(
      () => _i19.GoogleSignInService(get<_i18.GoogleSignIn>()));
  gh.factory<_i20.MapLocationsSearchCubit>(
      () => _i20.MapLocationsSearchCubit(get<_i17.GoogleMapsPlaces>()));
  gh.lazySingleton<_i21.ProductModelSerializer>(
      () => _i21.ProductModelSerializer());
  gh.lazySingleton<_i22.ProfileModelSerializer>(
      () => _i22.ProfileModelSerializer());
  gh.lazySingleton<_i23.PurchaseListItemModelSerializer>(
      () => _i23.PurchaseListItemModelSerializer());
  gh.lazySingleton<_i24.PurchaseSettingsSerializer>(
      () => _i24.PurchaseSettingsSerializer());
  await gh.factoryAsync<_i25.SharedPreferences>(
      () => sharedPreferencesModule.preferences,
      preResolve: true);
  gh.lazySingleton<_i26.ShoppingListCreateModelSerializer>(
      () => _i26.ShoppingListCreateModelSerializer());
  gh.lazySingleton<_i27.ShoppingListItemModelSerializer>(() =>
      _i27.ShoppingListItemModelSerializer(get<_i21.ProductModelSerializer>()));
  gh.lazySingleton<_i28.ShoppingListItemUpdateModelSerializer>(
      () => _i28.ShoppingListItemUpdateModelSerializer());
  gh.lazySingleton<_i29.ShoppingListModelSerializer>(
      () => _i29.ShoppingListModelSerializer());
  gh.lazySingleton<_i30.ShoppingListUpdateModelSerializer>(
      () => _i30.ShoppingListUpdateModelSerializer());
  gh.lazySingleton<_i31.UserLocationCreateModelSerializer>(
      () => _i31.UserLocationCreateModelSerializer());
  gh.lazySingleton<_i32.UserLocationModelSerializer>(
      () => _i32.UserLocationModelSerializer());
  gh.lazySingleton<_i33.UserLocationUpdateModelSerializer>(
      () => _i33.UserLocationUpdateModelSerializer());
  gh.lazySingleton<_i34.ApiClient>(() => _i34.ApiClient(get<_i14.Client>()));
  gh.lazySingleton<_i35.AuthorizationCredentialsExpirationChecker>(
      () => _i35.AuthorizationCredentialsExpirationChecker(get<_i15.Clock>()));
  gh.lazySingleton<_i36.KeyValueStore>(
      () => _i37.PreferencesKeyValueStore(get<_i25.SharedPreferences>()));
  gh.lazySingleton<_i38.LocalAuthorizationProvider>(() =>
      _i39.KeyValueStoreAuthorizationProvider(get<_i36.KeyValueStore>(),
          get<_i13.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i40.PriceModelSerializer>(() => _i40.PriceModelSerializer(
      get<_i21.ProductModelSerializer>(),
      get<_i16.EstablishmentModelSerializer>()));
  gh.lazySingleton<_i41.PurchaseListItemEstablishmentModelSerializer>(() =>
      _i41.PurchaseListItemEstablishmentModelSerializer(
          get<_i16.EstablishmentModelSerializer>(),
          get<_i23.PurchaseListItemModelSerializer>()));
  gh.lazySingleton<_i42.PurchaseListModelSerializer>(() =>
      _i42.PurchaseListModelSerializer(
          get<_i41.PurchaseListItemEstablishmentModelSerializer>()));
  gh.lazySingleton<_i43.RemoteAuthorizationRefresher>(() =>
      _i44.ApiAuthorizationRefresher(get<_i34.ApiClient>(),
          get<_i13.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i45.RemoteSocialAuthenticationProvider>(() =>
      _i46.ApiSocialAuthenticationProvider(
          get<_i34.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i8.ApiSocialAuthenticationProviderLoginEndpoint>(),
          get<
              _i10.AuthenticationCredentialsSerializer<
                  _i11.SocialAuthenticationCredentials>>(),
          get<_i13.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i47.ApiAuthorizationService>(() =>
      _i48.ApiAuthorizationServiceImpl(
          get<_i38.LocalAuthorizationProvider>(),
          get<_i35.AuthorizationCredentialsExpirationChecker>(),
          get<_i43.RemoteAuthorizationRefresher>()));
  gh.lazySingleton<
          _i49.AuthenticationRepository<_i11.SocialAuthenticationCredentials>>(
      () => _i50.SocialAuthenticationRepository(
          get<_i45.RemoteSocialAuthenticationProvider>()));
  gh.lazySingleton<_i51.AuthorizationRepository>(() =>
      _i52.AuthorizationRepositoryImpl(get<_i38.LocalAuthorizationProvider>()));
  gh.lazySingleton<_i53.GetAuthorizationCredentialsUsecase>(() =>
      _i53.GetAuthorizationCredentialsUsecase(
          get<_i51.AuthorizationRepository>()));
  gh.lazySingleton<_i54.RemotePricesProvider>(() => _i55.ApiPricesProvider(
      get<_i34.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i3.ApiPricesProviderEndpoint>(),
      get<_i47.ApiAuthorizationService>(),
      get<_i40.PriceModelSerializer>()));
  gh.lazySingleton<_i56.RemoteProductsProvider>(() =>
      _i57.RemoteProductsProviderImpl(
          get<_i34.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i4.ApiProductsProviderEndpoint>(),
          get<_i47.ApiAuthorizationService>(),
          get<_i21.ProductModelSerializer>()));
  gh.lazySingleton<_i58.RemoteProfilesProvider>(() => _i59.ApiProfilesProvider(
      get<_i34.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i5.ApiProfilesProviderEndpoint>(),
      get<_i47.ApiAuthorizationService>(),
      get<_i22.ProfileModelSerializer>()));
  gh.lazySingleton<_i60.RemoteShoppingListsProvider>(() =>
      _i61.ApiShoppingListsProvider(
          get<_i34.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i7.ApiShoppingListsProviderEndpoint>(),
          get<_i47.ApiAuthorizationService>(),
          get<_i29.ShoppingListModelSerializer>(),
          get<_i26.ShoppingListCreateModelSerializer>(),
          get<_i30.ShoppingListUpdateModelSerializer>(),
          get<_i28.ShoppingListItemUpdateModelSerializer>(),
          get<_i27.ShoppingListItemModelSerializer>(),
          get<_i24.PurchaseSettingsSerializer>(),
          get<_i42.PurchaseListModelSerializer>()));
  gh.lazySingleton<_i62.RemoteUserLocationsProvider>(() =>
      _i63.RemoteUserLocationsProviderImpl(
          get<_i34.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i9.ApiUserLocationsProviderEndpoint>(),
          get<_i47.ApiAuthorizationService>(),
          get<_i32.UserLocationModelSerializer>(),
          get<_i31.UserLocationCreateModelSerializer>(),
          get<_i33.UserLocationUpdateModelSerializer>()));
  gh.lazySingleton<_i64.ShoppingListsRepository>(() =>
      _i65.ShoppingListsRespositoryImpl(
          get<_i60.RemoteShoppingListsProvider>()));
  gh.lazySingleton<_i66.SignOutUsecase>(
      () => _i66.SignOutUsecase(get<_i51.AuthorizationRepository>()));
  gh.lazySingleton<_i67.SocialAuthenticateUsecase>(() =>
      _i67.SocialAuthenticateUsecase(
          get<
              _i49.AuthenticationRepository<
                  _i11.SocialAuthenticationCredentials>>(),
          get<_i51.AuthorizationRepository>()));
  gh.factory<_i68.SocialAuthenticationCubit>(() =>
      _i68.SocialAuthenticationCubit(get<_i67.SocialAuthenticateUsecase>()));
  gh.lazySingleton<_i69.StartPurchaseUsecase>(
      () => _i69.StartPurchaseUsecase(get<_i64.ShoppingListsRepository>()));
  gh.lazySingleton<_i70.UpdateShoppingListItemsUsecase>(() =>
      _i70.UpdateShoppingListItemsUsecase(get<_i64.ShoppingListsRepository>()));
  gh.lazySingleton<_i71.UpdateShoppingListNameUsecase>(() =>
      _i71.UpdateShoppingListNameUsecase(get<_i64.ShoppingListsRepository>()));
  gh.lazySingleton<_i72.UserLocationsRepository>(() =>
      _i73.UserLocationsRepositoryImpl(
          get<_i62.RemoteUserLocationsProvider>()));
  gh.factory<_i74.AuthorizationCubit>(() => _i74.AuthorizationCubit(
      get<_i53.GetAuthorizationCredentialsUsecase>(),
      get<_i66.SignOutUsecase>()));
  gh.lazySingleton<_i75.CreateShoppingListUsecase>(() =>
      _i75.CreateShoppingListUsecase(get<_i64.ShoppingListsRepository>()));
  gh.lazySingleton<_i76.CreateUserLocationUsecase>(() =>
      _i76.CreateUserLocationUsecase(get<_i72.UserLocationsRepository>()));
  gh.lazySingleton<_i77.DeleteShoppingListUsecase>(() =>
      _i77.DeleteShoppingListUsecase(get<_i64.ShoppingListsRepository>()));
  gh.lazySingleton<_i78.EnableUserLocationUsecase>(() =>
      _i78.EnableUserLocationUsecase(get<_i72.UserLocationsRepository>()));
  gh.lazySingleton<_i79.GetShoppingListItemsUsecase>(() =>
      _i79.GetShoppingListItemsUsecase(get<_i64.ShoppingListsRepository>()));
  gh.lazySingleton<_i80.GetShoppingListsUsecase>(
      () => _i80.GetShoppingListsUsecase(get<_i64.ShoppingListsRepository>()));
  gh.lazySingleton<_i81.GetUserLocationsUsecase>(
      () => _i81.GetUserLocationsUsecase(get<_i72.UserLocationsRepository>()));
  gh.lazySingleton<_i82.PricesRepository>(
      () => _i83.PricesRepositoryImpl(get<_i54.RemotePricesProvider>()));
  gh.lazySingleton<_i84.ProductsRepository>(
      () => _i85.ProductsRepositoryImpl(get<_i56.RemoteProductsProvider>()));
  gh.lazySingleton<_i86.ProfilesRepository>(
      () => _i87.ProfilesRepositoryImpl(get<_i58.RemoteProfilesProvider>()));
  gh.factory<_i88.PurchaseCubit>(
      () => _i88.PurchaseCubit(get<_i69.StartPurchaseUsecase>()));
  gh.lazySingleton<_i89.SearchProductsUsecase>(
      () => _i89.SearchProductsUsecase(get<_i84.ProductsRepository>()));
  gh.factory<_i90.ShoppingListCubit>(
      () => _i90.ShoppingListCubit(get<_i71.UpdateShoppingListNameUsecase>()));
  gh.factory<_i91.ShoppingListItemsCubit>(() => _i91.ShoppingListItemsCubit(
      get<_i79.GetShoppingListItemsUsecase>(),
      get<_i70.UpdateShoppingListItemsUsecase>()));
  gh.factory<_i92.ShoppingListsCubit>(() => _i92.ShoppingListsCubit(
      get<_i80.GetShoppingListsUsecase>(),
      get<_i75.CreateShoppingListUsecase>(),
      get<_i77.DeleteShoppingListUsecase>()));
  gh.factory<_i93.UserLocationCreateCubit>(() =>
      _i93.UserLocationCreateCubit(get<_i76.CreateUserLocationUsecase>()));
  gh.factory<_i94.UserLocationsCubit>(() => _i94.UserLocationsCubit(
      get<_i81.GetUserLocationsUsecase>(),
      get<_i78.EnableUserLocationUsecase>()));
  gh.lazySingleton<_i95.GetAuthenticatedUserProfileUsecase>(() =>
      _i95.GetAuthenticatedUserProfileUsecase(get<_i86.ProfilesRepository>()));
  gh.lazySingleton<_i96.GetProductPricesUsecase>(
      () => _i96.GetProductPricesUsecase(get<_i82.PricesRepository>()));
  gh.lazySingleton<_i97.GetProductRecommendationsUsecase>(() =>
      _i97.GetProductRecommendationsUsecase(get<_i84.ProductsRepository>()));
  gh.factory<_i98.ProductDetailCubit>(
      () => _i98.ProductDetailCubit(get<_i96.GetProductPricesUsecase>()));
  gh.factory<_i99.ProductRecommendationsCubit>(() =>
      _i99.ProductRecommendationsCubit(
          get<_i97.GetProductRecommendationsUsecase>()));
  gh.factory<_i100.ProductsSearchCubit>(
      () => _i100.ProductsSearchCubit(get<_i89.SearchProductsUsecase>()));
  gh.factory<_i101.AuthenticatedUserProfileCubit>(() =>
      _i101.AuthenticatedUserProfileCubit(
          get<_i95.GetAuthenticatedUserProfileUsecase>()));
  return get;
}

class _$HttpClientModule extends _i102.HttpClientModule {}

class _$ClockModule extends _i103.ClockModule {}

class _$GoogleMapsPlacesModule extends _i104.GoogleMapsPlacesModule {}

class _$GoogleSignInModule extends _i105.GoogleSignInModule {}

class _$SharedPreferencesModule extends _i106.SharedPreferencesModule {}
