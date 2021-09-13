import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TVDetails {
  final String backdropPath;
  final List<CreatedBy> createdBy;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  final LastEpisodeToAir lastEpisodeToAir;
  final String name;
  // TODO возможно DateFormat
  final NextEpisodeToAir? nextEpisodeToAir;
  final List<Network> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<Season> seasons;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;
  TVDetails({
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TVDetails.fromJson(Map<String, dynamic> json) => _$TVDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TVDetailsToJson(this);

  }

@JsonSerializable(fieldRename: FieldRename.snake)
class CreatedBy {
  final int id;
  final String creditId;
  final String name;
  final int gender;
  final String profilePath;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    required this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreateByFromJson(json);

  Map<String, dynamic> toJson() => _$CreateByToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LastEpisodeToAir {
  final String airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int seasonNumber;
  final String stillPath;
  final double voteAverage;
  final int voteCount;
  LastEpisodeToAir({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) => _$LastEpisodeToAirFromJson(json);

  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NextEpisodeToAir {
  const NextEpisodeToAir();

  factory NextEpisodeToAir.fromJson(Map<String, dynamic> json) => _$NextEpisodeToAirFromJson(json);

  Map<String, dynamic> toJson() => _$NextEpisodeToAirToJson(this);
}

class Network {
  final String name;
  final int id;
  final String logo_path;
  final String origin_country;
  Network({
    required this.name,
    required this.id,
    required this.logo_path,
    required this.origin_country,
  });

  Network copyWith({
    String? name,
    int? id,
    String? logo_path,
    String? origin_country,
  }) {
    return Network(
      name: name ?? this.name,
      id: id ?? this.id,
      logo_path: logo_path ?? this.logo_path,
      origin_country: origin_country ?? this.origin_country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'logo_path': logo_path,
      'origin_country': origin_country,
    };
  }

  factory Network.fromMap(Map<String, dynamic> map) {
    return Network(
      name: map['name'],
      id: map['id']?.toInt(),
      logo_path: map['logo_path'],
      origin_country: map['origin_country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Network.fromJson(String source) => Network.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Network(name: $name, id: $id, logo_path: $logo_path, origin_country: $origin_country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Network &&
      other.name == name &&
      other.id == id &&
      other.logo_path == logo_path &&
      other.origin_country == origin_country;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      id.hashCode ^
      logo_path.hashCode ^
      origin_country.hashCode;
  }
}

class ProductionCompany {
  final int id;
  final String logo_path;
  final String name;
  final String origin_country;
  ProductionCompany({
    required this.id,
    required this.logo_path,
    required this.name,
    required this.origin_country,
  });

  ProductionCompany copyWith({
    int? id,
    String? logo_path,
    String? name,
    String? origin_country,
  }) {
    return ProductionCompany(
      id: id ?? this.id,
      logo_path: logo_path ?? this.logo_path,
      name: name ?? this.name,
      origin_country: origin_country ?? this.origin_country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logo_path': logo_path,
      'name': name,
      'origin_country': origin_country,
    };
  }

  factory ProductionCompany.fromMap(Map<String, dynamic> map) {
    return ProductionCompany(
      id: map['id']?.toInt(),
      logo_path: map['logo_path'],
      name: map['name'],
      origin_country: map['origin_country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompany.fromJson(String source) => ProductionCompany.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Production_companie(id: $id, logo_path: $logo_path, name: $name, origin_country: $origin_country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductionCompany &&
      other.id == id &&
      other.logo_path == logo_path &&
      other.name == name &&
      other.origin_country == origin_country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      logo_path.hashCode ^
      name.hashCode ^
      origin_country.hashCode;
  }
}

class ProductionCountry {
  final String iso_3166_1;
  final String name;
  ProductionCountry({
    required this.iso_3166_1,
    required this.name,
  });

  ProductionCountry copyWith({
    String? iso_3166_1,
    String? name,
  }) {
    return ProductionCountry(
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'iso_3166_1': iso_3166_1,
      'name': name,
    };
  }

  factory ProductionCountry.fromMap(Map<String, dynamic> map) {
    return ProductionCountry(
      iso_3166_1: map['iso_3166_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountry.fromJson(String source) => ProductionCountry.fromMap(json.decode(source));

  @override
  String toString() => 'Production_countrie(iso_3166_1: $iso_3166_1, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductionCountry &&
      other.iso_3166_1 == iso_3166_1 &&
      other.name == name;
  }

  @override
  int get hashCode => iso_3166_1.hashCode ^ name.hashCode;
}

class Season {
  final String air_date;
  final int episode_count;
  final int id;
  final String name;
  final String overview;
  final String poster_path;
  final int season_number;
  Season({
    required this.air_date,
    required this.episode_count,
    required this.id,
    required this.name,
    required this.overview,
    required this.poster_path,
    required this.season_number,
  });

  Season copyWith({
    String? air_date,
    int? episode_count,
    int? id,
    String? name,
    String? overview,
    String? poster_path,
    int? season_number,
  }) {
    return Season(
      air_date: air_date ?? this.air_date,
      episode_count: episode_count ?? this.episode_count,
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      poster_path: poster_path ?? this.poster_path,
      season_number: season_number ?? this.season_number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'air_date': air_date,
      'episode_count': episode_count,
      'id': id,
      'name': name,
      'overview': overview,
      'poster_path': poster_path,
      'season_number': season_number,
    };
  }

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      air_date: map['air_date'],
      episode_count: map['episode_count']?.toInt(),
      id: map['id']?.toInt(),
      name: map['name'],
      overview: map['overview'],
      poster_path: map['poster_path'],
      season_number: map['season_number']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Season.fromJson(String source) => Season.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Season(air_date: $air_date, episode_count: $episode_count, id: $id, name: $name, overview: $overview, poster_path: $poster_path, season_number: $season_number)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Season &&
      other.air_date == air_date &&
      other.episode_count == episode_count &&
      other.id == id &&
      other.name == name &&
      other.overview == overview &&
      other.poster_path == poster_path &&
      other.season_number == season_number;
  }

  @override
  int get hashCode {
    return air_date.hashCode ^
      episode_count.hashCode ^
      id.hashCode ^
      name.hashCode ^
      overview.hashCode ^
      poster_path.hashCode ^
      season_number.hashCode;
  }
}

class SpokenLanguage {
  final String english_name;
  final String iso_639_1;
  final String name;
  SpokenLanguage({
    required this.english_name,
    required this.iso_639_1,
    required this.name,
  });

  SpokenLanguage copyWith({
    String? english_name,
    String? iso_639_1,
    String? name,
  }) {
    return SpokenLanguage(
      english_name: english_name ?? this.english_name,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'english_name': english_name,
      'iso_639_1': iso_639_1,
      'name': name,
    };
  }

  factory SpokenLanguage.fromMap(Map<String, dynamic> map) {
    return SpokenLanguage(
      english_name: map['english_name'],
      iso_639_1: map['iso_639_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromJson(String source) => SpokenLanguage.fromMap(json.decode(source));

  @override
  String toString() => 'Spoken_language(english_name: $english_name, iso_639_1: $iso_639_1, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SpokenLanguage &&
      other.english_name == english_name &&
      other.iso_639_1 == iso_639_1 &&
      other.name == name;
  }

  @override
  int get hashCode => english_name.hashCode ^ iso_639_1.hashCode ^ name.hashCode;
}