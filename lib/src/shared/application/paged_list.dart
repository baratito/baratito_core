import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

class PagedList<T> extends DelegatingList<T> implements Equatable {
  final int totalSize;
  final List<T> elements;

  const PagedList({
    required this.totalSize,
    required this.elements,
  }) : super(elements);

  int getTotalPages(int pageSize) => (totalSize / pageSize).ceil();

  @override
  PagedList<R> map<R>(R Function(T) f) {
    return PagedList<R>(
      elements: elements.map(f).toList(),
      totalSize: totalSize,
    );
  }

  @override
  List<Object?> get props => [totalSize, elements];

  @override
  bool? get stringify => true;
}
