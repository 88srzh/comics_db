import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:equatable/equatable.dart';

class TrendingListContainer extends Equatable {
  final List<TrendingAll> trendingAll;
  final int currentPage;
  final int totalPage;
  final List<String> timeWindow;

  bool get isComplete => currentPage >= totalPage;

  const TrendingListContainer.initial()
      : trendingAll = const <TrendingAll>[],
        currentPage = 0,
        totalPage = 1,
        timeWindow = const <String>[];

  const TrendingListContainer({
    required this.trendingAll,
    required this.currentPage,
    required this.totalPage,
    required this.timeWindow,
  });

  @override
  List<Object> get props => [trendingAll, currentPage, totalPage, timeWindow];

  TrendingListContainer copyWith({
    List<TrendingAll>? trendingAll,
    int? currentPage,
    int? totalPage,
    List<String>? timeWindow,
  }) {
    return TrendingListContainer(
      trendingAll: trendingAll ?? this.trendingAll,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      timeWindow: timeWindow ?? this.timeWindow,
    );
  }
}
