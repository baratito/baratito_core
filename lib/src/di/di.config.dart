// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_maps_webservice/src/places.dart' as _i20;
import 'package:google_sign_in/google_sign_in.dart' as _i21;
import 'package:http/http.dart' as _i17;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i29;

import '../auth/application/repositories/authentication_repository.dart'
    as _i53;
import '../auth/application/repositories/authorization_repository.dart' as _i55;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i57;
import '../auth/application/usecases/sign_out_usecase.dart' as _i75;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i39;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i48;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i52;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i13;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i16;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i43;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i42;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i47;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i56;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i83;
import '../location/application/repositories/user_locations_repository.dart'
    as _i81;
import '../location/application/usecases/create_user_location_usecase.dart'
    as _i85;
import '../location/application/usecases/enable_user_location_usecase.dart'
    as _i87;
import '../location/application/usecases/get_user_locations_usecase.dart'
    as _i90;
import '../location/infrastructure/persistence/api_user_locations_provider.dart'
    as _i72;
import '../location/infrastructure/persistence/api_user_locations_provider_endpoint.dart'
    as _i12;
import '../location/infrastructure/persistence/google_maps_places.dart'
    as _i121;
import '../location/infrastructure/persistence/remote_user_locations_provider.dart'
    as _i71;
import '../location/infrastructure/persistence/user_location_create_model_serializer.dart'
    as _i35;
import '../location/infrastructure/persistence/user_location_model_serializer.dart'
    as _i36;
import '../location/infrastructure/persistence/user_location_update_model_serializer.dart'
    as _i37;
import '../location/infrastructure/repositories/user_locations_repository_impl.dart'
    as _i82;
import '../location/presentation/map_locations_search_cubit/map_locations_search_cubit.dart'
    as _i23;
import '../location/presentation/user_location_create_cubit/user_location_create_cubit.dart'
    as _i106;
import '../location/presentation/user_locations_cubit/user_locations_cubit.dart'
    as _i107;
import '../market/application/repositories/prices_repository.dart' as _i91;
import '../market/application/repositories/products_repository.dart' as _i93;
import '../market/application/usecases/get_product_prices_usecase.dart'
    as _i110;
import '../market/application/usecases/get_product_recommendations_usecase.dart'
    as _i111;
import '../market/application/usecases/search_products_usecase.dart' as _i101;
import '../market/infrastructure/persistence/api_prices_provider.dart' as _i60;
import '../market/infrastructure/persistence/api_prices_provider_endpoint.dart'
    as _i3;
import '../market/infrastructure/persistence/api_products_provider.dart'
    as _i62;
import '../market/infrastructure/persistence/api_products_provider_endpoint.dart'
    as _i4;
import '../market/infrastructure/persistence/establishment_model_serializer.dart'
    as _i19;
import '../market/infrastructure/persistence/price_model_serializer.dart'
    as _i44;
import '../market/infrastructure/persistence/product_model_serializer.dart'
    as _i24;
import '../market/infrastructure/persistence/remote_prices_provider.dart'
    as _i59;
import '../market/infrastructure/persistence/remote_products_provider.dart'
    as _i61;
import '../market/infrastructure/repositories/prices_repository_impl.dart'
    as _i92;
import '../market/infrastructure/repositories/products_repository_impl.dart'
    as _i94;
import '../market/presentation/product_detail_cubit/product_detail_cubit.dart'
    as _i114;
import '../market/presentation/product_recommendations_cubit/product_recommendations_cubit.dart'
    as _i115;
import '../market/presentation/products_search_cubit/products_search_cubit.dart'
    as _i116;
import '../profiles/application/repositories/profiles_repository.dart' as _i95;
import '../profiles/application/usecases/get_authenticated_user_profile_usecase.dart'
    as _i109;
import '../profiles/infrastructure/persistence/api_profiles_provider.dart'
    as _i64;
import '../profiles/infrastructure/persistence/api_profiles_provider_endpoint.dart'
    as _i5;
