part of 'people_details_cubit.dart';

// @immutable
// abstract class PeopleDetailsState {}
//
// class PeopleDetailsDartInitial extends PeopleDetailsState {}

class PeopleDetailsCubitState {
  final String? birthday;
  final String knownForDepartment;
  final String? dateOfDeath;

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
  List<PeopleDetailsCharacterData>? charactersData;
  final int id;
  // final List<KnownForData> knownFor;

  PeopleDetailsCubitState({
    required this.birthday,
    required this.knownForDepartment,
    required this.dateOfDeath,
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
    required this.charactersData,
    required this.id,
    // required this.knownFor,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleDetailsCubitState &&
          runtimeType == other.runtimeType &&
          birthday == other.birthday &&
          knownForDepartment == other.knownForDepartment &&
          dateOfDeath == other.dateOfDeath &&
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
          charactersData == other.charactersData &&
          id == other.id;
  // knownFor == other.knownFor;

  @override
  int get hashCode =>
      birthday.hashCode ^
      knownForDepartment.hashCode ^
      dateOfDeath.hashCode ^
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
      charactersData.hashCode ^
      id.hashCode;
  // knownFor.hashCode;

  PeopleDetailsCubitState copyWith({
    String? birthday,
    String? knownForDepartment,
    String? dateOfDeath,
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
    List<PeopleDetailsCharacterData>? charactersData,
    int? id,
    // List<KnownForData>? knownFor,
  }) {
    return PeopleDetailsCubitState(
      birthday: birthday ?? this.birthday,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      dateOfDeath: dateOfDeath ?? this.dateOfDeath,
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
      charactersData: charactersData ?? this.charactersData,
      id: id ?? this.id,
      // knownFor: knownFor ?? this.knownFor,
    );
  }
}
