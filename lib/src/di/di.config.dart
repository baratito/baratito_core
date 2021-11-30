// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_maps_webservice/src/places.dart' as _i19;
import 'package:google_sign_in/google_sign_in.dart' as _i20;
import 'package:http/http.dart' as _i16;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i28;

import '../auth/application/repositories/authentication_repository.dart'
    as _i52;
import '../auth/application/repositories/authorization_repository.dart' as _i54;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i56;
import '../auth/application/usecases/sign_out_usecase.dart' as _i73;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i38;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i47;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i51;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i12;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i15;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i42;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i41;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i46;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i55;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i81;
import '../location/application/repositories/user_locations_repository.dart'
    as _i79;
import '../location/application/usecases/create_user_location_usecase.dart'
    as _i83;
import '../location/application/usecases/enable_user_location_usecase.dart'
    as _i85;
import '../location/application/usecases/get_user_locations_usecase.dart'
    as _i88;
import '../location/infrastructure/persistence/api_user_locations_provider.dart'
    as _i70;
import '../location/infrastructure/persistence/api_user_locations_provider_endpoint.dart'
    as _i11;
import '../location/infrastructure/persistence/google_maps_places.dart'
    as _i117;
import '../location/infrastructure/persistence/remote_user_locations_provider.dart'
    as _i69;
import '../location/infrastructure/persistence/user_location_create_model_serializer.dart'
    as _i34;
import '../location/infrastructure/persistence/user_location_model_serializer.dart'
    as _i35;
import '../location/infrastructure/persistence/user_location_update_model_serializer.dart'
    as _i36;
import '../location/infrastructure/repositories/user_locations_repository_impl.dart'
    as _i80;
import '../location/presentation/map_locations_search_cubit/map_locations_search_cubit.dart'
    as _i22;
import '../location/presentation/user_location_create_cubit/user_location_create_cubit.dart'
    as _i104;
import '../location/presentation/user_locations_cubit/user_locations_cubit.dart'
    as _i105;
import '../market/application/repositories/prices_repository.dart' as _i89;
import '../market/application/repositories/products_repository.dart' as _i91;
import '../market/application/usecases/get_product_prices_usecase.dart'
    as _i108;
import '../market/application/usecases/get_product_recommendations_usecase.dart'
    as _i109;
import '../market/application/usecases/search_products_usecase.dart' as _i99;
import '../market/infrastructure/persistence/api_prices_provider.dart' as _i58;
import '../market/infrastructure/persistence/api_prices_provider_endpoint.dart'
    as _i3;
import '../market/infrastructure/persistence/api_products_provider.dart'
    as _i60;
import '../market/infrastructure/persistence/api_products_provider_endpoint.dart'
    as _i4;
import '../market/infrastructure/persistence/establishment_model_serializer.dart'
    as _i18;
import '../market/infrastructure/persistence/price_model_serializer.dart'
    as _i43;
import '../market/infrastructure/persistence/product_model_serializer.dart'
    as _i23;
import '../market/infrastructure/persistence/remote_prices_provider.dart'
    as _i57;
import '../market/infrastructure/persistence/remote_products_provider.dart'
    as _i59;
import '../market/infrastructure/repositories/prices_repository_impl.dart'
    as _i90;
import '../market/infrastructure/repositories/products_repository_impl.dart'
    as _i92;
import '../market/presentation/product_detail_cubit/product_detail_cubit.dart'
    as _i110;
import '../market/presentation/product_recommendations_cubit/product_recommendations_cubit.dart'
    as _i111;
import '../market/presentation/products_search_cubit/products_search_cubit.dart'
    as _i112;
import '../profiles/application/repositories/profiles_repository.dart' as _i93;
import '../profiles/application/usecases/get_authenticated_user_profile_usecase.dart'
    as _i107;
import '../profiles/infrastructure/persistence/api_profiles_provider.dart'
    as _i62;
import '../profiles/infrastructure/persistence/api_profiles_provider_endpoint.dart'
    as _i5;
import '../profiles/infrastructure/persistence/profile_model_serializer.dart'
    as _i24;
import '../profiles/infrastructure/persistence/remote_profiles_provider.dart'
    as _i61;
import '../profiles/infrastructure/repositories/profiles_repository_impl.dart'
    as _i94;
import '../profiles/presentation/authenticated_user_profile_cubit/authenticated_user_profile_cubit.dart'
    as _i114;
