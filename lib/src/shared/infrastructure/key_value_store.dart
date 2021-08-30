import 'package:optional/optional.dart';

abstract class KeyValueStore {
  Future<Optional<String>> getString(String key);
  Future<void> setString(String key, String value);
}
