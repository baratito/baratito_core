import 'package:equatable/equatable.dart';

class ShoppingListUpdateModel extends Equatable {
  final int id;
  final String name;

  ShoppingListUpdateModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
