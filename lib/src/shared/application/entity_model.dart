import 'package:baratito_core/src/shared/domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class EntityModel<E extends Entity> extends Equatable {
  final int id;

  const EntityModel(this.id);

  E toEntity();

  @override
  List<Object?> get props => [id];
}
