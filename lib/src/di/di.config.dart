// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i15;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/application/repositories/authentication_repository.dart'
    as _i28;
import '../auth/application/repositories/authorization_repository.dart' as _i19;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i8;
import '../auth/application/usecases/sign_out_usecase.dart' as _i25;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i18;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i22;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i27;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i12;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i6;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i4;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i3;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i21;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i20;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i7;
import '../shared/domain/clock.dart' as _i31;
import '../shared/infrastructure/api_authorization_service.dart' as _i26;
import '../shared/infrastructure/api_client.dart' as _i17;
import '../shared/infrastructure/api_provider_base_url.dart' as _i11;
import '../shared/infrastructure/http_client.dart' as _i30;
import '../shared/infrastructure/key_value_store.dart' as _i5;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i10;
import '../social_auth/domain/social_authentication_credentials.dart' as _i13;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i24;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i23;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i14;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i29;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i7.AuthorizationCubit>(() =>
      _i7.AuthorizationCubit(get<_i8.GetAuthorizationCredentialsUsecase>()));
  gh.factory<_i9.SocialAuthenticationCubit>(() =>
      _i9.SocialAuthenticationCubit(get<_i10.SocialAuthenticateUsecase>()));
  gh.singleton<_i11.ApiProviderBaseUrl>(_i11.ApiProviderBaseUrl());
  gh.singleton<
          _i12.AuthenticationCredentialsSerializer<
              _i13.SocialAuthenticationCredentials>>(
      _i14.SocialAuthenticationCredentialsSerializer());
  gh.singleton<_i6.AuthorizationCredentialsSerializer>(
      _i6.AuthorizationCredentialsSerializer());
  gh.singleton<_i15.Client>(httpClientModule.httpClient);
  gh.singleton<_i16.Clock>(clockModule.clock);
  gh.singleton<_i17.ApiClient>(_i17.ApiClient(get<_i15.Client>()));
  gh.singleton<_i18.AuthorizationCredentialsExpirationChecker>(
      _i18.AuthorizationCredentialsExpirationChecker(get<_i16.Clock>()));
  gh.singleton<_i19.AuthorizationRepository>(
      _i20.AuthorizationRepositoryImpl(get<_i3.LocalAuthorizationProvider>()));
  gh.singleton<_i8.GetAuthorizationCredentialsUsecase>(
      _i8.GetAuthorizationCredentialsUsecase(
          get<_i19.AuthorizationRepository>()));
  gh.singleton<_i21.RemoteAuthorizationRefresher>(
      _i22.ApiAuthorizationRefresher(get<_i17.ApiClient>(),
          get<_i6.AuthorizationCredentialsSerializer>()));
  gh.singleton<_i23.RemoteSocialAuthenticationProvider>(
      _i24.ApiSocialAuthenticationProvider(
          get<_i17.ApiClient>(),
          get<
              _i12.AuthenticationCredentialsSerializer<
                  _i13.SocialAuthenticationCredentials>>(),
          get<_i6.AuthorizationCredentialsSerializer>()));
  gh.singleton<_i25.SignOutUsecase>(
      _i25.SignOutUsecase(get<_i19.AuthorizationRepository>()));
  gh.singleton<_i26.ApiAuthorizationService>(_i27.ApiAuthorizationServiceImpl(
      get<_i3.LocalAuthorizationProvider>(),
      get<_i18.AuthorizationCredentialsExpirationChecker>(),
      get<_i21.RemoteAuthorizationRefresher>()));
  gh.singleton<
          _i28.AuthenticationRepository<_i13.SocialAuthenticationCredentials>>(
      _i29.SocialAuthenticationRepository(
          get<_i23.RemoteSocialAuthenticationProvider>()));
  gh.singleton<_i10.SocialAuthenticateUsecase>(_i10.SocialAuthenticateUsecase(
      get<
          _i28.AuthenticationRepository<
              _i13.SocialAuthenticationCredentials>>(),
      get<_i19.AuthorizationRepository>()));
  return get;
}

class _$HttpClientModule extends _i30.HttpClientModule {}

class _$ClockModule extends _i31.ClockModule {}
