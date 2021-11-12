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
import 'package:shared_preferences/shared_preferences.dart' as _i23;

import '../auth/application/repositories/authentication_repository.dart'
    as _i45;
import '../auth/application/repositories/authorization_repository.dart' as _i47;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i49;
import '../auth/application/usecases/sign_out_usecase.dart' as _i62;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i33;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i40;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i44;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i10;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i13;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i37;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i36;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i39;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i48;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i69;
import '../location/application/repositories/user_locations_repository.dart'
    as _i67;
import '../location/application/usecases/create_user_location_usecase.dart'
    as _i71;
import '../location/application/usecases/enable_user_location_usecase.dart'
    as _i73;
import '../location/application/usecases/get_user_locations_usecase.dart'
    as _i76;
import '../location/infrastructure/persistence/api_user_locations_provider.dart'
    as _i59;
import '../location/infrastructure/persistence/api_user_locations_provider_endpoint.dart'
    as _i9;
import '../location/infrastructure/persistence/google_maps_places.dart' as _i96;
import '../location/infrastructure/persistence/remote_user_locations_provider.dart'
    as _i58;
import '../location/infrastructure/persistence/user_location_create_model_serializer.dart'
    as _i29;
import '../location/infrastructure/persistence/user_location_model_serializer.dart'
    as _i30;
import '../location/infrastructure/persistence/user_location_update_model_serializer.dart'
    as _i31;
import '../location/infrastructure/repositories/user_locations_repository_impl.dart'
    as _i68;
import '../location/presentation/map_locations_search_cubit/map_locations_search_cubit.dart'
    as _i20;
import '../location/presentation/user_location_create_cubit/user_location_create_cubit.dart'
    as _i87;
import '../location/presentation/user_locations_cubit/user_locations_cubit.dart'
    as _i88;
import '../market/application/repositories/prices_repository.dart' as _i77;
import '../market/application/repositories/products_repository.dart' as _i79;
import '../market/application/usecases/get_product_prices_usecase.dart' as _i90;
import '../market/application/usecases/search_products_usecase.dart' as _i83;
import '../market/infrastructure/persistence/api_prices_provider.dart' as _i51;
import '../market/infrastructure/persistence/api_prices_provider_endpoint.dart'
    as _i3;
import '../market/infrastructure/persistence/api_products_provider.dart'
    as _i53;
import '../market/infrastructure/persistence/api_products_provider_endpoint.dart'
    as _i4;
import '../market/infrastructure/persistence/establishment_model_serializer.dart'
    as _i16;
import '../market/infrastructure/persistence/price_model_serializer.dart'
    as _i38;
import '../market/infrastructure/persistence/product_model_serializer.dart'
    as _i21;
import '../market/infrastructure/persistence/remote_prices_provider.dart'
    as _i50;
import '../market/infrastructure/persistence/remote_products_provider.dart'
    as _i52;
import '../market/infrastructure/repositories/prices_repository_impl.dart'
    as _i78;
import '../market/infrastructure/repositories/products_repository_impl.dart'
    as _i80;
import '../market/presentation/product_detail_cubit/product_detail_cubit.dart'
    as _i91;
import '../market/presentation/products_search_cubit/products_search_cubit.dart'
    as _i92;
import '../profiles/application/repositories/profiles_repository.dart' as _i81;
import '../profiles/application/usecases/get_authenticated_user_profile_usecase.dart'
    as _i89;
import '../profiles/infrastructure/persistence/api_profiles_provider.dart'
    as _i55;
import '../profiles/infrastructure/persistence/api_profiles_provider_endpoint.dart'
    as _i5;
import '../profiles/infrastructure/persistence/profile_model_serializer.dart'
    as _i22;
import '../profiles/infrastructure/persistence/remote_profiles_provider.dart'
    as _i54;
import '../profiles/infrastructure/repositories/profiles_repository_impl.dart'
    as _i82;
import '../profiles/presentation/authenticated_user_profile_cubit/authenticated_user_profile_cubit.dart'
    as _i93;
import '../shared/domain/clock.dart' as _i95;
import '../shared/infrastructure/api_authorization_service.dart' as _i43;
import '../shared/infrastructure/api_client.dart' as _i32;
import '../shared/infrastructure/api_provider_base_url.dart' as _i6;
import '../shared/infrastructure/http_client.dart' as _i94;
import '../shared/infrastructure/key_value_store.dart' as _i34;
import '../shared/infrastructure/preferences_key_value_store.dart' as _i35;
import '../shared/infrastructure/shared_preferences.dart' as _i98;
import '../shopping/application/repositories/shopping_lists_repository.dart'
    as _i60;
