// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_maps_webservice/src/places.dart' as _i16;
import 'package:google_sign_in/google_sign_in.dart' as _i17;
import 'package:http/http.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i22;

import '../auth/application/repositories/authentication_repository.dart'
    as _i39;
import '../auth/application/repositories/authorization_repository.dart' as _i41;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i43;
import '../auth/application/usecases/sign_out_usecase.dart' as _i52;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i27;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i34;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i38;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i9;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i12;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i31;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i30;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i33;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i42;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i57;
import '../location/application/repositories/user_locations_repository.dart'
    as _i55;
import '../location/application/usecases/create_user_location_usecase.dart'
    as _i58;
import '../location/application/usecases/enable_user_location_usecase.dart'
    as _i59;
import '../location/application/usecases/get_user_locations_usecase.dart'
    as _i60;
import '../location/infrastructure/persistence/api_user_locations_provider.dart'
    as _i51;
import '../location/infrastructure/persistence/api_user_locations_provider_endpoint.dart'
    as _i8;
import '../location/infrastructure/persistence/google_maps_places.dart' as _i77;
import '../location/infrastructure/persistence/remote_user_locations_provider.dart'
    as _i50;
import '../location/infrastructure/persistence/user_location_create_model_serializer.dart'
    as _i23;
import '../location/infrastructure/persistence/user_location_model_serializer.dart'
    as _i24;
import '../location/infrastructure/persistence/user_location_update_model_serializer.dart'
    as _i25;
import '../location/infrastructure/repositories/user_locations_repository_impl.dart'
    as _i56;
import '../location/presentation/map_locations_search_cubit/map_locations_search_cubit.dart'
    as _i19;
import '../location/presentation/user_location_create_cubit/user_location_create_cubit.dart'
    as _i68;
import '../location/presentation/user_locations_cubit/user_locations_cubit.dart'
    as _i69;
import '../market/application/repositories/prices_repository.dart' as _i61;
import '../market/application/repositories/products_repository.dart' as _i63;
import '../market/application/usecases/get_product_prices_usecase.dart' as _i71;
import '../market/application/usecases/search_products_usecase.dart' as _i67;
import '../market/infrastructure/persistence/api_prices_provider.dart' as _i45;
import '../market/infrastructure/persistence/api_prices_provider_endpoint.dart'
    as _i3;
import '../market/infrastructure/persistence/api_products_provider.dart'
    as _i47;
import '../market/infrastructure/persistence/api_products_provider_endpoint.dart'
    as _i4;
import '../market/infrastructure/persistence/establishment_model_serializer.dart'
    as _i15;
import '../market/infrastructure/persistence/price_model_serializer.dart'
    as _i32;
import '../market/infrastructure/persistence/product_model_serializer.dart'
    as _i20;
import '../market/infrastructure/persistence/remote_prices_provider.dart'
    as _i44;
import '../market/infrastructure/persistence/remote_products_provider.dart'
    as _i46;
import '../market/infrastructure/repositories/prices_repository_impl.dart'
    as _i62;
import '../market/infrastructure/repositories/products_repository_impl.dart'
    as _i64;
import '../market/presentation/product_detail_cubit/product_detail_cubit.dart'
    as _i72;
import '../market/presentation/products_search_cubit/products_search_cubit.dart'
    as _i73;
import '../profiles/application/repositories/profiles_repository.dart' as _i65;
import '../profiles/application/usecases/get_authenticated_user_profile_usecase.dart'
    as _i70;
import '../profiles/infrastructure/persistence/api_profiles_provider.dart'
    as _i49;
import '../profiles/infrastructure/persistence/api_profiles_provider_endpoint.dart'
    as _i5;
import '../profiles/infrastructure/persistence/profile_model_serializer.dart'
    as _i21;
import '../profiles/infrastructure/persistence/remote_profiles_provider.dart'
    as _i48;
import '../profiles/infrastructure/repositories/profiles_repository_impl.dart'
    as _i66;
import '../profiles/presentation/authenticated_user_profile_cubit/authenticated_user_profile_cubit.dart'
    as _i74;
