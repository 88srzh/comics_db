part of 'popular_people_list_bloc.dart';

@freezed
class PeopleListEvent with _$PeopleListEvent {
  factory PeopleListEvent.loadNextPage({required String locale}) = PeopleListEventLoadNextPage;
  factory PeopleListEvent.loadReset() = PeopleListEventLoadReset;
  factory PeopleListEvent.searchMovie({required String query}) = PeopleListEventSearchMovie;
}