import '../profiles/infrastructure/persistence/profile_model_serializer.dart'
    as _i25;
import '../profiles/infrastructure/persistence/remote_profiles_provider.dart'
    as _i63;
import '../profiles/infrastructure/repositories/profiles_repository_impl.dart'
    as _i96;
import '../profiles/presentation/authenticated_user_profile_cubit/authenticated_user_profile_cubit.dart'
    as _i118;
import '../shared/domain/clock.dart' as _i120;
import '../shared/infrastructure/api_authorization_service.dart' as _i51;
import '../shared/infrastructure/api_client.dart' as _i38;
import '../shared/infrastructure/api_provider_base_url.dart' as _i6;
import '../shared/infrastructure/http_client.dart' as _i119;
import '../shared/infrastructure/key_value_store.dart' as _i40;
import '../shared/infrastructure/preferences_key_value_store.dart' as _i41;
import '../shared/infrastructure/shared_preferences.dart' as _i123;
import '../shopping/application/repositories/purchase_list_items_repository.dart'
    as _i97;
import '../shopping/application/repositories/purchase_lists_repository.dart'
    as _i99;
import '../shopping/application/repositories/shopping_lists_repository.dart'
    as _i73;
import '../shopping/application/usecases/complete_purchase_usecase.dart'
    as _i108;
import '../shopping/application/usecases/create_shopping_list_usecase.dart'
    as _i84;
import '../shopping/application/usecases/delete_shopping_list_usecase.dart'
    as _i86;
import '../shopping/application/usecases/get_purchase_summaries_usecase.dart'
    as _i112;
import '../shopping/application/usecases/get_shopping_list_items_usecase.dart'
    as _i88;
import '../shopping/application/usecases/get_shopping_lists_usecase.dart'
    as _i89;
import '../shopping/application/usecases/start_purchase_usecase.dart' as _i78;
import '../shopping/application/usecases/update_purchase_list_item_bought_state_usecase.dart'
    as _i105;
import '../shopping/application/usecases/update_shopping_list_items_usecase.dart'
    as _i79;
import '../shopping/application/usecases/update_shopping_list_name_usecase.dart'
    as _i80;
import '../shopping/infrastructure/persistence/api_purchase_list_items_provider.dart'
    as _i66;
import '../shopping/infrastructure/persistence/api_purchase_list_items_provider_endpoint.dart'
    as _i7;
import '../shopping/infrastructure/persistence/api_purchase_lists_provider.dart'
    as _i68;
import '../shopping/infrastructure/persistence/api_purchase_lists_provider_endpoint.dart'
    as _i8;
import '../shopping/infrastructure/persistence/api_purchase_summary_provider_endpoint.dart'
    as _i9;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider.dart'
    as _i70;
import '../shopping/infrastructure/persistence/api_shopping_lists_provider_endpoint.dart'
    as _i10;
import '../shopping/infrastructure/persistence/monthly_purchase_summary_model_serializer.dart'
    as _i58;
import '../shopping/infrastructure/persistence/purchase_list_establishment_model_serializer.dart'
    as _i45;
import '../shopping/infrastructure/persistence/purchase_list_item_model_serializer.dart'
    as _i26;
import '../shopping/infrastructure/persistence/purchase_list_item_update_model_serializer.dart'
    as _i27;
import '../shopping/infrastructure/persistence/purchase_list_model_serializer.dart'
    as _i46;
import '../shopping/infrastructure/persistence/purchase_settings_serializer.dart'
    as _i28;
import '../shopping/infrastructure/persistence/remote_purchase_list_items_provider.dart'
    as _i65;
import '../shopping/infrastructure/persistence/remote_purchase_lists_provider.dart'
    as _i67;
import '../shopping/infrastructure/persistence/remote_shopping_lists_provider.dart'
    as _i69;
import '../shopping/infrastructure/persistence/shopping_list_create_model_serializer.dart'
    as _i30;
