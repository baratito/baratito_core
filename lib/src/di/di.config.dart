// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clock/clock.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:http/http.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../auth/application/repositories/authentication_repository.dart'
    as _i28;
import '../auth/application/repositories/authorization_repository.dart' as _i30;
import '../auth/application/usecases/get_authorization_credentials_usecase.dart'
    as _i32;
import '../auth/application/usecases/sign_out_usecase.dart' as _i35;
import '../auth/domain/authorization_credentials_expiration_checker.dart'
    as _i17;
import '../auth/infrastructure/persistence/api_authorization_refresher.dart'
    as _i23;
import '../auth/infrastructure/persistence/api_authorization_service_impl.dart'
    as _i27;
import '../auth/infrastructure/persistence/authentication_credentials_serializer.dart'
    as _i4;
import '../auth/infrastructure/persistence/authorization_credentials_serializer.dart'
    as _i7;
import '../auth/infrastructure/persistence/key_value_store_authorization_provider.dart'
    as _i21;
import '../auth/infrastructure/persistence/local_authorization_provider.dart'
    as _i20;
import '../auth/infrastructure/persistence/remote_authorization_refresher.dart'
    as _i22;
import '../auth/infrastructure/repositories/authorization_repository_impl.dart'
    as _i31;
import '../auth/presentation/authorization_cubit/authorization_cubit.dart'
    as _i38;
import '../profiles/application/models/profile_model.dart' as _i13;
import '../profiles/application/repositories/profiles_repository.dart' as _i39;
import '../profiles/application/usecases/get_authenticated_user_profile_usecase.dart'
    as _i41;
import '../profiles/infrastructure/persistence/api_profiles_provider.dart'
    as _i34;
import '../profiles/infrastructure/persistence/profile_model_serializer.dart'
    as _i14;
import '../profiles/infrastructure/persistence/remote_profiles_provider.dart'
    as _i33;
import '../profiles/infrastructure/repositories/profiles_repository_impl.dart'
    as _i40;
import '../profiles/presentation/authenticated_user_profile_cubit/authenticated_user_profile_cubit.dart'
    as _i42;
import '../shared/domain/clock.dart' as _i44;
import '../shared/infrastructure/api_authorization_service.dart' as _i26;
import '../shared/infrastructure/api_client.dart' as _i16;
import '../shared/infrastructure/api_provider_base_url.dart' as _i3;
import '../shared/infrastructure/http_client.dart' as _i43;
import '../shared/infrastructure/key_value_store.dart' as _i18;
import '../shared/infrastructure/model_serializer.dart' as _i12;
import '../shared/infrastructure/preferences_key_value_store.dart' as _i19;
import '../shared/infrastructure/shared_preferences.dart' as _i46;
import '../social_auth/application/usecases/social_authenticate_usecase.dart'
    as _i36;
import '../social_auth/domain/social_authentication_credentials.dart' as _i5;
import '../social_auth/infrastructure/google_sign_in.dart' as _i45;
import '../social_auth/infrastructure/google_sign_in_service.dart' as _i11;
import '../social_auth/infrastructure/persistence/api_social_authentication_provider.dart'
    as _i25;
import '../social_auth/infrastructure/persistence/remote_social_authentication_provider.dart'
    as _i24;
import '../social_auth/infrastructure/persistence/social_authentication_credentials_serializer.dart'
    as _i6;
import '../social_auth/infrastructure/repositories/social_authentication_repository.dart'
    as _i29;
