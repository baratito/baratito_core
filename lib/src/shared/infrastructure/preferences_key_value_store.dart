import 'package:baratito_core/baratito_core.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: KeyValueStore)
class PreferencesKeyValueStore implements KeyValueStore {
  final SharedPreferences _preferences;

  PreferencesKeyValueStore(this._preferences);

  @override
  Future<Optional<String>> getString(String key) async {
    final optional = Optional.ofNullable(_preferences.getString(key));
    return optional;
  }

  @override
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  @override
  Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }
}
