// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      posterPath: json['poster_path'] as String?,
      adult: json['adult'] as bool,
      overview: json['overview'] as String,
      releaseDate: parseDateFromString(json['release_date'] as String?),
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      originalTitle: json['original_title'] as String,
      originalLanguage: json['original_language'] as String,
      title: json['title'] as String,
      backdropPath: json['backdrop_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      type: $enumDecodeNullable(_$TypeOfLookingAtEnumMap, json['type']),
      isFavorite: json['is_favorite'] as bool,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate?.toIso8601String(),
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'type': _$TypeOfLookingAtEnumMap[instance.type],
      'is_favorite': instance.isFavorite,
    };

const _$TypeOfLookingAtEnumMap = {
  TypeOfLookingAt.movie: 'movie',
  TypeOfLookingAt.tv: 'tv',
};
