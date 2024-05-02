import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_container.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/domain/entity/tv_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeasonsListBloc extends Bloc<TvListEvent, TvListState> {
  final _tvApiClient = MovieAndTvApiClient();

  TvSeasonsListBloc(super.initialState) {
    on<TvListEvent>(((event, emit) async {
      if (event is TvListEventLoadNextPage) {
        await onTvSeasonsListEventLoadNextPage(event, emit);
      } else if (event is TvListEventLoadReset) {
        await onTvSeasonsListEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onTvSeasonsListEventLoadNextPage(TvListEventLoadNextPage event, Emitter<TvListState> emit) async {
    final container = await _loadNextPage(state.tvContainer, (nextPage) async {
      final result = await _tvApiClient.tvSeasonsDetails(nextPage, event.locale, 1);
      return result;
    });
    if (container != null) {
      final newState = state.copyWith(tvContainer: container);
      emit(newState);
    }
  }

  Future<TvListContainer?> _loadNextPage(TvListContainer container, Future<TVResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.tvContainer.currentPage + 1;
    final result = await loader(nextPage);
    final tvs = List<TV>.from(container.tvs)..addAll(result.tvs);
    final newContainer = container.copyWith(
      tvs: tvs,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }

  Future<void> onTvSeasonsListEventLoadReset(TvListEventLoadReset event, Emitter<TvListState> emit) async {
    emit(const TvListState.initial());
  }
}