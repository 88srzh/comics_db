import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:comics_db_app/domain/entity/movie.dart';

@immutable
class Category extends Equatable {
  final TypeOfLookingAt type;
  final bool isSelected;

  @override
  List<Object?> get props => [type, isSelected];

  Category copyWith({
    TypeOfLookingAt? type,
    bool? isSelected,
  }) {
    return Category(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  const Category({required this.type, required this.isSelected});

  @override
  String toString() {
    return 'Category{type: $type, isSelected: $isSelected}';
  }
}
