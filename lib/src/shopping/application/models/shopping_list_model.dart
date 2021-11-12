import 'package:flutter/painting.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/domain/domain.dart';

class ShoppingListModel extends EntityModel<ShoppingList> {
  final String name;
  final Color color;

  ShoppingListModel({
    required int id,
    required this.name,
    required this.color,
  }) : super(id);

  @override
  ShoppingList toEntity() {
    return ShoppingList(
      id: id,
      name: name,
      color: color,
    );
  }

  @override
  List<Object?> get props => [...super.props, name, color];
}
