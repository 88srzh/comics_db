import 'dart:convert';

class TVDetails {
  final String backdrop_path;
  final List<Created_by> created_by;
  final List<int> episode_run_time;
  final String first_air_date;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool in_production;
  final List<String> languages;
  final String last_air_date;
  final Last_episode_to_air last_episode_to_air;
  final String name;
  final Next_episode_to_air next_episode_to_air;
  final List<Network> networks;
  final int number_of_episodes;
  final int number_of_seasons;
  final List<String> origin_country;
  final String original_language;
  final String original_name;
  final String overview;
  final double popularity;
  final String poster_path;
  final List<Production_companie> production_companies;
  final List<Production_countrie> production_countries;
  final List<Season> seasons;
  final List<Spoken_language> spoken_languages;
  final String status;
  final String tagline;
  final String type;
  final double vote_average;
  final int vote_count;
  TVDetails({
    required this.backdrop_path,
    required this.created_by,
    required this.episode_run_time,
    required this.first_air_date,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.in_production,
    required this.languages,
    required this.last_air_date,
    required this.last_episode_to_air,
    required this.name,
    required this.next_episode_to_air,
    required this.networks,
    required this.number_of_episodes,
    required this.number_of_seasons,
    required this.origin_country,
    required this.original_language,
    required this.original_name,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.production_companies,
    required this.production_countries,
    required this.seasons,
    required this.spoken_languages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.vote_average,
    required this.vote_count,
  });

