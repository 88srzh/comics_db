/* import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/tv/tv_popular_list_bloc.dart';
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
    final int tvId = state.tvContainer.tvs.first.id
    final container = await loadNextPage(state.tvContainer, (nextPage) async {
      final result = _tvApiClient.tvDetails(tvId, locale)
    });
  }
}
 */