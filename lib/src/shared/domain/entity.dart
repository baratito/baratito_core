import 'package:equatable/equatable.dart';

abstract class Entity extends Equatable {
  final int id;

  const Entity(this.id);

  @override
  List<Object?> get props => [id];
}
