part of 'people_details_cubit.dart';

// @immutable
// abstract class PeopleDetailsState {}
//
// class PeopleDetailsDartInitial extends PeopleDetailsState {}

class PeopleDetailsCubitState {
  final String? birthday;
  final String knownForDepartment;
  final String? deathday;
  // final int id;
  final String name;
  final List<String> alsoKnownAs;
  final int gender;
  final String biography;
  final double popularity;
  final String? placeOfBirth;
  final String? profilePath;
  final bool adult;
  final String imdbId;
  final String? homepage;
  final String localeTag;
  final List<PeopleKnownForResult> knownFor;

  PeopleDetailsCubitState({
    required this.birthday,
    required this.knownForDepartment,
    required this.deathday,
    // required this.id,
    required this.name,
    required this.alsoKnownAs,
    required this.gender,
    required this.biography,
    required this.popularity,
    required this.placeOfBirth,
    required this.profilePath,
    required this.adult,
    required this.imdbId,
    required this.homepage,
    required this.localeTag,
    required this.knownFor,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleDetailsCubitState &&
          runtimeType == other.runtimeType &&
          birthday == other.birthday &&
          knownForDepartment == other.knownForDepartment &&
          deathday == other.deathday &&
          // id == other.id &&
          name == other.name &&
          alsoKnownAs == other.alsoKnownAs &&
          gender == other.gender &&
          biography == other.biography &&
          popularity == other.popularity &&
          placeOfBirth == other.placeOfBirth &&
          profilePath == other.profilePath &&
          adult == other.adult &&
          imdbId == other.imdbId &&
          homepage == other.homepage &&
          localeTag == other.localeTag &&
  knownFor == other.knownFor;

  @override
  int get hashCode =>
      birthday.hashCode ^
      knownForDepartment.hashCode ^
      deathday.hashCode ^
      // id.hashCode ^
      name.hashCode ^
      alsoKnownAs.hashCode ^
      gender.hashCode ^
      biography.hashCode ^
      popularity.hashCode ^
      placeOfBirth.hashCode ^
      profilePath.hashCode ^
      adult.hashCode ^
      imdbId.hashCode ^
      homepage.hashCode ^
      localeTag.hashCode ^
      knownFor.hashCode;

  PeopleDetailsCubitState copyWith({
    String? birthday,
    String? knownForDepartment,
    String? deathday,
    // int? id,
    String? name,
    List<String>? alsoKnownAs,
    int? gender,
    String? biography,
    double? popularity,
    String? placeOfBirth,
    String? profilePath,
    bool? adult,
    String? imdbId,
    String? homepage,
    String? localeTag,
    List<PeopleKnownForResult>? knownFor,
  }) {
    return PeopleDetailsCubitState(
      birthday: birthday ?? this.birthday,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      deathday: deathday ?? this.deathday,
      // id: id ?? this.id,
      name: name ?? this.name,
      alsoKnownAs: alsoKnownAs ?? this.alsoKnownAs,
      gender: gender ?? this.gender,
      biography: biography ?? this.biography,
      popularity: popularity ?? this.popularity,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      profilePath: profilePath ?? this.profilePath,
      adult: adult ?? this.adult,
      imdbId: imdbId ?? this.imdbId,
      homepage: homepage ?? this.homepage,
      localeTag: localeTag ?? this.localeTag,
      knownFor: knownFor ?? this.knownFor,
    );
  }
}
