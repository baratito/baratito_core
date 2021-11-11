import 'package:baratito_core/src/market/domain/category.dart';
import 'package:baratito_core/src/shared/shared.dart';

class Product extends Entity {
  final String name;
  final Category category;
  final String imageUrl;
  final String brand;
  final String presentation;

  Product({
    required int id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.brand,
    required this.presentation,
  }) : super(id);

  @override
  List<Object?> get props {
    return [
      ...super.props,
      name,
      category,
      imageUrl,
      brand,
      presentation,
    ];
  }
}
