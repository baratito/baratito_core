import 'package:result_type/result_type.dart';

import 'package:baratito_core/src/shared/shared.dart';
import 'package:baratito_core/src/shopping/application/models/models.dart';

abstract class PurchaseListItemsRepository {
  Future<Result<PurchaseListItemModel, ApplicationFailure>> update(
    PurchaseListItemUpdateModel updateModel,
  );
}
