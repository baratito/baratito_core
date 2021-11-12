import 'package:equatable/equatable.dart';

class ShoppingListCreateModel extends Equatable {
  final String name;

  ShoppingListCreateModel({required this.name});

  @override
  List<Object?> get props => [name];
}
