import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/services/tv_service.dart';
import 'package:comics_db_app/ui/widgets/tv_episodes/components/tv_episodes_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'tv_episodes_state.dart';

class TvEpisodesCubit extends Cubit<TvEpisodesCubitState> {
  late DateFormat _dateFormat;
  final data = TvEpisodesData();
  final movieAndTvClient = MovieAndTvApiClient();
  final int tvId;
  final _tvService = TvService();

  TvEpisodesCubit(this.tvId)
      : super(const TvEpisodesCubitState(
          airDate: '',
          // crew: [],
          episodeNumber: 0,
          // guestStars: [],
          name: '',
          overview: '',
          id: 0,
          productionCode: '',
          runtime: 0,
          seasonNumber: 0,
          voteAverage: 0.0,
          voteCount: 0,
        )) {
    emit(TvEpisodesCubitState(
      airDate: state.airDate,
      // crew: state.crew,
      episodeNumber: state.episodeNumber,
      // guestStars: state.guestStars,
      name: state.name,
      overview: state.overview,
      id: state.id,
      productionCode: state.productionCode,
      runtime: state.runtime,
      seasonNumber: state.seasonNumber,
      voteAverage: state.voteAverage,
      voteCount: state.voteCount,
    ));
  }
}