import '../shared/domain/clock.dart' as _i116;
import '../shared/infrastructure/api_authorization_service.dart' as _i50;
import '../shared/infrastructure/api_client.dart' as _i37;
import '../shared/infrastructure/api_provider_base_url.dart' as _i6;
import '../shared/infrastructure/http_client.dart' as _i115;
import '../shared/infrastructure/key_value_store.dart' as _i39;
import '../shared/infrastructure/preferences_key_value_store.dart' as _i40;
import '../shared/infrastructure/shared_preferences.dart' as _i119;
import '../shopping/application/repositories/purchase_list_items_repository.dart'
    as _i95;
import '../shopping/application/repositories/purchase_lists_repository.dart'
    as _i97;
import '../shopping/application/repositories/shopping_lists_repository.dart'
    as _i71;
import '../shopping/application/usecases/complete_purchase_usecase.dart'
    as _i106;
import '../shopping/application/usecases/create_shopping_list_usecase.dart'
    as _i82;
import '../shopping/application/usecases/delete_shopping_list_usecase.dart'
    as _i84;
import '../shopping/application/usecases/get_shopping_list_items_usecase.dart'
    as _i86;
import '../shopping/application/usecases/get_shopping_lists_usecase.dart'
    as _i87;
import '../shopping/application/usecases/start_purchase_usecase.dart' as _i76;
import '../shopping/application/usecases/update_purchase_list_item_bought_state_usecase.dart'
    as _i103;
import '../shopping/application/usecases/update_shopping_list_items_usecase.dart'
    as _i77;
import '../shopping/application/usecases/update_shopping_list_name_usecase.dart'
    as _i78;
import '../shopping/infrastructure/persistence/api_purchase_list_items_provider.dart'
    as _i64;
import '../shopping/infrastructure/persistence/api_purchase_list_items_provider_endpoint.dart'
    as _i7;
import '../shopping/infrastructure/persistence/api_purchase_lists_provider.dart'
    as _i66;
import '../shopping/infrastructure/persistence/api_purchase_lists_provider_endpoint.dart'
    as _i8;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider.dart'
    as _i68;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider_endpoint.dart'
    as _i9;
import '../shopping/infrastructure/persistence/purchase_list_establishment_model_serializer.dart'
    as _i44;
import '../shopping/infrastructure/persistence/purchase_list_item_model_serializer.dart'
    as _i25;
import '../shopping/infrastructure/persistence/purchase_list_item_update_model_serializer.dart'
    as _i26;
import '../shopping/infrastructure/persistence/purchase_list_model_serializer.dart'
    as _i45;
import '../shopping/infrastructure/persistence/purchase_settings_serializer.dart'
    as _i27;
import '../shopping/infrastructure/persistence/remote_purchase_list_items_provider.dart'
    as _i63;
import '../shopping/infrastructure/persistence/remote_purchase_lists_provider.dart'
    as _i65;
import '../shopping/infrastructure/persistence/remote_shopping_lists_provider.dart'
    as _i67;
import '../shopping/infrastructure/persistence/shopping_list_create_model_serializer.dart'
    as _i29;
import '../shopping/infrastructure/persistence/shopping_list_item_model_serializer.dart'
    as _i30;
import '../shopping/infrastructure/persistence/shopping_list_item_update_model_serializer.dart'
    as _i31;
import '../shopping/infrastructure/persistence/shopping_list_model_serializer.dart'
    as _i32;
import '../shopping/infrastructure/persistence/shopping_list_update_model_serializer.dart'
    as _i33;
import '../shopping/infrastructure/repositories/purchase_list_items_repository_impl.dart'
    as _i96;
import '../shopping/infrastructure/repositories/purchase_lists_repository_impl.dart'
    as _i98;
import '../shopping/infrastructure/repositories/shopping_lists_repository_impl.dart'
    as _i72;
import '../shopping/presentation/purchase_cubit/purchase_cubit.dart' as _i113;
import '../shopping/presentation/shopping_list_cubit/shopping_list_cubit.dart'
    as _i100;
import '../shopping/presentation/shopping_list_items_cubit/shopping_list_items_cubit.dart'
    as _i101;
import '../shopping/presentation/shopping_lists_cubit/shopping_lists_cubit.dart'
    as _i102;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i74;
