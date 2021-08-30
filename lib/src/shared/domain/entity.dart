import 'package:equatable/equatable.dart';

abstract class Entity extends Equatable {
  final String id;

  Entity(this.id);

  @override
  List<Object?> get props => [id];
}