  TVDetails copyWith({
    String? backdrop_path,
    List<Created_by>? created_by,
    List<int>? episode_run_time,
    String? first_air_date,
    List<Genre>? genres,
    String? homepage,
    int? id,
    bool? in_production,
    List<String>? languages,
    String? last_air_date,
    Last_episode_to_air? last_episode_to_air,
    String? name,
    Next_episode_to_air? next_episode_to_air,
    List<Network>? networks,
    int? number_of_episodes,
    int? number_of_seasons,
    List<String>? origin_country,
    String? original_language,
    String? original_name,
    String? overview,
    double? popularity,
    String? poster_path,
    List<Production_companie>? production_companies,
    List<Production_countrie>? production_countries,
    List<Season>? seasons,
    List<Spoken_language>? spoken_languages,
    String? status,
    String? tagline,
    String? type,
    double? vote_average,
    int? vote_count,
  }) {
    return TVDetails(
      backdrop_path: backdrop_path ?? this.backdrop_path,
      created_by: created_by ?? this.created_by,
      episode_run_time: episode_run_time ?? this.episode_run_time,
      first_air_date: first_air_date ?? this.first_air_date,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      in_production: in_production ?? this.in_production,
      languages: languages ?? this.languages,
      last_air_date: last_air_date ?? this.last_air_date,
      last_episode_to_air: last_episode_to_air ?? this.last_episode_to_air,
      name: name ?? this.name,
      next_episode_to_air: next_episode_to_air ?? this.next_episode_to_air,
      networks: networks ?? this.networks,
      number_of_episodes: number_of_episodes ?? this.number_of_episodes,
      number_of_seasons: number_of_seasons ?? this.number_of_seasons,
      origin_country: origin_country ?? this.origin_country,
      original_language: original_language ?? this.original_language,
      original_name: original_name ?? this.original_name,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      poster_path: poster_path ?? this.poster_path,
      production_companies: production_companies ?? this.production_companies,
      production_countries: production_countries ?? this.production_countries,
      seasons: seasons ?? this.seasons,
      spoken_languages: spoken_languages ?? this.spoken_languages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      type: type ?? this.type,
      vote_average: vote_average ?? this.vote_average,
      vote_count: vote_count ?? this.vote_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'backdrop_path': backdrop_path,
      'created_by': created_by?.map((x) => x.toMap())?.toList(),
      'episode_run_time': episode_run_time,
      'first_air_date': first_air_date,
      'genres': genres?.map((x) => x.toMap())?.toList(),
      'homepage': homepage,
      'id': id,
      'in_production': in_production,
      'languages': languages,
      'last_air_date': last_air_date,
      'last_episode_to_air': last_episode_to_air.toMap(),
      'name': name,
      'next_episode_to_air': next_episode_to_air.toMap(),
      'networks': networks?.map((x) => x.toMap())?.toList(),
      'number_of_episodes': number_of_episodes,
      'number_of_seasons': number_of_seasons,
      'origin_country': origin_country,
      'original_language': original_language,
      'original_name': original_name,
      'overview': overview,
      'popularity': popularity,
      'poster_path': poster_path,
      'production_companies': production_companies?.map((x) => x.toMap())?.toList(),
      'production_countries': production_countries?.map((x) => x.toMap())?.toList(),
      'seasons': seasons?.map((x) => x.toMap())?.toList(),
      'spoken_languages': spoken_languages?.map((x) => x.toMap())?.toList(),
      'status': status,
      'tagline': tagline,
      'type': type,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }

  factory TVDetails.fromMap(Map<String, dynamic> map) {
    return TVDetails(
      backdrop_path: map['backdrop_path'],
      created_by: List<Created_by>.from(map['created_by']?.map((x) => Created_by.fromMap(x))),
      episode_run_time: List<int>.from(map['episode_run_time']),
      first_air_date: map['first_air_date'],
      genres: List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x))),
      homepage: map['homepage'],
      id: map['id']?.toInt(),
      in_production: map['in_production'],
      languages: List<String>.from(map['languages']),
      last_air_date: map['last_air_date'],
      last_episode_to_air: Last_episode_to_air.fromMap(map['last_episode_to_air']),
      name: map['name'],
      next_episode_to_air: Next_episode_to_air.fromMap(map['next_episode_to_air']),
      networks: List<Network>.from(map['networks']?.map((x) => Network.fromMap(x))),
      number_of_episodes: map['number_of_episodes']?.toInt(),
      number_of_seasons: map['number_of_seasons']?.toInt(),
      origin_country: List<String>.from(map['origin_country']),
      original_language: map['original_language'],
      original_name: map['original_name'],
      overview: map['overview'],
      popularity: map['popularity']?.toDouble(),
      poster_path: map['poster_path'],
      production_companies: List<Production_companie>.from(map['production_companies']?.map((x) => Production_companie.fromMap(x))),
      production_countries: List<Production_countrie>.from(map['production_countries']?.map((x) => Production_countrie.fromMap(x))),
      seasons: List<Season>.from(map['seasons']?.map((x) => Season.fromMap(x))),
      spoken_languages: List<Spoken_language>.from(map['spoken_languages']?.map((x) => Spoken_language.fromMap(x))),
      status: map['status'],
      tagline: map['tagline'],
      type: map['type'],
      vote_average: map['vote_average']?.toDouble(),
      vote_count: map['vote_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TVDetails.fromJson(String source) => TVDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TVDetails(backdrop_path: $backdrop_path, created_by: $created_by, episode_run_time: $episode_run_time, first_air_date: $first_air_date, genres: $genres, homepage: $homepage, id: $id, in_production: $in_production, languages: $languages, last_air_date: $last_air_date, last_episode_to_air: $last_episode_to_air, name: $name, next_episode_to_air: $next_episode_to_air, networks: $networks, number_of_episodes: $number_of_episodes, number_of_seasons: $number_of_seasons, origin_country: $origin_country, original_language: $original_language, original_name: $original_name, overview: $overview, popularity: $popularity, poster_path: $poster_path, production_companies: $production_companies, production_countries: $production_countries, seasons: $seasons, spoken_languages: $spoken_languages, status: $status, tagline: $tagline, type: $type, vote_average: $vote_average, vote_count: $vote_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TVDetails &&
      other.backdrop_path == backdrop_path &&
      listEquals(other.created_by, created_by) &&
      listEquals(other.episode_run_time, episode_run_time) &&
      other.first_air_date == first_air_date &&
      listEquals(other.genres, genres) &&
      other.homepage == homepage &&
      other.id == id &&
      other.in_production == in_production &&
      listEquals(other.languages, languages) &&
      other.last_air_date == last_air_date &&
      other.last_episode_to_air == last_episode_to_air &&
      other.name == name &&
      other.next_episode_to_air == next_episode_to_air &&
      listEquals(other.networks, networks) &&
      other.number_of_episodes == number_of_episodes &&
      other.number_of_seasons == number_of_seasons &&
      listEquals(other.origin_country, origin_country) &&
      other.original_language == original_language &&
      other.original_name == original_name &&
      other.overview == overview &&
      other.popularity == popularity &&
      other.poster_path == poster_path &&
      listEquals(other.production_companies, production_companies) &&
      listEquals(other.production_countries, production_countries) &&
      listEquals(other.seasons, seasons) &&
      listEquals(other.spoken_languages, spoken_languages) &&
      other.status == status &&
      other.tagline == tagline &&
      other.type == type &&
      other.vote_average == vote_average &&
      other.vote_count == vote_count;
  }

