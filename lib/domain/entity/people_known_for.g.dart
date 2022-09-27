// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_known_for.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleKnownFor _$PeopleKnownForFromJson(Map<String, dynamic> json) =>
    PeopleKnownFor(
      result: (json['result'] as List<dynamic>)
          .map((e) => PeopleKnownForResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PeopleKnownForToJson(PeopleKnownFor instance) =>
    <String, dynamic>{
      'result': instance.result.map((e) => e.toJson()).toList(),
    };

PeopleKnownForResult _$PeopleKnownForResultFromJson(
        Map<String, dynamic> json) =>
    PeopleKnownForResult(
      posterPath: json['poster_path'] as String?,
      adult: json['adult'] as bool,
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      originalTitle: json['original_title'] as String,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      mediaType: json['media_type'] as String,
      originalLanguage: json['original_language'] as String,
      title: json['title'] as String,
      backdropPath: json['backdrop_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$PeopleKnownForResultToJson(
        PeopleKnownForResult instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'media_type': instance.mediaType,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
    };
