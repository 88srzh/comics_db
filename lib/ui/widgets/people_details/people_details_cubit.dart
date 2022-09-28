import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/entity/people_details.dart';
import 'package:comics_db_app/domain/services/movie_service.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_details_data.dart';
import 'package:flutter/material.dart';

part 'people_details_state.dart';

class PeopleDetailsCubit extends Cubit<PeopleDetailsCubitState> {
  final data = PeopleDetailsData();
  final int id;
  final _peopleDetailsService = MovieService();
  String locale = '';

  PeopleDetailsCubit(this.id)
      : super(PeopleDetailsCubitState(
          birthday: '',
          knownForDepartment: '',
          deathday: '',
          // may be don't need id
          name: '',
          alsoKnownAs: [],
          gender: 0,
          biography: '',
          popularity: 0.0,
          placeOfBirth: '',
          profilePath: '',
          adult: true,
          imdbId: '',
          homepage: '',
          localeTag: '',
          // knownFor: [],
        )) {
    emit(PeopleDetailsCubitState(
      birthday: state.birthday,
      knownForDepartment: state.knownForDepartment,
      deathday: state.deathday,
      name: state.name,
      alsoKnownAs: state.alsoKnownAs,
      gender: state.gender,
      biography: state.biography,
      popularity: state.popularity,
      placeOfBirth: state.placeOfBirth,
      profilePath: state.profilePath,
      adult: state.adult,
      imdbId: state.imdbId,
      homepage: state.homepage,
      localeTag: state.localeTag,
      // knownFor: state.knownFor,
    ));
  }

  Future<void> loadPeopleDetails(BuildContext context) async {
    try {
      final details = await _peopleDetailsService.loadPeopleDetails(id: id, locale: state.localeTag);
      await updateData(details.details);
    } on ApiClientException catch (e) {
      print(e);
    }
  }

  Future<void> setupPeopleDetailsLocale(BuildContext context, String localeTag) async {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    // final locale = Localizations.localeOf(context).toLanguageTag();
    // if (_locale == locale) return;
    // _locale = locale;
    // if (!_localeStorage.updateLocale(locale)) return;
    updateData(null);
    await loadPeopleDetails(context);
  }

  Future<void> updateData(PeopleDetails? details) async {
    if (details == null) {
      return;
    }
    data.birthday = details.birthday ?? 'Loading birthday...';
    data.knownForDepartment = details.knownForDepartment;
    data.deathday = details.deathday;
    // until not use id
    data.name = details.name;
    data.alsoKnownAs = details.alsoKnownAs;
    data.gender = details.gender;
    data.biography = details.biography;
    data.popularity = details.popularity;
    data.placeOfBirth = details.placeOfBirth;
    data.profilePath = details.profilePath;
    data.adult = details.adult;
    data.imdbId = details.imdbId;
    data.homepage = details.homepage;
    // data.knownFor = details.knownFor.result.map((e) => KnownForData(posterPath: e.posterPath, title: e.title)).toList();

    var birthday = data.birthday;
    var knownForDepartment = data.knownForDepartment;
    var deathday = data.deathday;
    var name = data.name;
    var alsoKnownAs = data.alsoKnownAs;
    var gender = data.gender;
    var biography = data.biography;
    var popularity = data.popularity;
    var placeOfBirth = data.placeOfBirth;
    var profilePath = data.profilePath;
    var adult = data.adult;
    var imdbId = data.imdbId;
    var homepage = data.homepage;
    // var knownFor = data.knownFor;

    final newState = state.copyWith(
      birthday: birthday,
      knownForDepartment: knownForDepartment,
      deathday: deathday,
      name: name,
      alsoKnownAs: alsoKnownAs,
      gender: gender,
      biography: biography,
      popularity: popularity,
      placeOfBirth: placeOfBirth,
      profilePath: profilePath,
      adult: adult,
      imdbId: imdbId,
      homepage: homepage,
      // knownFor: knownFor,
    );
    emit(newState);
  }

// String makeKnownFor(PeopleDetails details) {
//
// }
// String makeVideoKey (PeopleDetails details) {
//   final videos = details.knownFor.result.where((type) => type.mediaType == 'movie');
// final key = videos.isNotEmpty == true ? videos.first.video : null;
// return videos;
// }
}
