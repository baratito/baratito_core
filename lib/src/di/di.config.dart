// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/application/repositories/authentication_repository.dart'
    as _i23;
import '../auth/application/repositories/authorization_repository.dart' as _i15;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i14;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i18;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i22;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i8;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i6;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i4;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i3;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i17;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i16;
import '../shared/domain/clock.dart' as _i27;
import '../shared/infrastructure/api_authorization_service.dart' as _i21;
import '../shared/infrastructure/api_client.dart' as _i13;
import '../shared/infrastructure/api_provider_base_url.dart' as _i7;
import '../shared/infrastructure/http_client.dart' as _i26;
import '../shared/infrastructure/key_value_store.dart' as _i5;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i25;
import '../social_auth/domain/social_authentication_credentials.dart' as _i9;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i20;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i19;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i10;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i24; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final httpClientModule = _$HttpClientModule();
  final clockModule = _$ClockModule();
  gh.factory<_i3.LocalAuthorizationProvider>(() =>
      _i4.KeyValueStoreAuthorizationProvider(get<_i5.KeyValueStore>(),
          get<_i6.AuthorizationCredentialsSerializer>()));
  gh.singleton<_i7.ApiProviderBaseUrl>(_i7.ApiProviderBaseUrl());
  gh.singleton<
          _i8.AuthenticationCredentialsSerializer<
              _i9.SocialAuthenticationCredentials>>(
      _i10.SocialAuthenticationCredentialsSerializer());
  gh.singleton<_i6.AuthorizationCredentialsSerializer>(
      _i6.AuthorizationCredentialsSerializer());
  gh.singleton<_i11.Client>(httpClientModule.httpClient);
  gh.singleton<_i12.Clock>(clockModule.clock);
  gh.singleton<_i13.ApiClient>(_i13.ApiClient(get<_i11.Client>()));
  gh.singleton<_i14.AuthorizationCredentialsExpirationChecker>(
      _i14.AuthorizationCredentialsExpirationChecker(get<_i12.Clock>()));
  gh.singleton<_i15.AuthorizationRepository>(
      _i16.AuthorizationRepositoryImpl(get<_i3.LocalAuthorizationProvider>()));
  gh.singleton<_i17.RemoteAuthorizationRefresher>(
      _i18.ApiAuthorizationRefresher(get<_i13.ApiClient>(),
          get<_i6.AuthorizationCredentialsSerializer>()));
  gh.singleton<_i19.RemoteSocialAuthenticationProvider>(
      _i20.ApiSocialAuthenticationProvider(
          get<_i13.ApiClient>(),
          get<
              _i8.AuthenticationCredentialsSerializer<
                  _i9.SocialAuthenticationCredentials>>(),
          get<_i6.AuthorizationCredentialsSerializer>()));
  gh.singleton<_i21.ApiAuthorizationService>(_i22.ApiAuthorizationServiceImpl(
      get<_i3.LocalAuthorizationProvider>(),
      get<_i14.AuthorizationCredentialsExpirationChecker>(),
      get<_i17.RemoteAuthorizationRefresher>()));
  gh.singleton<
          _i23.AuthenticationRepository<_i9.SocialAuthenticationCredentials>>(
      _i24.SocialAuthenticationRepository(
          get<_i19.RemoteSocialAuthenticationProvider>()));
  gh.singleton<_i25.SocialAuthenticateUsecase>(_i25.SocialAuthenticateUsecase(
      get<_i23.AuthenticationRepository<_i9.SocialAuthenticationCredentials>>(),
      get<_i15.AuthorizationRepository>()));
  return get;
}

class _$HttpClientModule extends _i26.HttpClientModule {}

class _$ClockModule extends _i27.ClockModule {}
