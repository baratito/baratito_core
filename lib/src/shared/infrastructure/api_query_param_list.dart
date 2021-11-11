import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:baratito_core/src/shared/infrastructure/api_query_param.dart';

class ApiQueryParamList extends DelegatingList<ApiQueryParam>
    implements Equatable {
  final List<ApiQueryParam> _params;

  const ApiQueryParamList(this._params) : super(_params);

  String buildQuery() {
    var query = '';
    for (final param in _params) {
      if (query.isNotEmpty) query += '&';
      final paramName = param.name;
      final paramValue = param.value;
      query += '$paramName=$paramValue';
    }
    return query;
  }

  @override
  List<Object> get props => [_params];

  @override
  bool? get stringify => true;
}