import '../shopping/infrastructure/persistence/shopping_list_item_model_serializer.dart'
    as _i31;
import '../shopping/infrastructure/persistence/shopping_list_item_update_model_serializer.dart'
    as _i32;
import '../shopping/infrastructure/persistence/shopping_list_model_serializer.dart'
    as _i33;
import '../shopping/infrastructure/persistence/shopping_list_update_model_serializer.dart'
    as _i34;
import '../shopping/infrastructure/repositories/purchase_list_items_repository_impl.dart'
    as _i98;
import '../shopping/infrastructure/repositories/purchase_lists_repository_impl.dart'
    as _i100;
import '../shopping/infrastructure/repositories/shopping_lists_repository_impl.dart'
    as _i74;
import '../shopping/presentation/monthly_purchase_summaries_cubit/monthly_purchase_summaries_cubit.dart'
    as _i113;
import '../shopping/presentation/purchase_cubit/purchase_cubit.dart' as _i117;
import '../shopping/presentation/shopping_list_cubit/shopping_list_cubit.dart'
    as _i102;
import '../shopping/presentation/shopping_list_items_cubit/shopping_list_items_cubit.dart'
    as _i103;
import '../shopping/presentation/shopping_lists_cubit/shopping_lists_cubit.dart'
    as _i104;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i76;
