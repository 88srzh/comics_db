import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:equatable/equatable.dart';

class TrendingListContainer extends Equatable {
  final List<TrendingAll> trendingAll;
  final int currentPage;
  final int totalPage;

  bool get isComplete => currentPage >= totalPage;

  const TrendingListContainer.initial()
      : trendingAll = const <TrendingAll>[],
        currentPage = 0,
        totalPage = 1;

  const TrendingListContainer({
    required this.trendingAll,
    required this.currentPage,
    required this.totalPage,
  });

  @override
  List<Object> get props => [trendingAll, currentPage, totalPage];

  TrendingListContainer copyWith({
    List<TrendingAll>? trendingAll,
    int? currentPage,
    int? totalPage,
  }) {
    return TrendingListContainer(
      trendingAll: trendingAll ?? this.trendingAll,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
    );
  }
}