import '../shopping/application/usecases/create_shopping_list_usecase.dart'
    as _i70;
import '../shopping/application/usecases/delete_shopping_list_usecase.dart'
    as _i72;
import '../shopping/application/usecases/get_shopping_list_items_usecase.dart'
    as _i74;
import '../shopping/application/usecases/get_shopping_lists_usecase.dart'
    as _i75;
import '../shopping/application/usecases/update_shopping_list_items_usecase.dart'
    as _i65;
import '../shopping/application/usecases/update_shopping_list_name_usecase.dart'
    as _i66;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider.dart'
    as _i57;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider_endpoint.dart'
    as _i7;
import '../shopping/infrastructure/persistence/remote_shopping_lists_provider.dart'
    as _i56;
import '../shopping/infrastructure/persistence/shopping_list_create_model_serializer.dart'
    as _i24;
import '../shopping/infrastructure/persistence/shopping_list_item_model_serializer.dart'
    as _i25;
import '../shopping/infrastructure/persistence/shopping_list_item_update_model_serializer.dart'
    as _i26;
import '../shopping/infrastructure/persistence/shopping_list_model_serializer.dart'
    as _i27;
import '../shopping/infrastructure/persistence/shopping_list_update_model_serializer.dart'
    as _i28;
import '../shopping/infrastructure/repositories/shopping_lists_repository_impl.dart'
    as _i61;
import '../shopping/presentation/shopping_list_cubit/shopping_list_cubit.dart'
    as _i84;
import '../shopping/presentation/shopping_list_items_cubit/shopping_list_items_cubit.dart'
    as _i85;
import '../shopping/presentation/shopping_lists_cubit/shopping_lists_cubit.dart'
    as _i86;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i63;
