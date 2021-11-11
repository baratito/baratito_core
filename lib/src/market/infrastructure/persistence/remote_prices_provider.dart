import 'package:baratito_core/src/market/application/application.dart';
import 'package:baratito_core/src/market/domain/domain.dart';

abstract class RemotePricesProvider {
  Future<List<PriceModel>> getByProduct(Product product);
}
