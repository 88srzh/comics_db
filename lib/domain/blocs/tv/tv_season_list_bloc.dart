import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_season_container.dart';
import 'package:comics_db_app/domain/entity/tv_season_details.dart';
import 'package:comics_db_app/domain/entity/tv_season_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_season_list_bloc.freezed.dart';

part 'tv_season_event.dart';

part 'tv_season_state.dart';

class TvSeasonListBloc extends Bloc<TvSeasonEvent, TvSeasonState> {
  final _tvApiClient = MovieAndTvApiClient();

  TvSeasonListBloc(super.initialState) {
    on<TvSeasonEvent>(((event, emit) async {
      if (event is TvSeasonEventLoadNextPage) {
        await onTvSeasonsListEventLoadNextPage(event, emit);
      } else if (event is TvSeasonEventLoadReset) {
        await onTvSeasonsListEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onTvSeasonsListEventLoadNextPage(TvSeasonEventLoadNextPage event, Emitter<TvSeasonState> emit) async {
    if (state.isNotSearchMode) {
      final container = await _loadNextPage(state.tvSeasonContainer, (nextPage) async {
        final result = await _tvApiClient.tvSeasonsDetails(event.tvId, event.locale, event.seasonNumber);
        return result;
      });
      if (container != null) {
        final newState = state.copyWith(tvSeasonContainer: container);
        emit(newState);
      }
    }
  }

  Future<TvSeasonContainer?> _loadNextPage(TvSeasonContainer container, Future<TvSeasonResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.tvSeasonContainer.seasonNumber + 1;
    final result = await loader(nextPage);
    final tvs = List<TvSeasonDetails>.from(container.tvSeason)..addAll(result.seasonDetails);
    final newContainer = container.copyWith(tvSeason: tvs);
    return newContainer;
  }
}

Future<void> onTvSeasonsListEventLoadReset(TvSeasonEventLoadReset event, Emitter<TvSeasonState> emit) async {
  emit(const TvSeasonState.initial());
}
