// Package imports:
import 'package:comics_db_app/domain/entity/movie_details_external_ids.dart';
import 'package:comics_db_app/domain/entity/movie_details_keywords.dart';
import 'package:comics_db_app/domain/entity/movie_details_reviews.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/data_parser.dart';
import 'package:comics_db_app/domain/entity/movie_details_credits.dart';
import 'package:comics_db_app/domain/entity/movie_details_recommendations.dart';
import 'package:comics_db_app/domain/entity/movie_details_similar.dart';
import 'package:comics_db_app/domain/entity/movie_details_videos.dart';

part 'movie_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetails {
  final bool adult;
  final String? backdropPath;

  // final List<BelongsToCollection>? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? releaseDate;
  final int revenue;
  final int? runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final MovieDetailsCredits credits;
  final MovieDetailsVideos videos;
  final MovieDetailsRecommendations recommendations;
  @JsonKey(name: 'keywords')
  final String keywords;

  // final MovieDetailsReviews reviews;
  final MovieDetailsSimilar? similar;
  final MovieDetailsExternalIDs externalIds;
  final MovieDetailsReviews reviews;

  MovieDetails({
    required this.adult,
    required this.backdropPath,
    // required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.credits,
    required this.videos,
    required this.recommendations,
    // required this.reviews,
    required this.similar,
    required this.externalIds,
    required this.reviews,
    required this.keywords,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

// @JsonSerializable(fieldRename: FieldRename.snake)
// class BelongsToCollection {
//   final int id;
//   final String name;
//   final String? posterPath;
//   final String? backdropPath;

//   const BelongsToCollection({
//     required this.id,
//     required this.name,
//     this.posterPath,
//     this.backdropPath,
//   });

//   factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
//       _$BelongsToCollectionFromJson(json);

//   Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
// }

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
class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  final String iso;
  final String name;

  ProductionCountry({
    required this.iso,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SpokenLanguage {
  @JsonKey(name: 'iso_639_1')
  final String iso;
  final String name;

  SpokenLanguage({
    required this.iso,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
