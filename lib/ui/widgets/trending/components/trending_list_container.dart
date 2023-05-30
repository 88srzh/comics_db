import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:equatable/equatable.dart';

class TrendingListContainer extends Equatable {
  final List<TrendingAll> trendingAll;
  final List<Movie> trendingMovie;
  final int currentPage;
  final int totalPage;
  final List<String> timeWindow;

  bool get isComplete => currentPage >= totalPage;

  const TrendingListContainer.initial()
      : trendingAll = const <TrendingAll>[],
        trendingMovie = const <Movie>[],
        currentPage = 0,
        totalPage = 1,
        timeWindow = const <String>[];

  const TrendingListContainer({
    required this.trendingAll,
    required this.trendingMovie,
    required this.currentPage,
    required this.totalPage,
    required this.timeWindow,
  });

  @override
  List<Object> get props => [trendingAll, trendingMovie, currentPage, totalPage, timeWindow];

  TrendingListContainer copyWith({
    List<TrendingAll>? trendingAll,
    List<Movie>? trendingMovie,
    int? currentPage,
    int? totalPage,
    List<String>? timeWindow,
  }) {
    return TrendingListContainer(
      trendingAll: trendingAll ?? this.trendingAll,
      trendingMovie: trendingMovie ?? this.trendingMovie,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      timeWindow: timeWindow ?? this.timeWindow,
    );
  }
}