import '../social_auth/domain/social_authentication_credentials.dart' as _i14;
import '../social_auth/infrastructure/google_sign_in.dart' as _i122;
import '../social_auth/infrastructure/google_sign_in_service.dart' as _i22;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i50;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider_login_endpoint.dart'
    as _i11;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i49;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i15;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i54;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i77; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.ApiPurchaseSummaryProviderEndpoint>(
      () => _i9.ApiPurchaseSummaryProviderEndpoint());
  gh.lazySingleton<_i10.ApiShoppingListsProviderEndpoint>(
      () => _i10.ApiShoppingListsProviderEndpoint());
  gh.lazySingleton<_i11.ApiSocialAuthenticationProviderLoginEndpoint>(
      () => _i11.ApiSocialAuthenticationProviderLoginEndpoint());
  gh.lazySingleton<_i12.ApiUserLocationsProviderEndpoint>(
      () => _i12.ApiUserLocationsProviderEndpoint());
  gh.lazySingleton<
          _i13.AuthenticationCredentialsSerializer<
              _i14.SocialAuthenticationCredentials>>(
      () => _i15.SocialAuthenticationCredentialsSerializer());
  gh.lazySingleton<_i16.AuthorizationCredentialsSerializer>(
      () => _i16.AuthorizationCredentialsSerializer());
  gh.lazySingleton<_i17.Client>(() => httpClientModule.httpClient);
  gh.lazySingleton<_i18.Clock>(() => clockModule.clock);
  gh.lazySingleton<_i19.EstablishmentModelSerializer>(
      () => _i19.EstablishmentModelSerializer());
  gh.lazySingleton<_i20.GoogleMapsPlaces>(
      () => googleMapsPlacesModule.googleMapsPlaces);
  gh.factory<_i21.GoogleSignIn>(() => googleSignInModule.signIn);
  gh.lazySingleton<_i22.GoogleSignInService>(
      () => _i22.GoogleSignInService(get<_i21.GoogleSignIn>()));
  gh.factory<_i23.MapLocationsSearchCubit>(
      () => _i23.MapLocationsSearchCubit(get<_i20.GoogleMapsPlaces>()));
  gh.lazySingleton<_i24.ProductModelSerializer>(
      () => _i24.ProductModelSerializer());
  gh.lazySingleton<_i25.ProfileModelSerializer>(
      () => _i25.ProfileModelSerializer());
  gh.lazySingleton<_i26.PurchaseListItemModelSerializer>(
      () => _i26.PurchaseListItemModelSerializer());
  gh.lazySingleton<_i27.PurchaseListItemUpdateModelSerializer>(
      () => _i27.PurchaseListItemUpdateModelSerializer());
  gh.lazySingleton<_i28.PurchaseSettingsSerializer>(
      () => _i28.PurchaseSettingsSerializer());
  await gh.factoryAsync<_i29.SharedPreferences>(
      () => sharedPreferencesModule.preferences,
      preResolve: true);
  gh.lazySingleton<_i30.ShoppingListCreateModelSerializer>(
      () => _i30.ShoppingListCreateModelSerializer());
  gh.lazySingleton<_i31.ShoppingListItemModelSerializer>(() =>
      _i31.ShoppingListItemModelSerializer(get<_i24.ProductModelSerializer>()));
  gh.lazySingleton<_i32.ShoppingListItemUpdateModelSerializer>(
      () => _i32.ShoppingListItemUpdateModelSerializer());
  gh.lazySingleton<_i33.ShoppingListModelSerializer>(
      () => _i33.ShoppingListModelSerializer());
  gh.lazySingleton<_i34.ShoppingListUpdateModelSerializer>(
      () => _i34.ShoppingListUpdateModelSerializer());
  gh.lazySingleton<_i35.UserLocationCreateModelSerializer>(
      () => _i35.UserLocationCreateModelSerializer());
  gh.lazySingleton<_i36.UserLocationModelSerializer>(
      () => _i36.UserLocationModelSerializer());
  gh.lazySingleton<_i37.UserLocationUpdateModelSerializer>(
      () => _i37.UserLocationUpdateModelSerializer());
  gh.lazySingleton<_i38.ApiClient>(() => _i38.ApiClient(get<_i17.Client>()));
  gh.lazySingleton<_i39.AuthorizationCredentialsExpirationChecker>(
      () => _i39.AuthorizationCredentialsExpirationChecker(get<_i18.Clock>()));
  gh.lazySingleton<_i40.KeyValueStore>(
      () => _i41.PreferencesKeyValueStore(get<_i29.SharedPreferences>()));
  gh.lazySingleton<_i42.LocalAuthorizationProvider>(() =>
      _i43.KeyValueStoreAuthorizationProvider(get<_i40.KeyValueStore>(),
          get<_i16.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i44.PriceModelSerializer>(() => _i44.PriceModelSerializer(
      get<_i24.ProductModelSerializer>(),
      get<_i19.EstablishmentModelSerializer>()));
  gh.lazySingleton<_i45.PurchaseListItemEstablishmentModelSerializer>(() =>
      _i45.PurchaseListItemEstablishmentModelSerializer(
          get<_i19.EstablishmentModelSerializer>(),
          get<_i26.PurchaseListItemModelSerializer>()));
  gh.lazySingleton<_i46.PurchaseListModelSerializer>(() =>
      _i46.PurchaseListModelSerializer(
          get<_i45.PurchaseListItemEstablishmentModelSerializer>()));
  gh.lazySingleton<_i47.RemoteAuthorizationRefresher>(() =>
      _i48.ApiAuthorizationRefresher(get<_i38.ApiClient>(),
          get<_i16.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i49.RemoteSocialAuthenticationProvider>(() =>
      _i50.ApiSocialAuthenticationProvider(
          get<_i38.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i11.ApiSocialAuthenticationProviderLoginEndpoint>(),
          get<
              _i13.AuthenticationCredentialsSerializer<
                  _i14.SocialAuthenticationCredentials>>(),
          get<_i16.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i51.ApiAuthorizationService>(() =>
      _i52.ApiAuthorizationServiceImpl(
          get<_i42.LocalAuthorizationProvider>(),
          get<_i39.AuthorizationCredentialsExpirationChecker>(),
          get<_i47.RemoteAuthorizationRefresher>()));
  gh.lazySingleton<
          _i53.AuthenticationRepository<_i14.SocialAuthenticationCredentials>>(
      () => _i54.SocialAuthenticationRepository(
          get<_i49.RemoteSocialAuthenticationProvider>()));
  gh.lazySingleton<_i55.AuthorizationRepository>(() =>
      _i56.AuthorizationRepositoryImpl(get<_i42.LocalAuthorizationProvider>()));
  gh.lazySingleton<_i57.GetAuthorizationCredentialsUsecase>(() =>
      _i57.GetAuthorizationCredentialsUsecase(
          get<_i55.AuthorizationRepository>()));
  gh.lazySingleton<_i58.MonthlyPurchaseSummaryModelSerializer>(() =>
      _i58.MonthlyPurchaseSummaryModelSerializer(
          get<_i46.PurchaseListModelSerializer>()));
  gh.lazySingleton<_i59.RemotePricesProvider>(() => _i60.ApiPricesProvider(
      get<_i38.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i3.ApiPricesProviderEndpoint>(),
      get<_i51.ApiAuthorizationService>(),
      get<_i44.PriceModelSerializer>()));
  gh.lazySingleton<_i61.RemoteProductsProvider>(() =>
      _i62.RemoteProductsProviderImpl(
          get<_i38.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i4.ApiProductsProviderEndpoint>(),
          get<_i51.ApiAuthorizationService>(),
          get<_i24.ProductModelSerializer>()));
  gh.lazySingleton<_i63.RemoteProfilesProvider>(() => _i64.ApiProfilesProvider(
      get<_i38.ApiClient>(),
      get<_i6.ApiProviderBaseUrl>(),
      get<_i5.ApiProfilesProviderEndpoint>(),
      get<_i51.ApiAuthorizationService>(),
      get<_i25.ProfileModelSerializer>()));
  gh.lazySingleton<_i65.RemotePurchaseListItemsProvider>(() =>
      _i66.ApiPurchaseListItemsProvider(
          get<_i38.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i7.ApiPurchaseListItemsProviderEndpoint>(),
          get<_i51.ApiAuthorizationService>(),
          get<_i26.PurchaseListItemModelSerializer>(),
          get<_i27.PurchaseListItemUpdateModelSerializer>()));
  gh.lazySingleton<_i67.RemotePurchaseListsProvider>(() =>
      _i68.ApiPurchaseListsProvider(
          get<_i38.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i8.ApiPurchaseListsProviderEndpoint>(),
          get<_i9.ApiPurchaseSummaryProviderEndpoint>(),
          get<_i51.ApiAuthorizationService>(),
          get<_i46.PurchaseListModelSerializer>(),
          get<_i58.MonthlyPurchaseSummaryModelSerializer>()));
  gh.lazySingleton<_i69.RemoteShoppingListsProvider>(() =>
      _i70.ApiShoppingListsProvider(
          get<_i38.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i10.ApiShoppingListsProviderEndpoint>(),
          get<_i51.ApiAuthorizationService>(),
          get<_i33.ShoppingListModelSerializer>(),
          get<_i30.ShoppingListCreateModelSerializer>(),
          get<_i34.ShoppingListUpdateModelSerializer>(),
          get<_i32.ShoppingListItemUpdateModelSerializer>(),
          get<_i31.ShoppingListItemModelSerializer>(),
          get<_i28.PurchaseSettingsSerializer>(),
          get<_i46.PurchaseListModelSerializer>()));
  gh.lazySingleton<_i71.RemoteUserLocationsProvider>(() =>
      _i72.RemoteUserLocationsProviderImpl(
          get<_i38.ApiClient>(),
          get<_i6.ApiProviderBaseUrl>(),
          get<_i12.ApiUserLocationsProviderEndpoint>(),
          get<_i51.ApiAuthorizationService>(),
          get<_i36.UserLocationModelSerializer>(),
          get<_i35.UserLocationCreateModelSerializer>(),
          get<_i37.UserLocationUpdateModelSerializer>()));
  gh.lazySingleton<_i73.ShoppingListsRepository>(() =>
      _i74.ShoppingListsRespositoryImpl(
          get<_i69.RemoteShoppingListsProvider>()));
  gh.lazySingleton<_i75.SignOutUsecase>(
      () => _i75.SignOutUsecase(get<_i55.AuthorizationRepository>()));
  gh.lazySingleton<_i76.SocialAuthenticateUsecase>(() =>
      _i76.SocialAuthenticateUsecase(
          get<
              _i53.AuthenticationRepository<
                  _i14.SocialAuthenticationCredentials>>(),
          get<_i55.AuthorizationRepository>()));
  gh.factory<_i77.SocialAuthenticationCubit>(() =>
      _i77.SocialAuthenticationCubit(get<_i76.SocialAuthenticateUsecase>()));
  gh.lazySingleton<_i78.StartPurchaseUsecase>(
      () => _i78.StartPurchaseUsecase(get<_i73.ShoppingListsRepository>()));
  gh.lazySingleton<_i79.UpdateShoppingListItemsUsecase>(() =>
      _i79.UpdateShoppingListItemsUsecase(get<_i73.ShoppingListsRepository>()));
  gh.lazySingleton<_i80.UpdateShoppingListNameUsecase>(() =>
      _i80.UpdateShoppingListNameUsecase(get<_i73.ShoppingListsRepository>()));
  gh.lazySingleton<_i81.UserLocationsRepository>(() =>
      _i82.UserLocationsRepositoryImpl(
          get<_i71.RemoteUserLocationsProvider>()));
  gh.factory<_i83.AuthorizationCubit>(() => _i83.AuthorizationCubit(
      get<_i57.GetAuthorizationCredentialsUsecase>(),
      get<_i75.SignOutUsecase>()));
  gh.lazySingleton<_i84.CreateShoppingListUsecase>(() =>
      _i84.CreateShoppingListUsecase(get<_i73.ShoppingListsRepository>()));
  gh.lazySingleton<_i85.CreateUserLocationUsecase>(() =>
      _i85.CreateUserLocationUsecase(get<_i81.UserLocationsRepository>()));
  gh.lazySingleton<_i86.DeleteShoppingListUsecase>(() =>
      _i86.DeleteShoppingListUsecase(get<_i73.ShoppingListsRepository>()));
  gh.lazySingleton<_i87.EnableUserLocationUsecase>(() =>
      _i87.EnableUserLocationUsecase(get<_i81.UserLocationsRepository>()));
  gh.lazySingleton<_i88.GetShoppingListItemsUsecase>(() =>
      _i88.GetShoppingListItemsUsecase(get<_i73.ShoppingListsRepository>()));
  gh.lazySingleton<_i89.GetShoppingListsUsecase>(
      () => _i89.GetShoppingListsUsecase(get<_i73.ShoppingListsRepository>()));
  gh.lazySingleton<_i90.GetUserLocationsUsecase>(
      () => _i90.GetUserLocationsUsecase(get<_i81.UserLocationsRepository>()));
  gh.lazySingleton<_i91.PricesRepository>(
      () => _i92.PricesRepositoryImpl(get<_i59.RemotePricesProvider>()));
  gh.lazySingleton<_i93.ProductsRepository>(
      () => _i94.ProductsRepositoryImpl(get<_i61.RemoteProductsProvider>()));
  gh.lazySingleton<_i95.ProfilesRepository>(
      () => _i96.ProfilesRepositoryImpl(get<_i63.RemoteProfilesProvider>()));
  gh.lazySingleton<_i97.PurchaseListItemsRepository>(() =>
      _i98.PurchaseListItemsRepositoryImpl(
          get<_i65.RemotePurchaseListItemsProvider>()));
  gh.lazySingleton<_i99.PurchaseListsRepository>(() =>
      _i100.PurchaseListRepositoryImpl(
          get<_i67.RemotePurchaseListsProvider>()));
  gh.lazySingleton<_i101.SearchProductsUsecase>(
      () => _i101.SearchProductsUsecase(get<_i93.ProductsRepository>()));
  gh.factory<_i102.ShoppingListCubit>(
      () => _i102.ShoppingListCubit(get<_i80.UpdateShoppingListNameUsecase>()));
  gh.factory<_i103.ShoppingListItemsCubit>(() => _i103.ShoppingListItemsCubit(
      get<_i88.GetShoppingListItemsUsecase>(),
      get<_i79.UpdateShoppingListItemsUsecase>()));
  gh.factory<_i104.ShoppingListsCubit>(() => _i104.ShoppingListsCubit(
      get<_i89.GetShoppingListsUsecase>(),
      get<_i84.CreateShoppingListUsecase>(),
      get<_i86.DeleteShoppingListUsecase>()));
  gh.lazySingleton<_i105.UpdatePurchaseListItemBoughtStateUsecase>(() =>
      _i105.UpdatePurchaseListItemBoughtStateUsecase(
          get<_i97.PurchaseListItemsRepository>()));
  gh.factory<_i106.UserLocationCreateCubit>(() =>
      _i106.UserLocationCreateCubit(get<_i85.CreateUserLocationUsecase>()));
  gh.factory<_i107.UserLocationsCubit>(() => _i107.UserLocationsCubit(
      get<_i90.GetUserLocationsUsecase>(),
      get<_i87.EnableUserLocationUsecase>()));
  gh.lazySingleton<_i108.CompletePurchaseUsecase>(
      () => _i108.CompletePurchaseUsecase(get<_i99.PurchaseListsRepository>()));
  gh.lazySingleton<_i109.GetAuthenticatedUserProfileUsecase>(() =>
      _i109.GetAuthenticatedUserProfileUsecase(get<_i95.ProfilesRepository>()));
  gh.lazySingleton<_i110.GetProductPricesUsecase>(
      () => _i110.GetProductPricesUsecase(get<_i91.PricesRepository>()));
  gh.lazySingleton<_i111.GetProductRecommendationsUsecase>(() =>
      _i111.GetProductRecommendationsUsecase(get<_i93.ProductsRepository>()));
  gh.lazySingleton<_i112.GetPurchaseSummariesUsecase>(() =>
      _i112.GetPurchaseSummariesUsecase(get<_i99.PurchaseListsRepository>()));
  gh.factory<_i113.MonthlyPurchaseSummariesCubit>(() =>
      _i113.MonthlyPurchaseSummariesCubit(
          get<_i112.GetPurchaseSummariesUsecase>()));
  gh.factory<_i114.ProductDetailCubit>(
      () => _i114.ProductDetailCubit(get<_i110.GetProductPricesUsecase>()));
  gh.factory<_i115.ProductRecommendationsCubit>(() =>
      _i115.ProductRecommendationsCubit(
          get<_i111.GetProductRecommendationsUsecase>()));
  gh.factory<_i116.ProductsSearchCubit>(
      () => _i116.ProductsSearchCubit(get<_i101.SearchProductsUsecase>()));
  gh.factory<_i117.PurchaseCubit>(() => _i117.PurchaseCubit(
      get<_i78.StartPurchaseUsecase>(),
      get<_i108.CompletePurchaseUsecase>(),
      get<_i105.UpdatePurchaseListItemBoughtStateUsecase>()));
  gh.factory<_i118.AuthenticatedUserProfileCubit>(() =>
      _i118.AuthenticatedUserProfileCubit(
          get<_i109.GetAuthenticatedUserProfileUsecase>()));
  return get;
}

class _$HttpClientModule extends _i119.HttpClientModule {}

class _$ClockModule extends _i120.ClockModule {}

class _$GoogleMapsPlacesModule extends _i121.GoogleMapsPlacesModule {}

class _$GoogleSignInModule extends _i122.GoogleSignInModule {}

class _$SharedPreferencesModule extends _i123.SharedPreferencesModule {}
