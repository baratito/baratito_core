import 'package:equatable/equatable.dart';

class UserLocationUpdateModel extends Equatable {
  final int id;
  final bool enabled;

  UserLocationUpdateModel({required this.id, required this.enabled});

  @override
  List<Object> get props => [id, enabled];
}
