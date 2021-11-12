import 'package:baratito_core/src/shared/shared.dart';
import 'package:flutter/painting.dart';

class ShoppingList extends Entity {
  final String name;
  final Color color;

  ShoppingList({
    required int id,
    required this.name,
    required this.color,
  }) : super(id);

  ShoppingList copyWith({
    String? name,
    Color? color,
  }) {
    return ShoppingList(
      id: id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  ShoppingList rename(String newName) {
    return copyWith(name: newName);
  }

  @override
  List<Object?> get props => [...super.props, name, color];
}
