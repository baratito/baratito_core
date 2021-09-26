import 'package:baratito_core/src/shared/domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class Model<E extends Entity> extends Equatable {
  final int id;

  const Model(this.id);

  E toEntity();

  @override
  List<Object?> get props => [id];
}
