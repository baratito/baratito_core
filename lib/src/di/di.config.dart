// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../auth/application/repositories/authentication_repository.dart'
    as _i26;
import '../auth/application/repositories/authorization_repository.dart' as _i28;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i30;
import '../auth/application/usecases/sign_out_usecase.dart' as _i33;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i15;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i21;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i25;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i4;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i7;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i19;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i18;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i20;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i29;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i36;
import '../profiles/application/models/profile_model.dart' as _i11;
import '../profiles/application/repositories/profiles_repository.dart' as _i37;
import '../profiles/application/usecases/get_authenticated_user_profile_usecase.dart'
    as _i39;
import '../profiles/infrastructure/persistence/api_profiles_provider.dart'
    as _i32;
import '../profiles/infrastructure/persistence/profile_model_serializer.dart'
    as _i12;
import '../profiles/infrastructure/persistence/remote_profiles_provider.dart'
    as _i31;
import '../profiles/infrastructure/repositories/profiles_repository_impl.dart'
    as _i38;
import '../profiles/presentation/authenticated_user_profile_cubit/authenticated_user_profile_cubit.dart'
    as _i40;
import '../shared/domain/clock.dart' as _i42;
import '../shared/infrastructure/api_authorization_service.dart' as _i24;
import '../shared/infrastructure/api_client.dart' as _i14;
import '../shared/infrastructure/api_provider_base_url.dart' as _i3;
import '../shared/infrastructure/http_client.dart' as _i41;
import '../shared/infrastructure/key_value_store.dart' as _i16;
import '../shared/infrastructure/model_serializer.dart' as _i10;
import '../shared/infrastructure/preferences_key_value_store.dart' as _i17;
import '../shared/infrastructure/shared_preferences.dart' as _i43;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i34;
import '../social_auth/domain/social_authentication_credentials.dart' as _i5;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i23;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i22;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i6;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i27;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i35; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final httpClientModule = _$HttpClientModule();
  final clockModule = _$ClockModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.lazySingleton<_i3.ApiProviderBaseUrl>(() => _i3.ApiProviderBaseUrl());
  gh.lazySingleton<
          _i4.AuthenticationCredentialsSerializer<
              _i5.SocialAuthenticationCredentials>>(
      () => _i6.SocialAuthenticationCredentialsSerializer());
  gh.lazySingleton<_i7.AuthorizationCredentialsSerializer>(
      () => _i7.AuthorizationCredentialsSerializer());
  gh.lazySingleton<_i8.Client>(() => httpClientModule.httpClient);
  gh.lazySingleton<_i9.Clock>(() => clockModule.clock);
  gh.lazySingleton<_i10.ModelSerializer<_i11.ProfileModel>>(
      () => _i12.ProfileModelSerializer());
  await gh.factoryAsync<_i13.SharedPreferences>(
      () => sharedPreferencesModule.preferences,
      preResolve: true);
  gh.lazySingleton<_i14.ApiClient>(() => _i14.ApiClient(get<_i8.Client>()));
  gh.lazySingleton<_i15.AuthorizationCredentialsExpirationChecker>(
      () => _i15.AuthorizationCredentialsExpirationChecker(get<_i9.Clock>()));
  gh.lazySingleton<_i16.KeyValueStore>(
      () => _i17.PreferencesKeyValueStore(get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i18.LocalAuthorizationProvider>(() =>
      _i19.KeyValueStoreAuthorizationProvider(get<_i16.KeyValueStore>(),
          get<_i7.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i20.RemoteAuthorizationRefresher>(() =>
      _i21.ApiAuthorizationRefresher(get<_i14.ApiClient>(),
          get<_i7.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i22.RemoteSocialAuthenticationProvider>(() =>
      _i23.ApiSocialAuthenticationProvider(
          get<_i14.ApiClient>(),
          get<
              _i4.AuthenticationCredentialsSerializer<
                  _i5.SocialAuthenticationCredentials>>(),
          get<_i7.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i24.ApiAuthorizationService>(() =>
      _i25.ApiAuthorizationServiceImpl(
          get<_i18.LocalAuthorizationProvider>(),
          get<_i15.AuthorizationCredentialsExpirationChecker>(),
          get<_i20.RemoteAuthorizationRefresher>()));
  gh.lazySingleton<
          _i26.AuthenticationRepository<_i5.SocialAuthenticationCredentials>>(
      () => _i27.SocialAuthenticationRepository(
          get<_i22.RemoteSocialAuthenticationProvider>()));
  gh.lazySingleton<_i28.AuthorizationRepository>(() =>
      _i29.AuthorizationRepositoryImpl(get<_i18.LocalAuthorizationProvider>()));
  gh.lazySingleton<_i30.GetAuthorizationCredentialsUsecase>(() =>
      _i30.GetAuthorizationCredentialsUsecase(
          get<_i28.AuthorizationRepository>()));
  gh.lazySingleton<_i31.RemoteProfilesProvider>(() => _i32.ApiProfilesProvider(
      get<_i14.ApiClient>(),
      get<_i24.ApiAuthorizationService>(),
      get<_i10.ModelSerializer<_i11.ProfileModel>>()));
  gh.lazySingleton<_i33.SignOutUsecase>(
      () => _i33.SignOutUsecase(get<_i28.AuthorizationRepository>()));
  gh.lazySingleton<
      _i34
          .SocialAuthenticateUsecase>(() => _i34.SocialAuthenticateUsecase(
      get<_i26.AuthenticationRepository<_i5.SocialAuthenticationCredentials>>(),
      get<_i28.AuthorizationRepository>()));
  gh.factory<_i35.SocialAuthenticationCubit>(() =>
      _i35.SocialAuthenticationCubit(get<_i34.SocialAuthenticateUsecase>()));
  gh.factory<_i36.AuthorizationCubit>(() =>
      _i36.AuthorizationCubit(get<_i30.GetAuthorizationCredentialsUsecase>()));
  gh.lazySingleton<_i37.ProfilesRepository>(
      () => _i38.ProfilesRepositoryImpl(get<_i31.RemoteProfilesProvider>()));
  gh.lazySingleton<_i39.GetAuthenticatedUserProfileUsecase>(() =>
      _i39.GetAuthenticatedUserProfileUsecase(get<_i37.ProfilesRepository>()));
  gh.factory<_i40.AuthenticatedUserProfileCubit>(() =>
      _i40.AuthenticatedUserProfileCubit(
          get<_i39.GetAuthenticatedUserProfileUsecase>()));
  return get;
}

class _$HttpClientModule extends _i41.HttpClientModule {}

class _$ClockModule extends _i42.ClockModule {}

class _$SharedPreferencesModule extends _i43.SharedPreferencesModule {}