import '../social_auth/presentation/social_authentication_cubit/social_authentication_cubit.dart'
    as _i37; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final httpClientModule = _$HttpClientModule();
  final clockModule = _$ClockModule();
  final googleSignInModule = _$GoogleSignInModule();
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
  gh.factory<_i10.GoogleSignIn>(() => googleSignInModule.signIn);
  gh.lazySingleton<_i11.GoogleSignInService>(
      () => _i11.GoogleSignInService(get<_i10.GoogleSignIn>()));
  gh.lazySingleton<_i12.ModelSerializer<_i13.ProfileModel>>(
      () => _i14.ProfileModelSerializer());
  await gh.factoryAsync<_i15.SharedPreferences>(
      () => sharedPreferencesModule.preferences,
      preResolve: true);
  gh.lazySingleton<_i16.ApiClient>(() => _i16.ApiClient(get<_i8.Client>()));
  gh.lazySingleton<_i17.AuthorizationCredentialsExpirationChecker>(
      () => _i17.AuthorizationCredentialsExpirationChecker(get<_i9.Clock>()));
  gh.lazySingleton<_i18.KeyValueStore>(
      () => _i19.PreferencesKeyValueStore(get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i20.LocalAuthorizationProvider>(() =>
      _i21.KeyValueStoreAuthorizationProvider(get<_i18.KeyValueStore>(),
          get<_i7.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i22.RemoteAuthorizationRefresher>(() =>
      _i23.ApiAuthorizationRefresher(get<_i16.ApiClient>(),
          get<_i7.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i24.RemoteSocialAuthenticationProvider>(() =>
      _i25.ApiSocialAuthenticationProvider(
          get<_i16.ApiClient>(),
          get<
              _i4.AuthenticationCredentialsSerializer<
                  _i5.SocialAuthenticationCredentials>>(),
          get<_i7.AuthorizationCredentialsSerializer>()));
  gh.lazySingleton<_i26.ApiAuthorizationService>(() =>
      _i27.ApiAuthorizationServiceImpl(
          get<_i20.LocalAuthorizationProvider>(),
          get<_i17.AuthorizationCredentialsExpirationChecker>(),
          get<_i22.RemoteAuthorizationRefresher>()));
  gh.lazySingleton<
          _i28.AuthenticationRepository<_i5.SocialAuthenticationCredentials>>(
      () => _i29.SocialAuthenticationRepository(
          get<_i24.RemoteSocialAuthenticationProvider>()));
  gh.lazySingleton<_i30.AuthorizationRepository>(() =>
      _i31.AuthorizationRepositoryImpl(get<_i20.LocalAuthorizationProvider>()));
  gh.lazySingleton<_i32.GetAuthorizationCredentialsUsecase>(() =>
      _i32.GetAuthorizationCredentialsUsecase(
          get<_i30.AuthorizationRepository>()));
  gh.lazySingleton<_i33.RemoteProfilesProvider>(() => _i34.ApiProfilesProvider(
      get<_i16.ApiClient>(),
      get<_i26.ApiAuthorizationService>(),
      get<_i12.ModelSerializer<_i13.ProfileModel>>()));
  gh.lazySingleton<_i35.SignOutUsecase>(
      () => _i35.SignOutUsecase(get<_i30.AuthorizationRepository>()));
  gh.lazySingleton<
      _i36
          .SocialAuthenticateUsecase>(() => _i36.SocialAuthenticateUsecase(
      get<_i28.AuthenticationRepository<_i5.SocialAuthenticationCredentials>>(),
      get<_i30.AuthorizationRepository>()));
  gh.factory<_i37.SocialAuthenticationCubit>(() =>
      _i37.SocialAuthenticationCubit(get<_i36.SocialAuthenticateUsecase>()));
  gh.factory<_i38.AuthorizationCubit>(() => _i38.AuthorizationCubit(
      get<_i32.GetAuthorizationCredentialsUsecase>(),
      get<_i35.SignOutUsecase>()));
  gh.lazySingleton<_i39.ProfilesRepository>(
      () => _i40.ProfilesRepositoryImpl(get<_i33.RemoteProfilesProvider>()));
  gh.lazySingleton<_i41.GetAuthenticatedUserProfileUsecase>(() =>
      _i41.GetAuthenticatedUserProfileUsecase(get<_i39.ProfilesRepository>()));
  gh.factory<_i42.AuthenticatedUserProfileCubit>(() =>
      _i42.AuthenticatedUserProfileCubit(
          get<_i41.GetAuthenticatedUserProfileUsecase>()));
  return get;
}

class _$HttpClientModule extends _i43.HttpClientModule {}

class _$ClockModule extends _i44.ClockModule {}

class _$GoogleSignInModule extends _i45.GoogleSignInModule {}

class _$SharedPreferencesModule extends _i46.SharedPreferencesModule {}
