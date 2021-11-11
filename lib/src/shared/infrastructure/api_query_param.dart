import 'package:equatable/equatable.dart';

class ApiQueryParam extends Equatable {
  final String name;
  final String value;

  const ApiQueryParam(this.name, this.value);

  @override
  List<Object> get props => [name, value];
}
