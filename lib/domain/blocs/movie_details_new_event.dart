part of 'movie_details_bloc.dart';

// @immutable
abstract class MovieDetailsNewEvent {}

class MovieDetailsNewEventLoadDetailsPage extends MovieDetailsNewEvent {
  final String locale;
  // тут я не уверен, что сюда надо передавать инт
  final int movieId;

  MovieDetailsNewEventLoadDetailsPage(this.locale, this.movieId);
}
