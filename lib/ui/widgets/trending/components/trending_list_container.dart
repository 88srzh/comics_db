// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/people.dart';
import 'package:comics_db_app/domain/entity/trending_all.dart';

class TrendingListContainer extends Equatable {
  final List<TrendingAll> trendingAll;
  final List<Movie> trendingMovie;
  final List<People> people;
  final int currentPage;
  final int totalPage;
  final List<String> timeWindow;

  bool get isComplete => currentPage >= totalPage;

  const TrendingListContainer.initial()
      : trendingAll = const <TrendingAll>[],
        trendingMovie = const <Movie>[],
        people = const <People>[],
        currentPage = 0,
        totalPage = 1,
        timeWindow = const <String>[];

  const TrendingListContainer({
    required this.trendingAll,
    required this.trendingMovie,
    required this.people,
    required this.currentPage,
    required this.totalPage,
    required this.timeWindow,
  });

  @override
  List<Object> get props => [trendingAll, trendingMovie, people, currentPage, totalPage, timeWindow];

  TrendingListContainer copyWith({
    List<TrendingAll>? trendingAll,
    List<Movie>? trendingMovie,
    List<People>? people,
    int? currentPage,
    int? totalPage,
    List<String>? timeWindow,
  }) {
    return TrendingListContainer(
      trendingAll: trendingAll ?? this.trendingAll,
      trendingMovie: trendingMovie ?? this.trendingMovie,
      people: people ?? this.people,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      timeWindow: timeWindow ?? this.timeWindow,
    );
  }
}
