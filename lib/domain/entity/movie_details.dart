import 'dart:convert';

class MovieDetails {
  final bool adult;
  final String backdrop_path;
  final Belongs_to_collection belongs_to_collection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdb_id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final Poster_path poster_path;
  final List<Production_companie> production_companies;
  final List<Production_countrie> production_countries;
  final String release_date;
  final int revenue;
  final int runtime;
  final List<Spoken_language> spoken_languages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double vote_average;
  final int vote_count;
  MovieDetails({
    required this.adult,
    required this.backdrop_path,
    required this.belongs_to_collection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdb_id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.production_companies,
    required this.production_countries,
    required this.release_date,
    required this.revenue,
    required this.runtime,
    required this.spoken_languages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  MovieDetails copyWith({
    bool? adult,
    String? backdrop_path,
    Belongs_to_collection? belongs_to_collection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdb_id,
    String? original_language,
    String? original_title,
    String? overview,
    double? popularity,
    Poster_path? poster_path,
    List<Production_companie>? production_companies,
    List<Production_countrie>? production_countries,
    String? release_date,
    int? revenue,
    int? runtime,
    List<Spoken_language>? spoken_languages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? vote_average,
    int? vote_count,
  }) {
    return MovieDetails(
      adult: adult ?? this.adult,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      belongs_to_collection: belongs_to_collection ?? this.belongs_to_collection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdb_id: imdb_id ?? this.imdb_id,
      original_language: original_language ?? this.original_language,
      original_title: original_title ?? this.original_title,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      poster_path: poster_path ?? this.poster_path,
      production_companies: production_companies ?? this.production_companies,
      production_countries: production_countries ?? this.production_countries,
      release_date: release_date ?? this.release_date,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      spoken_languages: spoken_languages ?? this.spoken_languages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      vote_average: vote_average ?? this.vote_average,
      vote_count: vote_count ?? this.vote_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdrop_path,
      'belongs_to_collection': belongs_to_collection.toMap(),
      'budget': budget,
      'genres': genres?.map((x) => x.toMap())?.toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdb_id,
      'original_language': original_language,
      'original_title': original_title,
      'overview': overview,
      'popularity': popularity,
      'poster_path': poster_path.toMap(),
      'production_companies': production_companies?.map((x) => x.toMap())?.toList(),
      'production_countries': production_countries?.map((x) => x.toMap())?.toList(),
      'release_date': release_date,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spoken_languages?.map((x) => x.toMap())?.toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }

  factory MovieDetails.fromMap(Map<String, dynamic> map) {
    return MovieDetails(
      adult: map['adult'],
      backdrop_path: map['backdrop_path'],
      belongs_to_collection: Belongs_to_collection.fromMap(map['belongs_to_collection']),
      budget: map['budget']?.toInt(),
      genres: List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x))),
      homepage: map['homepage'],
      id: map['id']?.toInt(),
      imdb_id: map['imdb_id'],
      original_language: map['original_language'],
      original_title: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity']?.toDouble(),
      poster_path: Poster_path.fromMap(map['poster_path']),
      production_companies: List<Production_companie>.from(map['production_companies']?.map((x) => Production_companie.fromMap(x))),
      production_countries: List<Production_countrie>.from(map['production_countries']?.map((x) => Production_countrie.fromMap(x))),
      release_date: map['release_date'],
      revenue: map['revenue']?.toInt(),
      runtime: map['runtime']?.toInt(),
      spoken_languages: List<Spoken_language>.from(map['spoken_languages']?.map((x) => Spoken_language.fromMap(x))),
      status: map['status'],
      tagline: map['tagline'],
      title: map['title'],
      video: map['video'],
      vote_average: map['vote_average']?.toDouble(),
      vote_count: map['vote_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetails.fromJson(String source) => MovieDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieDetails(adult: $adult, backdrop_path: $backdrop_path, belongs_to_collection: $belongs_to_collection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdb_id: $imdb_id, original_language: $original_language, original_title: $original_title, overview: $overview, popularity: $popularity, poster_path: $poster_path, production_companies: $production_companies, production_countries: $production_countries, release_date: $release_date, revenue: $revenue, runtime: $runtime, spoken_languages: $spoken_languages, status: $status, tagline: $tagline, title: $title, video: $video, vote_average: $vote_average, vote_count: $vote_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MovieDetails &&
      other.adult == adult &&
      other.backdrop_path == backdrop_path &&
      other.belongs_to_collection == belongs_to_collection &&
      other.budget == budget &&
      listEquals(other.genres, genres) &&
      other.homepage == homepage &&
      other.id == id &&
      other.imdb_id == imdb_id &&
      other.original_language == original_language &&
      other.original_title == original_title &&
      other.overview == overview &&
      other.popularity == popularity &&
      other.poster_path == poster_path &&
      listEquals(other.production_companies, production_companies) &&
      listEquals(other.production_countries, production_countries) &&
      other.release_date == release_date &&
      other.revenue == revenue &&
      other.runtime == runtime &&
      listEquals(other.spoken_languages, spoken_languages) &&
      other.status == status &&
      other.tagline == tagline &&
      other.title == title &&
      other.video == video &&
      other.vote_average == vote_average &&
      other.vote_count == vote_count;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
      backdrop_path.hashCode ^
      belongs_to_collection.hashCode ^
      budget.hashCode ^
      genres.hashCode ^
      homepage.hashCode ^
      id.hashCode ^
      imdb_id.hashCode ^
      original_language.hashCode ^
      original_title.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      poster_path.hashCode ^
      production_companies.hashCode ^
      production_countries.hashCode ^
      release_date.hashCode ^
      revenue.hashCode ^
      runtime.hashCode ^
      spoken_languages.hashCode ^
      status.hashCode ^
      tagline.hashCode ^
      title.hashCode ^
      video.hashCode ^
      vote_average.hashCode ^
      vote_count.hashCode;
  }
}

class Belongs_to_collection {
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

class Poster_path {
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

class Spoken_language {
  final String iso_639_1;
  final String name;
  Spoken_language({
    required this.iso_639_1,
    required this.name,
  });

  Spoken_language copyWith({
    String? iso_639_1,
    String? name,
  }) {
    return Spoken_language(
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'iso_639_1': iso_639_1,
      'name': name,
    };
  }

  factory Spoken_language.fromMap(Map<String, dynamic> map) {
    return Spoken_language(
      iso_639_1: map['iso_639_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Spoken_language.fromJson(String source) => Spoken_language.fromMap(json.decode(source));

  @override
  String toString() => 'Spoken_language(iso_639_1: $iso_639_1, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Spoken_language &&
      other.iso_639_1 == iso_639_1 &&
      other.name == name;
  }

  @override
  int get hashCode => iso_639_1.hashCode ^ name.hashCode;
}