  @override
  int get hashCode {
    return backdrop_path.hashCode ^
      created_by.hashCode ^
      episode_run_time.hashCode ^
      first_air_date.hashCode ^
      genres.hashCode ^
      homepage.hashCode ^
      id.hashCode ^
      in_production.hashCode ^
      languages.hashCode ^
      last_air_date.hashCode ^
      last_episode_to_air.hashCode ^
      name.hashCode ^
      next_episode_to_air.hashCode ^
      networks.hashCode ^
      number_of_episodes.hashCode ^
      number_of_seasons.hashCode ^
      origin_country.hashCode ^
      original_language.hashCode ^
      original_name.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      poster_path.hashCode ^
      production_companies.hashCode ^
      production_countries.hashCode ^
      seasons.hashCode ^
      spoken_languages.hashCode ^
      status.hashCode ^
      tagline.hashCode ^
      type.hashCode ^
      vote_average.hashCode ^
      vote_count.hashCode;
  }
}

class Created_by {
  final int id;
  final String credit_id;
  final String name;
  final int gender;
  final String profile_path;
  Created_by({
    required this.id,
    required this.credit_id,
    required this.name,
    required this.gender,
    required this.profile_path,
  });

  Created_by copyWith({
    int? id,
    String? credit_id,
    String? name,
    int? gender,
    String? profile_path,
  }) {
    return Created_by(
      id: id ?? this.id,
      credit_id: credit_id ?? this.credit_id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      profile_path: profile_path ?? this.profile_path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'credit_id': credit_id,
      'name': name,
      'gender': gender,
      'profile_path': profile_path,
    };
  }

