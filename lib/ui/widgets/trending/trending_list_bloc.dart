import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/trending_all.dart';
import 'package:comics_db_app/ui/widgets/trending/components/trending_list_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_list_bloc.freezed.dart';

part 'trending_list_event.dart';

part 'trending_list_state.dart';

class TrendingListBloc extends Bloc<TrendingListEvent, TrendingListState> {
  final _trendingApiClient = MovieAndTvApiClient();

  TrendingListBloc(TrendingListState initialState) : super(initialState) {
    on<TrendingListEvent>(((event, emit) async {
      if (event is TrendingListEventLoadNextPage) {
        await onTrendingListEventLoadNextPage(event, emit);
      } else if (event is TrendingListEventLoadReset) {
        await onTrendingListEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onTrendingListEventLoadNextPage(
      TrendingListEventLoadNextPage event, Emitter<TrendingListState> emit) async {
    if (state.trendingListContainer.isComplete) return;
    final nextPage = state.trendingListContainer.currentPage + 1;
    final result = await _trendingApiClient.trendingAll(
      nextPage,
      event.locale,
      TimeWindowType.week,
      Configuration.apiKey,
    );
    final trendingAll = List<TrendingAll>.from(state.trendingListContainer.trendingAll)..addAll(result.trendingAll);
    final container = state.trendingListContainer.copyWith(
      trendingAll: trendingAll,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    final newState = state.copyWith(trendingListContainer: container);
    emit(newState);
  }

  // Future<TrendingListContainer?> _loadNextPage(
  //     TrendingListContainer container, Future<TrendingAllResponse> Function(int) loader) async {
  //   if (container.isComplete) return null;
  //   final nextPage = state.trendingListContainer.currentPage + 1;
  //   final result = await loader(nextPage);
  //   final trendingAll = List<TrendingAll>.from(container.trendingAll)..addAll(result.trendingAll);
  //   final newContainer = container.copyWith(
  //     trendingAll: trendingAll,
  //     currentPage: result.page,
  //     totalPage: result.totalPages,
  //   );
  //   return newContainer;
  // }

  Future<void> onTrendingListEventLoadReset(TrendingListEventLoadReset event, Emitter<TrendingListState> emit) async {
    emit(const TrendingListState.initial());
  }
}