import '../social_auth/domain/social_authentication_credentials.dart' as _i13;
import '../social_auth/infrastructure/google_sign_in.dart' as _i118;
import '../social_auth/infrastructure/google_sign_in_service.dart' as _i21;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i49;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider_login_endpoint.dart'
    as _i10;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i48;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i14;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i53;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i75; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.ApiPurchaseListItemsProviderEndpoint>(
      () => _i7.ApiPurchaseListItemsProviderEndpoint());
  gh.lazySingleton<_i8.ApiPurchaseListsProviderEndpoint>(
      () => _i8.ApiPurchaseListsProviderEndpoint());
  gh.lazySingleton<_i9.ApiShoppingListsProviderEndpoint>(
      () => _i9.ApiShoppingListsProviderEndpoint());
  gh.lazySingleton<_i10.ApiSocialAuthenticationProviderLoginEndpoint>(
      () => _i10.ApiSocialAuthenticationProviderLoginEndpoint());
  gh.lazySingleton<_i11.ApiUserLocationsProviderEndpoint>(
      () => _i11.ApiUserLocationsProviderEndpoint());
  gh.lazySingleton<
          _i12.AuthenticationCredentialsSerializer<
              _i13.SocialAuthenticationCredentials>>(
      () => _i14.SocialAuthenticationCredentialsSerializer());
  gh.lazySingleton<_i15.AuthorizationCredentialsSerializer>(
      () => _i15.AuthorizationCredentialsSerializer());
  gh.lazySingleton<_i16.Client>(() => httpClientModule.httpClient);
  gh.lazySingleton<_i17.Clock>(() => clockModule.clock);
  gh.lazySingleton<_i18.EstablishmentModelSerializer>(
      () => _i18.EstablishmentModelSerializer());
  gh.lazySingleton<_i19.GoogleMapsPlaces>(
      () => googleMapsPlacesModule.googleMapsPlaces);
  gh.factory<_i20.GoogleSignIn>(() => googleSignInModule.signIn);
  gh.lazySingleton<_i21.GoogleSignInService>(
      () => _i21.GoogleSignInService(get<_i20.GoogleSignIn>()));
  gh.factory<_i22.MapLocationsSearchCubit>(
      () => _i22.MapLocationsSearchCubit(get<_i19.GoogleMapsPlaces>()));
  gh.lazySingleton<_i23.ProductModelSerializer>(
      () => _i23.ProductModelSerializer());
  gh.lazySingleton<_i24.ProfileModelSerializer>(
      () => _i24.ProfileModelSerializer());
  gh.lazySingleton<_i25.PurchaseListItemModelSerializer>(
      () => _i25.PurchaseListItemModelSerializer());
  gh.lazySingleton<_i26.PurchaseListItemUpdateModelSerializer>(
      () => _i26.PurchaseListItemUpdateModelSerializer());
  gh.lazySingleton<_i27.PurchaseSettingsSerializer>(
      () => _i27.PurchaseSettingsSerializer());
  await gh.factoryAsync<_i28.SharedPreferences>(
      () => sharedPreferencesModule.preferences,
      preResolve: true);
  gh.lazySingleton<_i29.ShoppingListCreateModelSerializer>(
      () => _i29.ShoppingListCreateModelSerializer());
  gh.lazySingleton<_i30.ShoppingListItemModelSerializer>(() =>
      _i30.ShoppingListItemModelSerializer(get<_i23.ProductModelSerializer>()));
  gh.lazySingleton<_i31.ShoppingListItemUpdateModelSerializer>(
      () => _i31.ShoppingListItemUpdateModelSerializer());
  gh.lazySingleton<_i32.ShoppingListModelSerializer>(
      () => _i32.ShoppingListModelSerializer());
  gh.lazySingleton<_i33.ShoppingListUpdateModelSerializer>(
      () => _i33.ShoppingListUpdateModelSerializer());
  gh.lazySingleton<_i34.UserLocationCreateModelSerializer>(
      () => _i34.UserLocationCreateModelSerializer());
  gh.lazySingleton<_i35.UserLocationModelSerializer>(
      () => _i35.UserLocationModelSerializer());
  gh.lazySingleton<_i36.UserLocationUpdateModelSerializer>(
      () => _i36.UserLocationUpdateModelSerializer());
  gh.lazySingleton<_i37.ApiClient>(() => _i37.ApiClient(get<_i16.Client>()));
  gh.lazySingleton<_i38.AuthorizationCredentialsExpirationChecker>(
      () => _i38.AuthorizationCredentialsExpirationChecker(get<_i17.Clock>()));
  gh.lazySingleton<_i39.KeyValueStore>(
      () => _i40.PreferencesKeyValueStore(get<_i28.SharedPreferences>()));
  gh.lazySingleton<_i41.LocalAuthorizationProvider>(() =>
      _i42.KeyValueStoreAuthorizationProvider(get<_i39.KeyValueStore>(),
          get<_i15.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i43.PriceModelSerializer>(() => _i43.PriceModelSerializer(
      get<_i23.ProductModelSerializer>(),
      get<_i18.EstablishmentModelSerializer>()));
  gh.lazySingleton<_i44.PurchaseListItemEstablishmentModelSerializer>(() =>
      _i44.PurchaseListItemEstablishmentModelSerializer(
          get<_i18.EstablishmentModelSerializer>(),
          get<_i25.PurchaseListItemModelSerializer>()));
  gh.lazySingleton<_i45.PurchaseListModelSerializer>(() =>
      _i45.PurchaseListModelSerializer(
          get<_i44.PurchaseListItemEstablishmentModelSerializer>()));
  gh.lazySingleton<_i46.RemoteAuthorizationRefresher>(() =>
      _i47.ApiAuthorizationRefresher(get<_i37.ApiClient>(),
          get<_i15.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i48.RemoteSocialAuthenticationProvider>(() =>
      _i49.ApiSocialAuthenticationProvider(
          get<_i37.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i10.ApiSocialAuthenticationProviderLoginEndpoint>(),
          get<
              _i12.AuthenticationCredentialsSerializer<
                  _i13.SocialAuthenticationCredentials>>(),
          get<_i15.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i50.ApiAuthorizationService>(() =>
      _i51.ApiAuthorizationServiceImpl(
          get<_i41.LocalAuthorizationProvider>(),
          get<_i38.AuthorizationCredentialsExpirationChecker>(),
          get<_i46.RemoteAuthorizationRefresher>()));
  gh.lazySingleton<
          _i52.AuthenticationRepository<_i13.SocialAuthenticationCredentials>>(
      () => _i53.SocialAuthenticationRepository(
          get<_i48.RemoteSocialAuthenticationProvider>()));
  gh.lazySingleton<_i54.AuthorizationRepository>(() =>
      _i55.AuthorizationRepositoryImpl(get<_i41.LocalAuthorizationProvider>()));
  gh.lazySingleton<_i56.GetAuthorizationCredentialsUsecase>(() =>
      _i56.GetAuthorizationCredentialsUsecase(
          get<_i54.AuthorizationRepository>()));
  gh.lazySingleton<_i57.RemotePricesProvider>(() => _i58.ApiPricesProvider(
      get<_i37.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i3.ApiPricesProviderEndpoint>(),
      get<_i50.ApiAuthorizationService>(),
      get<_i43.PriceModelSerializer>()));
  gh.lazySingleton<_i59.RemoteProductsProvider>(() =>
      _i60.RemoteProductsProviderImpl(
          get<_i37.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i4.ApiProductsProviderEndpoint>(),
          get<_i50.ApiAuthorizationService>(),
          get<_i23.ProductModelSerializer>()));
  gh.lazySingleton<_i61.RemoteProfilesProvider>(() => _i62.ApiProfilesProvider(
      get<_i37.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i5.ApiProfilesProviderEndpoint>(),
      get<_i50.ApiAuthorizationService>(),
      get<_i24.ProfileModelSerializer>()));
  gh.lazySingleton<_i63.RemotePurchaseListItemsProvider>(() =>
      _i64.ApiPurchaseListItemsProvider(
          get<_i37.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i7.ApiPurchaseListItemsProviderEndpoint>(),
          get<_i50.ApiAuthorizationService>(),
          get<_i25.PurchaseListItemModelSerializer>(),
          get<_i26.PurchaseListItemUpdateModelSerializer>()));
  gh.lazySingleton<_i65.RemotePurchaseListsProvider>(() =>
      _i66.ApiPurchaseListsProvider(
          get<_i37.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i8.ApiPurchaseListsProviderEndpoint>(),
          get<_i50.ApiAuthorizationService>(),
          get<_i45.PurchaseListModelSerializer>()));
  gh.lazySingleton<_i67.RemoteShoppingListsProvider>(() =>
      _i68.ApiShoppingListsProvider(
          get<_i37.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i9.ApiShoppingListsProviderEndpoint>(),
          get<_i50.ApiAuthorizationService>(),
          get<_i32.ShoppingListModelSerializer>(),
          get<_i29.ShoppingListCreateModelSerializer>(),
          get<_i33.ShoppingListUpdateModelSerializer>(),
          get<_i31.ShoppingListItemUpdateModelSerializer>(),
          get<_i30.ShoppingListItemModelSerializer>(),
          get<_i27.PurchaseSettingsSerializer>(),
          get<_i45.PurchaseListModelSerializer>()));
  gh.lazySingleton<_i69.RemoteUserLocationsProvider>(() =>
      _i70.RemoteUserLocationsProviderImpl(
          get<_i37.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i11.ApiUserLocationsProviderEndpoint>(),
          get<_i50.ApiAuthorizationService>(),
          get<_i35.UserLocationModelSerializer>(),
          get<_i34.UserLocationCreateModelSerializer>(),
          get<_i36.UserLocationUpdateModelSerializer>()));
  gh.lazySingleton<_i71.ShoppingListsRepository>(() =>
      _i72.ShoppingListsRespositoryImpl(
          get<_i67.RemoteShoppingListsProvider>()));
  gh.lazySingleton<_i73.SignOutUsecase>(
      () => _i73.SignOutUsecase(get<_i54.AuthorizationRepository>()));
  gh.lazySingleton<_i74.SocialAuthenticateUsecase>(() =>
      _i74.SocialAuthenticateUsecase(
          get<
              _i52.AuthenticationRepository<
                  _i13.SocialAuthenticationCredentials>>(),
          get<_i54.AuthorizationRepository>()));
  gh.factory<_i75.SocialAuthenticationCubit>(() =>
      _i75.SocialAuthenticationCubit(get<_i74.SocialAuthenticateUsecase>()));
  gh.lazySingleton<_i76.StartPurchaseUsecase>(
      () => _i76.StartPurchaseUsecase(get<_i71.ShoppingListsRepository>()));
  gh.lazySingleton<_i77.UpdateShoppingListItemsUsecase>(() =>
      _i77.UpdateShoppingListItemsUsecase(get<_i71.ShoppingListsRepository>()));
  gh.lazySingleton<_i78.UpdateShoppingListNameUsecase>(() =>
      _i78.UpdateShoppingListNameUsecase(get<_i71.ShoppingListsRepository>()));
  gh.lazySingleton<_i79.UserLocationsRepository>(() =>
      _i80.UserLocationsRepositoryImpl(
          get<_i69.RemoteUserLocationsProvider>()));
  gh.factory<_i81.AuthorizationCubit>(() => _i81.AuthorizationCubit(
      get<_i56.GetAuthorizationCredentialsUsecase>(),
      get<_i73.SignOutUsecase>()));
  gh.lazySingleton<_i82.CreateShoppingListUsecase>(() =>
      _i82.CreateShoppingListUsecase(get<_i71.ShoppingListsRepository>()));
  gh.lazySingleton<_i83.CreateUserLocationUsecase>(() =>
      _i83.CreateUserLocationUsecase(get<_i79.UserLocationsRepository>()));
  gh.lazySingleton<_i84.DeleteShoppingListUsecase>(() =>
      _i84.DeleteShoppingListUsecase(get<_i71.ShoppingListsRepository>()));
  gh.lazySingleton<_i85.EnableUserLocationUsecase>(() =>
      _i85.EnableUserLocationUsecase(get<_i79.UserLocationsRepository>()));
  gh.lazySingleton<_i86.GetShoppingListItemsUsecase>(() =>
      _i86.GetShoppingListItemsUsecase(get<_i71.ShoppingListsRepository>()));
  gh.lazySingleton<_i87.GetShoppingListsUsecase>(
      () => _i87.GetShoppingListsUsecase(get<_i71.ShoppingListsRepository>()));
  gh.lazySingleton<_i88.GetUserLocationsUsecase>(
      () => _i88.GetUserLocationsUsecase(get<_i79.UserLocationsRepository>()));
  gh.lazySingleton<_i89.PricesRepository>(
      () => _i90.PricesRepositoryImpl(get<_i57.RemotePricesProvider>()));
  gh.lazySingleton<_i91.ProductsRepository>(
      () => _i92.ProductsRepositoryImpl(get<_i59.RemoteProductsProvider>()));
  gh.lazySingleton<_i93.ProfilesRepository>(
      () => _i94.ProfilesRepositoryImpl(get<_i61.RemoteProfilesProvider>()));
  gh.lazySingleton<_i95.PurchaseListItemsRepository>(() =>
      _i96.PurchaseListItemsRepositoryImpl(
          get<_i63.RemotePurchaseListItemsProvider>()));
  gh.lazySingleton<_i97.PurchaseListsRepository>(() =>
      _i98.PurchaseListRepositoryImpl(get<_i65.RemotePurchaseListsProvider>()));
  gh.lazySingleton<_i99.SearchProductsUsecase>(
      () => _i99.SearchProductsUsecase(get<_i91.ProductsRepository>()));
  gh.factory<_i100.ShoppingListCubit>(
      () => _i100.ShoppingListCubit(get<_i78.UpdateShoppingListNameUsecase>()));
  gh.factory<_i101.ShoppingListItemsCubit>(() => _i101.ShoppingListItemsCubit(
      get<_i86.GetShoppingListItemsUsecase>(),
      get<_i77.UpdateShoppingListItemsUsecase>()));
  gh.factory<_i102.ShoppingListsCubit>(() => _i102.ShoppingListsCubit(
      get<_i87.GetShoppingListsUsecase>(),
      get<_i82.CreateShoppingListUsecase>(),
      get<_i84.DeleteShoppingListUsecase>()));
  gh.lazySingleton<_i103.UpdatePurchaseListItemBoughtStateUsecase>(() =>
      _i103.UpdatePurchaseListItemBoughtStateUsecase(
          get<_i95.PurchaseListItemsRepository>()));
  gh.factory<_i104.UserLocationCreateCubit>(() =>
      _i104.UserLocationCreateCubit(get<_i83.CreateUserLocationUsecase>()));
  gh.factory<_i105.UserLocationsCubit>(() => _i105.UserLocationsCubit(
      get<_i88.GetUserLocationsUsecase>(),
      get<_i85.EnableUserLocationUsecase>()));
  gh.lazySingleton<_i106.CompletePurchaseUsecase>(
      () => _i106.CompletePurchaseUsecase(get<_i97.PurchaseListsRepository>()));
  gh.lazySingleton<_i107.GetAuthenticatedUserProfileUsecase>(() =>
      _i107.GetAuthenticatedUserProfileUsecase(get<_i93.ProfilesRepository>()));
  gh.lazySingleton<_i108.GetProductPricesUsecase>(
      () => _i108.GetProductPricesUsecase(get<_i89.PricesRepository>()));
  gh.lazySingleton<_i109.GetProductRecommendationsUsecase>(() =>
      _i109.GetProductRecommendationsUsecase(get<_i91.ProductsRepository>()));
  gh.factory<_i110.ProductDetailCubit>(
      () => _i110.ProductDetailCubit(get<_i108.GetProductPricesUsecase>()));
  gh.factory<_i111.ProductRecommendationsCubit>(() =>
      _i111.ProductRecommendationsCubit(
          get<_i109.GetProductRecommendationsUsecase>()));
  gh.factory<_i112.ProductsSearchCubit>(
      () => _i112.ProductsSearchCubit(get<_i99.SearchProductsUsecase>()));
  gh.factory<_i113.PurchaseCubit>(() => _i113.PurchaseCubit(
      get<_i76.StartPurchaseUsecase>(),
      get<_i106.CompletePurchaseUsecase>(),
      get<_i103.UpdatePurchaseListItemBoughtStateUsecase>()));
  gh.factory<_i114.AuthenticatedUserProfileCubit>(() =>
      _i114.AuthenticatedUserProfileCubit(
          get<_i107.GetAuthenticatedUserProfileUsecase>()));
  return get;
}

class _$HttpClientModule extends _i115.HttpClientModule {}

class _$ClockModule extends _i116.ClockModule {}

class _$GoogleMapsPlacesModule extends _i117.GoogleMapsPlacesModule {}

class _$GoogleSignInModule extends _i118.GoogleSignInModule {}

class _$SharedPreferencesModule extends _i119.SharedPreferencesModule {}
