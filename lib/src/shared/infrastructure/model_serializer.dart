import 'package:baratito_core/src/shared/application/application.dart';

abstract class ModelSerializer<M extends Model> {
  M fromMap(Map<String, dynamic> map);
  Map<String, dynamic> toMap(M model);
}
