// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/people.dart';
import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:comics_db_app/domain/entity/trending_all_response.dart';
import 'package:comics_db_app/ui/widgets/trending/components/trending_list_container.dart';

part 'trending_list_bloc.freezed.dart';

part 'trending_list_event.dart';

part 'trending_list_state.dart';

class TrendingListBloc extends Bloc<TrendingListEvent, TrendingListState> {
  final _trendingApiClient = MovieAndTvApiClient();
  final String day = 'day';
  final String week = 'week';
  final String movie = 'movie';
  final String tv = 'tv';
  final String all = 'all';

  TrendingListBloc(TrendingListState initialState) : super(initialState) {
    on<TrendingListEvent>(((event, emit) async {
      if (event is TrendingListEventLoadAllThisWeek) {
        await onTrendingListEventLoadAllThisWeek(event, emit);
      } else if (event is TrendingListEventLoadMoviesThisWeek) {
        await onTrendingListEventLoadMoviesThisWeek(event, emit);
      } else if (event is TrendingListEventLoadTvThisWeek) {
        await onTrendingListEventLoadTvThisWeek(event, emit);
      } else if (event is TrendingListEvenLoadPeopleThisWeek) {
        await onTrendingListEventLoadPeopleThisWeek(event, emit);
      } else if (event is TrendingListEventLoadReset) {
        await onTrendingListEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onTrendingListEventLoadAllThisWeek(
      TrendingListEventLoadAllThisWeek event, Emitter<TrendingListState> emit) async {
    if (state.trendingListContainer.isComplete) return;
    final container = await _loadNextPage(state.trendingListContainer, (nextPage) async {
      final result = await _trendingApiClient.trendingAll(nextPage, event.locale, week, Configuration.apiKey);
      return result;
    });
    if (container != null) {
      final newState = state.copyWith(trendingListContainer: container);
      emit(newState);
    }
  }

  Future<void> onTrendingListEventLoadMoviesThisWeek(
      TrendingListEventLoadMoviesThisWeek event, Emitter<TrendingListState> emit) async {
    if (state.trendingListContainer.isComplete) return;
    // final nextPage = state.trendingListContainer.currentPage + 1;
    final result = await _trendingApiClient.trendingMovies(1, event.locale, week, Configuration.apiKey);
    final movie = List<Movie>.from(state.trendingListContainer.trendingMovie)..addAll(result.movies);
    final container = state.trendingListContainer.copyWith(
      trendingMovie: movie,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    final newState = state.copyWith(trendingListContainer: container);
    emit(newState);
  }

  Future<void> onTrendingListEventLoadTvThisWeek(
      TrendingListEventLoadTvThisWeek event, Emitter<TrendingListState> emit) async {
    if (state.trendingListContainer.isComplete) return;
    final container = await _loadNextPage(
      state.trendingListContainer,
      (nextPage) async {
        final result = await _trendingApiClient.trendingTv(nextPage, event.locale, week, Configuration.apiKey);
        return result;
      },
    );
    if (container != null) {
      final newState = state.copyWith(trendingListContainer: container);
      emit(newState);
    }
  }

  Future<void> onTrendingListEventLoadPeopleThisWeek(
      TrendingListEvenLoadPeopleThisWeek event, Emitter<TrendingListState> emit) async {
    if (state.trendingListContainer.isComplete) return;
    final nextPage = state.trendingListContainer.currentPage + 1;
    final result = await _trendingApiClient.trendingPeople(nextPage, event.locale, week, Configuration.apiKey);
    final people = List<People>.from(state.trendingListContainer.people)..addAll(result.people);
    final container = state.trendingListContainer.copyWith(
      people: people,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    final newState = state.copyWith(trendingListContainer: container);
    emit(newState);
    // final container = await _loadNextPage(
    //   state.trendingListContainer,
    //   (nextPage) async {
    //     final result = await _trendingApiClient.trendingPeople(nextPage, event.locale, week, Configuration.apiKey);
    //     return result;
    //   },
    // );
    // if (container != null) {
    //   final newState = state.copyWith(trendingListContainer: container);
    //   emit(newState);
    // }
  }

  Future<TrendingListContainer?> _loadNextPage(
      TrendingListContainer container, Future<TrendingAllResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.trendingListContainer.currentPage + 1;
    final result = await loader(nextPage);
    final trendingAll = List<TrendingAll>.from(container.trendingAll)..addAll(result.trendingAll);
    final newContainer = container.copyWith(
      trendingAll: trendingAll,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }

  Future<void> onTrendingListEventLoadReset(TrendingListEventLoadReset event, Emitter<TrendingListState> emit) async {
    emit(const TrendingListState.initial());
  }
}
