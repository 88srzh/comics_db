// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_details_credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleDetailsCredits _$PeopleDetailsCreditsFromJson(
        Map<String, dynamic> json) =>
    PeopleDetailsCredits(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Actor.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PeopleDetailsCreditsToJson(
        PeopleDetailsCredits instance) =>
    <String, dynamic>{
      'cast': instance.cast.map((e) => e.toJson()).toList(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
    };

Actor _$ActorFromJson(Map<String, dynamic> json) => Actor(
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      releaseDate: json['release_date'] as String,
      voteCount: json['vote_count'] as int,
      video: json['video'] as bool,
      adult: json['adult'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      title: json['title'] as String,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      id: json['id'] as int,
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'character': instance.character,
      'credit_id': instance.creditId,
      'release_date': instance.releaseDate,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'adult': instance.adult,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'popularity': instance.popularity,
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as int,
      department: json['department'] as String,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      job: json['job'] as String,
      overview: json['overview'] as String,
      voteCount: json['vote_count'] as int,
      video: json['video'] as bool,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      title: json['title'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      adult: json['adult'] as bool,
      releaseDate: json['release_date'] as String,
      creditId: json['credit_id'] as String,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'department': instance.department,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'job': instance.job,
      'overview': instance.overview,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'popularity': instance.popularity,
      'genre_ids': instance.genreIds,
      'vote_average': instance.voteAverage,
      'adult': instance.adult,
      'release_date': instance.releaseDate,
      'credit_id': instance.creditId,
    };