import '../shared/domain/clock.dart' as _i76;
import '../shared/infrastructure/api_authorization_service.dart' as _i37;
import '../shared/infrastructure/api_client.dart' as _i26;
import '../shared/infrastructure/api_provider_base_url.dart' as _i6;
import '../shared/infrastructure/http_client.dart' as _i75;
import '../shared/infrastructure/key_value_store.dart' as _i28;
import '../shared/infrastructure/preferences_key_value_store.dart' as _i29;
import '../shared/infrastructure/shared_preferences.dart' as _i79;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i53;
import '../social_auth/domain/social_authentication_credentials.dart' as _i10;
import '../social_auth/infrastructure/google_sign_in.dart' as _i78;
import '../social_auth/infrastructure/google_sign_in_service.dart' as _i18;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i36;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider_login_endpoint.dart'
    as _i7;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i35;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i11;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i40;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i54; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.ApiSocialAuthenticationProviderLoginEndpoint>(
      () => _i7.ApiSocialAuthenticationProviderLoginEndpoint());
  gh.lazySingleton<_i8.ApiUserLocationsProviderEndpoint>(
      () => _i8.ApiUserLocationsProviderEndpoint());
  gh.lazySingleton<
          _i9.AuthenticationCredentialsSerializer<
              _i10.SocialAuthenticationCredentials>>(
      () => _i11.SocialAuthenticationCredentialsSerializer());
  gh.lazySingleton<_i12.AuthorizationCredentialsSerializer>(
      () => _i12.AuthorizationCredentialsSerializer());
  gh.lazySingleton<_i13.Client>(() => httpClientModule.httpClient);
  gh.lazySingleton<_i14.Clock>(() => clockModule.clock);
  gh.lazySingleton<_i15.EstablishmentModelSerializer>(
      () => _i15.EstablishmentModelSerializer());
  gh.lazySingleton<_i16.GoogleMapsPlaces>(
      () => googleMapsPlacesModule.googleMapsPlaces);
  gh.factory<_i17.GoogleSignIn>(() => googleSignInModule.signIn);
  gh.lazySingleton<_i18.GoogleSignInService>(
      () => _i18.GoogleSignInService(get<_i17.GoogleSignIn>()));
  gh.factory<_i19.MapLocationsSearchCubit>(
      () => _i19.MapLocationsSearchCubit(get<_i16.GoogleMapsPlaces>()));
  gh.lazySingleton<_i20.ProductModelSerializer>(
      () => _i20.ProductModelSerializer());
  gh.lazySingleton<_i21.ProfileModelSerializer>(
      () => _i21.ProfileModelSerializer());
  await gh.factoryAsync<_i22.SharedPreferences>(
      () => sharedPreferencesModule.preferences,
      preResolve: true);
  gh.lazySingleton<_i23.UserLocationCreateModelSerializer>(
      () => _i23.UserLocationCreateModelSerializer());
  gh.lazySingleton<_i24.UserLocationModelSerializer>(
      () => _i24.UserLocationModelSerializer());
  gh.lazySingleton<_i25.UserLocationUpdateModelSerializer>(
      () => _i25.UserLocationUpdateModelSerializer());
  gh.lazySingleton<_i26.ApiClient>(() => _i26.ApiClient(get<_i13.Client>()));
  gh.lazySingleton<_i27.AuthorizationCredentialsExpirationChecker>(
      () => _i27.AuthorizationCredentialsExpirationChecker(get<_i14.Clock>()));
  gh.lazySingleton<_i28.KeyValueStore>(
      () => _i29.PreferencesKeyValueStore(get<_i22.SharedPreferences>()));
  gh.lazySingleton<_i30.LocalAuthorizationProvider>(() =>
      _i31.KeyValueStoreAuthorizationProvider(get<_i28.KeyValueStore>(),
          get<_i12.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i32.PriceModelSerializer>(() => _i32.PriceModelSerializer(
      get<_i20.ProductModelSerializer>(),
      get<_i15.EstablishmentModelSerializer>()));
  gh.lazySingleton<_i33.RemoteAuthorizationRefresher>(() =>
      _i34.ApiAuthorizationRefresher(get<_i26.ApiClient>(),
          get<_i12.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i35.RemoteSocialAuthenticationProvider>(() =>
      _i36.ApiSocialAuthenticationProvider(
          get<_i26.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i7.ApiSocialAuthenticationProviderLoginEndpoint>(),
          get<
              _i9.AuthenticationCredentialsSerializer<
                  _i10.SocialAuthenticationCredentials>>(),
          get<_i12.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i37.ApiAuthorizationService>(() =>
      _i38.ApiAuthorizationServiceImpl(
          get<_i30.LocalAuthorizationProvider>(),
          get<_i27.AuthorizationCredentialsExpirationChecker>(),
          get<_i33.RemoteAuthorizationRefresher>()));
  gh.lazySingleton<
          _i39.AuthenticationRepository<_i10.SocialAuthenticationCredentials>>(
      () => _i40.SocialAuthenticationRepository(
          get<_i35.RemoteSocialAuthenticationProvider>()));
  gh.lazySingleton<_i41.AuthorizationRepository>(() =>
      _i42.AuthorizationRepositoryImpl(get<_i30.LocalAuthorizationProvider>()));
  gh.lazySingleton<_i43.GetAuthorizationCredentialsUsecase>(() =>
      _i43.GetAuthorizationCredentialsUsecase(
          get<_i41.AuthorizationRepository>()));
  gh.lazySingleton<_i44.RemotePricesProvider>(() =>
      _i45.RemotePricesProviderImpl(
          get<_i26.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i3.ApiPricesProviderEndpoint>(),
          get<_i37.ApiAuthorizationService>(),
          get<_i32.PriceModelSerializer>()));
  gh.lazySingleton<_i46.RemoteProductsProvider>(() =>
      _i47.RemoteProductsProviderImpl(
          get<_i26.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i4.ApiProductsProviderEndpoint>(),
          get<_i37.ApiAuthorizationService>(),
          get<_i20.ProductModelSerializer>()));
  gh.lazySingleton<_i48.RemoteProfilesProvider>(() => _i49.ApiProfilesProvider(
      get<_i26.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i5.ApiProfilesProviderEndpoint>(),
      get<_i37.ApiAuthorizationService>(),
      get<_i21.ProfileModelSerializer>()));
  gh.lazySingleton<_i50.RemoteUserLocationsProvider>(() =>
      _i51.RemoteUserLocationsProviderImpl(
          get<_i26.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i8.ApiUserLocationsProviderEndpoint>(),
          get<_i37.ApiAuthorizationService>(),
          get<_i24.UserLocationModelSerializer>(),
          get<_i23.UserLocationCreateModelSerializer>(),
          get<_i25.UserLocationUpdateModelSerializer>()));
  gh.lazySingleton<_i52.SignOutUsecase>(
      () => _i52.SignOutUsecase(get<_i41.AuthorizationRepository>()));
  gh.lazySingleton<_i53.SocialAuthenticateUsecase>(() =>
      _i53.SocialAuthenticateUsecase(
          get<
              _i39.AuthenticationRepository<
                  _i10.SocialAuthenticationCredentials>>(),
          get<_i41.AuthorizationRepository>()));
  gh.factory<_i54.SocialAuthenticationCubit>(() =>
      _i54.SocialAuthenticationCubit(get<_i53.SocialAuthenticateUsecase>()));
  gh.lazySingleton<_i55.UserLocationsRepository>(() =>
      _i56.UserLocationsRepositoryImpl(
          get<_i50.RemoteUserLocationsProvider>()));
  gh.factory<_i57.AuthorizationCubit>(() => _i57.AuthorizationCubit(
      get<_i43.GetAuthorizationCredentialsUsecase>(),
      get<_i52.SignOutUsecase>()));
  gh.lazySingleton<_i58.CreateUserLocationUsecase>(() =>
      _i58.CreateUserLocationUsecase(get<_i55.UserLocationsRepository>()));
  gh.lazySingleton<_i59.EnableUserLocationUsecase>(() =>
      _i59.EnableUserLocationUsecase(get<_i55.UserLocationsRepository>()));
  gh.lazySingleton<_i60.GetUserLocationsUsecase>(
      () => _i60.GetUserLocationsUsecase(get<_i55.UserLocationsRepository>()));
  gh.lazySingleton<_i61.PricesRepository>(
      () => _i62.PricesRepositoryImpl(get<_i44.RemotePricesProvider>()));
  gh.lazySingleton<_i63.ProductsRepository>(
      () => _i64.ProductsRepositoryImpl(get<_i46.RemoteProductsProvider>()));
  gh.lazySingleton<_i65.ProfilesRepository>(
      () => _i66.ProfilesRepositoryImpl(get<_i48.RemoteProfilesProvider>()));
  gh.lazySingleton<_i67.SearchProductsUsecase>(
      () => _i67.SearchProductsUsecase(get<_i63.ProductsRepository>()));
  gh.factory<_i68.UserLocationCreateCubit>(() =>
      _i68.UserLocationCreateCubit(get<_i58.CreateUserLocationUsecase>()));
  gh.factory<_i69.UserLocationsCubit>(() => _i69.UserLocationsCubit(
      get<_i60.GetUserLocationsUsecase>(),
      get<_i59.EnableUserLocationUsecase>()));
  gh.lazySingleton<_i70.GetAuthenticatedUserProfileUsecase>(() =>
      _i70.GetAuthenticatedUserProfileUsecase(get<_i65.ProfilesRepository>()));
  gh.lazySingleton<_i71.GetProductPricesUsecase>(
      () => _i71.GetProductPricesUsecase(get<_i61.PricesRepository>()));
  gh.factory<_i72.ProductDetailCubit>(
      () => _i72.ProductDetailCubit(get<_i71.GetProductPricesUsecase>()));
  gh.factory<_i73.ProductsSearchCubit>(
      () => _i73.ProductsSearchCubit(get<_i67.SearchProductsUsecase>()));
  gh.factory<_i74.AuthenticatedUserProfileCubit>(() =>
      _i74.AuthenticatedUserProfileCubit(
          get<_i70.GetAuthenticatedUserProfileUsecase>()));
  return get;
}

class _$HttpClientModule extends _i75.HttpClientModule {}

class _$ClockModule extends _i76.ClockModule {}

class _$GoogleMapsPlacesModule extends _i77.GoogleMapsPlacesModule {}

class _$GoogleSignInModule extends _i78.GoogleSignInModule {}

class _$SharedPreferencesModule extends _i79.SharedPreferencesModule {}