  factory Created_by.fromMap(Map<String, dynamic> map) {
    return Created_by(
      id: map['id']?.toInt(),
      credit_id: map['credit_id'],
      name: map['name'],
      gender: map['gender']?.toInt(),
      profile_path: map['profile_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Created_by.fromJson(String source) => Created_by.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Created_by(id: $id, credit_id: $credit_id, name: $name, gender: $gender, profile_path: $profile_path)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Created_by &&
      other.id == id &&
      other.credit_id == credit_id &&
      other.name == name &&
      other.gender == gender &&
      other.profile_path == profile_path;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      credit_id.hashCode ^
      name.hashCode ^
      gender.hashCode ^
      profile_path.hashCode;
  }
}

class Genre {
  final int id;
  final String name;
  Genre({
    required this.id,
    required this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Genre.fromJson(String source) => Genre.fromMap(json.decode(source));

  @override
  String toString() => 'Genre(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Genre &&
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class Last_episode_to_air {
  final String air_date;
  final int episode_number;
  final int id;
  final String name;
  final String overview;
  final String production_code;
  final int season_number;
  final String still_path;
  final double vote_average;
  final int vote_count;
  Last_episode_to_air({
    required this.air_date,
    required this.episode_number,
    required this.id,
    required this.name,
    required this.overview,
    required this.production_code,
    required this.season_number,
    required this.still_path,
    required this.vote_average,
    required this.vote_count,
  });

  Last_episode_to_air copyWith({
    String? air_date,
    int? episode_number,
    int? id,
    String? name,
    String? overview,
    String? production_code,
    int? season_number,
    String? still_path,
    double? vote_average,
    int? vote_count,
  }) {
    return Last_episode_to_air(
      air_date: air_date ?? this.air_date,
      episode_number: episode_number ?? this.episode_number,
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      production_code: production_code ?? this.production_code,
      season_number: season_number ?? this.season_number,
      still_path: still_path ?? this.still_path,
      vote_average: vote_average ?? this.vote_average,
      vote_count: vote_count ?? this.vote_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'air_date': air_date,
      'episode_number': episode_number,
      'id': id,
      'name': name,
      'overview': overview,
      'production_code': production_code,
      'season_number': season_number,
      'still_path': still_path,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }

  factory Last_episode_to_air.fromMap(Map<String, dynamic> map) {
    return Last_episode_to_air(
      air_date: map['air_date'],
      episode_number: map['episode_number']?.toInt(),
      id: map['id']?.toInt(),
      name: map['name'],
      overview: map['overview'],
      production_code: map['production_code'],
      season_number: map['season_number']?.toInt(),
      still_path: map['still_path'],
      vote_average: map['vote_average']?.toDouble(),
      vote_count: map['vote_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Last_episode_to_air.fromJson(String source) => Last_episode_to_air.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Last_episode_to_air(air_date: $air_date, episode_number: $episode_number, id: $id, name: $name, overview: $overview, production_code: $production_code, season_number: $season_number, still_path: $still_path, vote_average: $vote_average, vote_count: $vote_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Last_episode_to_air &&
      other.air_date == air_date &&
      other.episode_number == episode_number &&
      other.id == id &&
      other.name == name &&
      other.overview == overview &&
      other.production_code == production_code &&
      other.season_number == season_number &&
      other.still_path == still_path &&
      other.vote_average == vote_average &&
      other.vote_count == vote_count;
  }

  @override
  int get hashCode {
    return air_date.hashCode ^
      episode_number.hashCode ^
      id.hashCode ^
      name.hashCode ^
      overview.hashCode ^
      production_code.hashCode ^
      season_number.hashCode ^
      still_path.hashCode ^
      vote_average.hashCode ^
      vote_count.hashCode;
  }
}

class Next_episode_to_air {
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

class Production_companie {
  final int id;
  final String logo_path;
  final String name;
  final String origin_country;
  Production_companie({
    required this.id,
    required this.logo_path,
    required this.name,
    required this.origin_country,
  });

  Production_companie copyWith({
    int? id,
    String? logo_path,
    String? name,
    String? origin_country,
  }) {
    return Production_companie(
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

  factory Production_companie.fromMap(Map<String, dynamic> map) {
    return Production_companie(
      id: map['id']?.toInt(),
      logo_path: map['logo_path'],
      name: map['name'],
      origin_country: map['origin_country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Production_companie.fromJson(String source) => Production_companie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Production_companie(id: $id, logo_path: $logo_path, name: $name, origin_country: $origin_country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Production_companie &&
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

class Production_countrie {
  final String iso_3166_1;
  final String name;
  Production_countrie({
    required this.iso_3166_1,
    required this.name,
  });

  Production_countrie copyWith({
    String? iso_3166_1,
    String? name,
  }) {
    return Production_countrie(
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

  factory Production_countrie.fromMap(Map<String, dynamic> map) {
    return Production_countrie(
      iso_3166_1: map['iso_3166_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Production_countrie.fromJson(String source) => Production_countrie.fromMap(json.decode(source));

  @override
  String toString() => 'Production_countrie(iso_3166_1: $iso_3166_1, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Production_countrie &&
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

class Spoken_language {
  final String english_name;
  final String iso_639_1;
  final String name;
  Spoken_language({
    required this.english_name,
    required this.iso_639_1,
    required this.name,
  });

  Spoken_language copyWith({
    String? english_name,
    String? iso_639_1,
    String? name,
  }) {
    return Spoken_language(
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

  factory Spoken_language.fromMap(Map<String, dynamic> map) {
    return Spoken_language(
      english_name: map['english_name'],
      iso_639_1: map['iso_639_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Spoken_language.fromJson(String source) => Spoken_language.fromMap(json.decode(source));

  @override
  String toString() => 'Spoken_language(english_name: $english_name, iso_639_1: $iso_639_1, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Spoken_language &&
      other.english_name == english_name &&
      other.iso_639_1 == iso_639_1 &&
      other.name == name;
  }

  @override
  int get hashCode => english_name.hashCode ^ iso_639_1.hashCode ^ name.hashCode;
}