import '../social_auth/domain/social_authentication_credentials.dart' as _i11;
import '../social_auth/infrastructure/google_sign_in.dart' as _i97;
import '../social_auth/infrastructure/google_sign_in_service.dart' as _i19;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i42;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider_login_endpoint.dart'
    as _i8;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i41;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i12;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i46;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i64; // ignore_for_file: unnecessary_lambdas

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
  await gh.factoryAsync<_i23.SharedPreferences>(
      () => sharedPreferencesModule.preferences,
      preResolve: true);
  gh.lazySingleton<_i24.ShoppingListCreateModelSerializer>(
      () => _i24.ShoppingListCreateModelSerializer());
  gh.lazySingleton<_i25.ShoppingListItemModelSerializer>(() =>
      _i25.ShoppingListItemModelSerializer(get<_i21.ProductModelSerializer>()));
  gh.lazySingleton<_i26.ShoppingListItemUpdateModelSerializer>(
      () => _i26.ShoppingListItemUpdateModelSerializer());
  gh.lazySingleton<_i27.ShoppingListModelSerializer>(
      () => _i27.ShoppingListModelSerializer());
  gh.lazySingleton<_i28.ShoppingListUpdateModelSerializer>(
      () => _i28.ShoppingListUpdateModelSerializer());
  gh.lazySingleton<_i29.UserLocationCreateModelSerializer>(
      () => _i29.UserLocationCreateModelSerializer());
  gh.lazySingleton<_i30.UserLocationModelSerializer>(
      () => _i30.UserLocationModelSerializer());
  gh.lazySingleton<_i31.UserLocationUpdateModelSerializer>(
      () => _i31.UserLocationUpdateModelSerializer());
  gh.lazySingleton<_i32.ApiClient>(() => _i32.ApiClient(get<_i14.Client>()));
  gh.lazySingleton<_i33.AuthorizationCredentialsExpirationChecker>(
      () => _i33.AuthorizationCredentialsExpirationChecker(get<_i15.Clock>()));
  gh.lazySingleton<_i34.KeyValueStore>(
      () => _i35.PreferencesKeyValueStore(get<_i23.SharedPreferences>()));
  gh.lazySingleton<_i36.LocalAuthorizationProvider>(() =>
      _i37.KeyValueStoreAuthorizationProvider(get<_i34.KeyValueStore>(),
          get<_i13.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i38.PriceModelSerializer>(() => _i38.PriceModelSerializer(
      get<_i21.ProductModelSerializer>(),
      get<_i16.EstablishmentModelSerializer>()));
  gh.lazySingleton<_i39.RemoteAuthorizationRefresher>(() =>
      _i40.ApiAuthorizationRefresher(get<_i32.ApiClient>(),
          get<_i13.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i41.RemoteSocialAuthenticationProvider>(() =>
      _i42.ApiSocialAuthenticationProvider(
          get<_i32.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i8.ApiSocialAuthenticationProviderLoginEndpoint>(),
          get<
              _i10.AuthenticationCredentialsSerializer<
                  _i11.SocialAuthenticationCredentials>>(),
          get<_i13.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i43.ApiAuthorizationService>(() =>
      _i44.ApiAuthorizationServiceImpl(
          get<_i36.LocalAuthorizationProvider>(),
          get<_i33.AuthorizationCredentialsExpirationChecker>(),
          get<_i39.RemoteAuthorizationRefresher>()));
  gh.lazySingleton<
          _i45.AuthenticationRepository<_i11.SocialAuthenticationCredentials>>(
      () => _i46.SocialAuthenticationRepository(
          get<_i41.RemoteSocialAuthenticationProvider>()));
  gh.lazySingleton<_i47.AuthorizationRepository>(() =>
      _i48.AuthorizationRepositoryImpl(get<_i36.LocalAuthorizationProvider>()));
  gh.lazySingleton<_i49.GetAuthorizationCredentialsUsecase>(() =>
      _i49.GetAuthorizationCredentialsUsecase(
          get<_i47.AuthorizationRepository>()));
  gh.lazySingleton<_i50.RemotePricesProvider>(() => _i51.ApiPricesProvider(
      get<_i32.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i3.ApiPricesProviderEndpoint>(),
      get<_i43.ApiAuthorizationService>(),
      get<_i38.PriceModelSerializer>()));
  gh.lazySingleton<_i52.RemoteProductsProvider>(() =>
      _i53.RemoteProductsProviderImpl(
          get<_i32.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i4.ApiProductsProviderEndpoint>(),
          get<_i43.ApiAuthorizationService>(),
          get<_i21.ProductModelSerializer>()));
  gh.lazySingleton<_i54.RemoteProfilesProvider>(() => _i55.ApiProfilesProvider(
      get<_i32.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i5.ApiProfilesProviderEndpoint>(),
      get<_i43.ApiAuthorizationService>(),
      get<_i22.ProfileModelSerializer>()));
  gh.lazySingleton<_i56.RemoteShoppingListsProvider>(() =>
      _i57.ApiShoppingListsProvider(
          get<_i32.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i7.ApiShoppingListsProviderEndpoint>(),
          get<_i43.ApiAuthorizationService>(),
          get<_i27.ShoppingListModelSerializer>(),
          get<_i24.ShoppingListCreateModelSerializer>(),
          get<_i28.ShoppingListUpdateModelSerializer>(),
          get<_i26.ShoppingListItemUpdateModelSerializer>(),
          get<_i25.ShoppingListItemModelSerializer>()));
  gh.lazySingleton<_i58.RemoteUserLocationsProvider>(() =>
      _i59.RemoteUserLocationsProviderImpl(
          get<_i32.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i9.ApiUserLocationsProviderEndpoint>(),
          get<_i43.ApiAuthorizationService>(),
          get<_i30.UserLocationModelSerializer>(),
          get<_i29.UserLocationCreateModelSerializer>(),
          get<_i31.UserLocationUpdateModelSerializer>()));
  gh.lazySingleton<_i60.ShoppingListsRepository>(() =>
      _i61.ShoppingListsRespositoryImpl(
          get<_i56.RemoteShoppingListsProvider>()));
  gh.lazySingleton<_i62.SignOutUsecase>(
      () => _i62.SignOutUsecase(get<_i47.AuthorizationRepository>()));
  gh.lazySingleton<_i63.SocialAuthenticateUsecase>(() =>
      _i63.SocialAuthenticateUsecase(
          get<
              _i45.AuthenticationRepository<
                  _i11.SocialAuthenticationCredentials>>(),
          get<_i47.AuthorizationRepository>()));
  gh.factory<_i64.SocialAuthenticationCubit>(() =>
      _i64.SocialAuthenticationCubit(get<_i63.SocialAuthenticateUsecase>()));
  gh.lazySingleton<_i65.UpdateShoppingListItemsUsecase>(() =>
      _i65.UpdateShoppingListItemsUsecase(get<_i60.ShoppingListsRepository>()));
  gh.lazySingleton<_i66.UpdateShoppingListNameUsecase>(() =>
      _i66.UpdateShoppingListNameUsecase(get<_i60.ShoppingListsRepository>()));
  gh.lazySingleton<_i67.UserLocationsRepository>(() =>
      _i68.UserLocationsRepositoryImpl(
          get<_i58.RemoteUserLocationsProvider>()));
  gh.factory<_i69.AuthorizationCubit>(() => _i69.AuthorizationCubit(
      get<_i49.GetAuthorizationCredentialsUsecase>(),
      get<_i62.SignOutUsecase>()));
  gh.lazySingleton<_i70.CreateShoppingListUsecase>(() =>
      _i70.CreateShoppingListUsecase(get<_i60.ShoppingListsRepository>()));
  gh.lazySingleton<_i71.CreateUserLocationUsecase>(() =>
      _i71.CreateUserLocationUsecase(get<_i67.UserLocationsRepository>()));
  gh.lazySingleton<_i72.DeleteShoppingListUsecase>(() =>
      _i72.DeleteShoppingListUsecase(get<_i60.ShoppingListsRepository>()));
  gh.lazySingleton<_i73.EnableUserLocationUsecase>(() =>
      _i73.EnableUserLocationUsecase(get<_i67.UserLocationsRepository>()));
  gh.lazySingleton<_i74.GetShoppingListItemsUsecase>(() =>
      _i74.GetShoppingListItemsUsecase(get<_i60.ShoppingListsRepository>()));
  gh.lazySingleton<_i75.GetShoppingListsUsecase>(
      () => _i75.GetShoppingListsUsecase(get<_i60.ShoppingListsRepository>()));
  gh.lazySingleton<_i76.GetUserLocationsUsecase>(
      () => _i76.GetUserLocationsUsecase(get<_i67.UserLocationsRepository>()));
  gh.lazySingleton<_i77.PricesRepository>(
      () => _i78.PricesRepositoryImpl(get<_i50.RemotePricesProvider>()));
  gh.lazySingleton<_i79.ProductsRepository>(
      () => _i80.ProductsRepositoryImpl(get<_i52.RemoteProductsProvider>()));
  gh.lazySingleton<_i81.ProfilesRepository>(
      () => _i82.ProfilesRepositoryImpl(get<_i54.RemoteProfilesProvider>()));
  gh.lazySingleton<_i83.SearchProductsUsecase>(
      () => _i83.SearchProductsUsecase(get<_i79.ProductsRepository>()));
  gh.factory<_i84.ShoppingListCubit>(
      () => _i84.ShoppingListCubit(get<_i66.UpdateShoppingListNameUsecase>()));
  gh.factory<_i85.ShoppingListItemsCubit>(() => _i85.ShoppingListItemsCubit(
      get<_i74.GetShoppingListItemsUsecase>(),
      get<_i65.UpdateShoppingListItemsUsecase>()));
  gh.factory<_i86.ShoppingListsCubit>(() => _i86.ShoppingListsCubit(
      get<_i75.GetShoppingListsUsecase>(),
      get<_i70.CreateShoppingListUsecase>(),
      get<_i72.DeleteShoppingListUsecase>()));
  gh.factory<_i87.UserLocationCreateCubit>(() =>
      _i87.UserLocationCreateCubit(get<_i71.CreateUserLocationUsecase>()));
  gh.factory<_i88.UserLocationsCubit>(() => _i88.UserLocationsCubit(
      get<_i76.GetUserLocationsUsecase>(),
      get<_i73.EnableUserLocationUsecase>()));
  gh.lazySingleton<_i89.GetAuthenticatedUserProfileUsecase>(() =>
      _i89.GetAuthenticatedUserProfileUsecase(get<_i81.ProfilesRepository>()));
  gh.lazySingleton<_i90.GetProductPricesUsecase>(
      () => _i90.GetProductPricesUsecase(get<_i77.PricesRepository>()));
  gh.factory<_i91.ProductDetailCubit>(
      () => _i91.ProductDetailCubit(get<_i90.GetProductPricesUsecase>()));
  gh.factory<_i92.ProductsSearchCubit>(
      () => _i92.ProductsSearchCubit(get<_i83.SearchProductsUsecase>()));
  gh.factory<_i93.AuthenticatedUserProfileCubit>(() =>
      _i93.AuthenticatedUserProfileCubit(
          get<_i89.GetAuthenticatedUserProfileUsecase>()));
  return get;
}

class _$HttpClientModule extends _i94.HttpClientModule {}

class _$ClockModule extends _i95.ClockModule {}

class _$GoogleMapsPlacesModule extends _i96.GoogleMapsPlacesModule {}

class _$GoogleSignInModule extends _i97.GoogleSignInModule {}

class _$SharedPreferencesModule extends _i98.SharedPreferencesModule {}
