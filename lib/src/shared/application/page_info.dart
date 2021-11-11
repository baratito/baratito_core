import 'package:baratito_core/baratito_core.dart';

class PageInfo extends Equatable {
  final int pageSize;
  final int pageNumber;

  const PageInfo({required this.pageSize, required this.pageNumber});

  PageInfo next() {
    return PageInfo(
      pageSize: pageSize,
      pageNumber: pageNumber + 1,
    );
  }

  @override
  List<Object?> get props => [pageSize, pageNumber];
}
