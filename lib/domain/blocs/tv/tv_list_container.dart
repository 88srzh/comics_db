// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/tv.dart';

class TvListContainer extends Equatable {
  final List<TV> tvs;
  final int currentPage;
  final int totalPage;

  bool get isComplete => currentPage >= totalPage;

  const TvListContainer.initial()
      : tvs = const <TV>[],
        currentPage = 0,
        totalPage = 1;

  const TvListContainer({required this.tvs, required this.currentPage, required this.totalPage});

  @override
  List<Object> get props => [tvs, currentPage, totalPage];

  TvListContainer copyWith({
    List<TV>? tvs,
    int? currentPage,
    int? totalPage,
  }) {
    return TvListContainer(
      tvs: tvs ?? this.tvs,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
    );
  }
}
