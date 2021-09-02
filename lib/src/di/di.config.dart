// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../auth/application/repositories/authentication_repository.dart'
    as _i23;
import '../auth/application/repositories/authorization_repository.dart' as _i25;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i27;
import '../auth/application/usecases/sign_out_usecase.dart' as _i28;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i12;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i18;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i22;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i4;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i7;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i16;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i15;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i17;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i26;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i31;
import '../shared/domain/clock.dart' as _i33;
import '../shared/infrastructure/api_authorization_service.dart' as _i21;
import '../shared/infrastructure/api_client.dart' as _i11;
import '../shared/infrastructure/api_provider_base_url.dart' as _i3;
import '../shared/infrastructure/http_client.dart' as _i32;
import '../shared/infrastructure/key_value_store.dart' as _i13;
import '../shared/infrastructure/preferences_key_value_store.dart' as _i14;
import '../shared/infrastructure/shared_preferences.dart' as _i34;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i29;
import '../social_auth/domain/social_authentication_credentials.dart' as _i5;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i20;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i19;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i6;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i24;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i30; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final httpClientModule = _$HttpClientModule();
  final clockModule = _$ClockModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.singleton<_i3.ApiProviderBaseUrl>(_i3.ApiProviderBaseUrl());
  gh.singleton<
          _i4.AuthenticationCredentialsSerializer<
              _i5.SocialAuthenticationCredentials>>(
      _i6.SocialAuthenticationCredentialsSerializer());
  gh.singleton<_i7.AuthorizationCredentialsSerializer>(
      _i7.AuthorizationCredentialsSerializer());
  gh.singleton<_i8.Client>(httpClientModule.httpClient);
  gh.singleton<_i9.Clock>(clockModule.clock);
  await gh.factoryAsync<_i10.SharedPreferences>(
      () => sharedPreferencesModule.preferences,
      preResolve: true);
  gh.singleton<_i11.ApiClient>(_i11.ApiClient(get<_i8.Client>()));
  gh.singleton<_i12.AuthorizationCredentialsExpirationChecker>(
      _i12.AuthorizationCredentialsExpirationChecker(get<_i9.Clock>()));
  gh.singleton<_i13.KeyValueStore>(
      _i14.PreferencesKeyValueStore(get<_i10.SharedPreferences>()));
  gh.singleton<_i15.LocalAuthorizationProvider>(
      _i16.KeyValueStoreAuthorizationProvider(get<_i13.KeyValueStore>(),
          get<_i7.AuthorizationCredentialsSerializer>()));
  gh.singleton<_i17.RemoteAuthorizationRefresher>(
      _i18.ApiAuthorizationRefresher(get<_i11.ApiClient>(),
          get<_i7.AuthorizationCredentialsSerializer>()));
  gh.singleton<_i19.RemoteSocialAuthenticationProvider>(
      _i20.ApiSocialAuthenticationProvider(
          get<_i11.ApiClient>(),
          get<
              _i4.AuthenticationCredentialsSerializer<
                  _i5.SocialAuthenticationCredentials>>(),
          get<_i7.AuthorizationCredentialsSerializer>()));
  gh.singleton<_i21.ApiAuthorizationService>(_i22.ApiAuthorizationServiceImpl(
      get<_i15.LocalAuthorizationProvider>(),
      get<_i12.AuthorizationCredentialsExpirationChecker>(),
      get<_i17.RemoteAuthorizationRefresher>()));
  gh.singleton<
          _i23.AuthenticationRepository<_i5.SocialAuthenticationCredentials>>(
      _i24.SocialAuthenticationRepository(
          get<_i19.RemoteSocialAuthenticationProvider>()));
  gh.singleton<_i25.AuthorizationRepository>(
      _i26.AuthorizationRepositoryImpl(get<_i15.LocalAuthorizationProvider>()));
  gh.singleton<_i27.GetAuthorizationCredentialsUsecase>(
      _i27.GetAuthorizationCredentialsUsecase(
          get<_i25.AuthorizationRepository>()));
  gh.singleton<_i28.SignOutUsecase>(
      _i28.SignOutUsecase(get<_i25.AuthorizationRepository>()));
  gh.singleton<_i29.SocialAuthenticateUsecase>(_i29.SocialAuthenticateUsecase(
      get<_i23.AuthenticationRepository<_i5.SocialAuthenticationCredentials>>(),
      get<_i25.AuthorizationRepository>()));
  gh.factory<_i30.SocialAuthenticationCubit>(() =>
      _i30.SocialAuthenticationCubit(get<_i29.SocialAuthenticateUsecase>()));
  gh.factory<_i31.AuthorizationCubit>(() =>
      _i31.AuthorizationCubit(get<_i27.GetAuthorizationCredentialsUsecase>()));
  return get;
}

class _$HttpClientModule extends _i32.HttpClientModule {}

class _$ClockModule extends _i33.ClockModule {}

class _$SharedPreferencesModule extends _i34.SharedPreferencesModule {}
