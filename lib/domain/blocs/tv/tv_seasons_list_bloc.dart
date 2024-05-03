import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_list_container.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_season_container.dart';
import 'package:comics_db_app/domain/entity/tv.dart';
import 'package:comics_db_app/domain/entity/tv_response.dart';
import 'package:comics_db_app/domain/entity/tv_season_details.dart';
import 'package:comics_db_app/domain/entity/tv_season_details_guest_stars.dart';
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
    final int id = state.tvs.first.id;
      final container = await _tvApiClient.tvSeasonsDetails(id, event.locale, 1);
    if (container != null) {
      final newState = state.copyWith(tvContainer: container);
      emit(newState);
    }
  }

  Future<TvSeasonContainer?> _loadNextPage(TvSeasonContainer container, Future<TVResponse> Function(int) loader) async {
    final tvSeason = List<TvSeasonDetails>.from(container.tvSeason);
    final newContainer = container.copyWith(
      tvSeason: tvSeason,
    );
    return newContainer;
  }

  Future<void> onTvSeasonsListEventLoadReset(TvListEventLoadReset event, Emitter<TvListState> emit) async {
    emit(const TvListState.initial());
  }
}