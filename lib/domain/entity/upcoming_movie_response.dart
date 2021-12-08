import 'package:comics_db_app/domain/entity/movie.dart';
import 'package:comics_db_app/domain/entity/movie_dates.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upcoming_movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UpcomingMovieResponse {
  final int page;
  @JsonKey(name: 'results')
  List<Movie> movies;
  @JsonKey(name: 'dates')
  List<MovieDates> dates;
  final int totalResults;
  final int totalPages;

  UpcomingMovieResponse({
    required this.page,
    required this.movies,
    required this.dates,
    required this.totalResults,
    required this.totalPages,
  });

  factory UpcomingMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingMovieResponseToJson(this);
}
