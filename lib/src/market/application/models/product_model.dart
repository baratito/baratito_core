import 'package:baratito_core/src/market/domain/domain.dart';
import 'package:baratito_core/src/shared/shared.dart';

class ProductModel extends EntityModel<Product> {
  final String name;
  final Category category;
  final String imageUrl;
  final String brand;
  final String presentation;

  ProductModel({
    required int id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.brand,
    required this.presentation,
  }) : super(id);

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      category: product.category,
      imageUrl: product.imageUrl,
      brand: product.brand,
      presentation: product.presentation,
    );
  }

  @override
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      category: category,
      imageUrl: imageUrl,
      brand: brand,
      presentation: presentation,
    );
  }
}
