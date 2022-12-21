part of 'popular_people_list_bloc.dart';

class PeopleListState extends Equatable {
  final PeopleListContainer peopleContainer;
  final PeopleListContainer searchPeopleContainer;
  final String searchQuery;

  List<People> get people => isSearchMode ? searchPeopleContainer.people : peopleContainer.people;

  const PeopleListState.initial()
      : peopleContainer = const PeopleListContainer.initial(),
        searchPeopleContainer = const PeopleListContainer.initial(),
        searchQuery = '';

  bool get isSearchMode => searchQuery.isNotEmpty;

  const PeopleListState({
    required this.peopleContainer,
    required this.searchPeopleContainer,
    required this.searchQuery,
  });

  @override
  List<Object> get props => [peopleContainer, searchPeopleContainer, searchQuery];

  PeopleListState copyWith({
    PeopleListContainer? peopleContainer,
    PeopleListContainer? searchPeopleContainer,
    String? searchQuery,
  }) {
    return PeopleListState(
        peopleContainer: peopleContainer ?? this.peopleContainer,
        searchPeopleContainer: searchPeopleContainer ?? this.searchPeopleContainer,
        searchQuery: searchQuery ?? this.searchQuery);
  }
}
