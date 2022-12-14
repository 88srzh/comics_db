import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/entity/people.dart';
import 'package:comics_db_app/domain/entity/people_response.dart';

abstract class PeopleListEvent {}

class PeopleListEventLoadNextPage extends PeopleListEvent {
  final String locale;

  PeopleListEventLoadNextPage(this.locale);
}

class PeopleListEventLoadReset extends PeopleListEvent {}

class PeopleListEventSearchMovie extends PeopleListEvent {
  final String query;

  PeopleListEventSearchMovie(this.query);
}

class PeopleListContainer {
  final List<People> people;
  final int currentPage;
  final int totalPage;

  bool get isComplete => currentPage >= totalPage;

  const PeopleListContainer.initial()
      : people = const <People>[],
        currentPage = 0,
        totalPage = 1;

  PeopleListContainer({required this.people, required this.currentPage, required this.totalPage});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleListContainer &&
          runtimeType == other.runtimeType &&
          people == other.people &&
          currentPage == other.currentPage &&
          totalPage == other.totalPage;

  @override
  int get hashCode => people.hashCode ^ currentPage.hashCode ^ totalPage.hashCode;

  PeopleListContainer copyWith({List<People>? people, int? currentPage, int? totalPage}) {
    return PeopleListContainer(
      people: people ?? this.people,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
    );
  }
}

class PeopleListState {
  final PeopleListContainer peopleContainer;
  final PeopleListContainer searchPeopleContainer;
  final String searchQuery;

  List<People> get people => isSearchMode ? searchPeopleContainer.people : peopleContainer.people;

  PeopleListState.initial()
      : peopleContainer = const PeopleListContainer.initial(),
        searchPeopleContainer = const PeopleListContainer.initial(),
        searchQuery = '';

  bool get isSearchMode => searchQuery.isNotEmpty;

  PeopleListState({
    required this.peopleContainer,
    required this.searchPeopleContainer,
    required this.searchQuery,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleListState &&
          runtimeType == other.runtimeType &&
          peopleContainer == other.peopleContainer &&
          searchPeopleContainer == other.searchPeopleContainer &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode => peopleContainer.hashCode ^ searchPeopleContainer.hashCode ^ searchQuery.hashCode;

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

class PeopleListBloc extends Bloc<PeopleListEvent, PeopleListState> {
  final _movieApiClient = MovieAndTvApiClient();

  PeopleListBloc(PeopleListState initialState) : super(initialState) {
    on<PeopleListEvent>(((event, emit) async {
      if (event is PeopleListEventLoadNextPage) {
        await onPeopleListEventLoadNextPage(event, emit);
      } else if (event is PeopleListEventLoadReset) {
        await onPeopleListEventLoadReset(event, emit);
      } else if (event is PeopleListEventSearchMovie) {
        await onPeopleListEventLoadSearchMovie(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onPeopleListEventLoadNextPage(PeopleListEventLoadNextPage event, Emitter<PeopleListState> emit) async {
    if (state.isSearchMode) {
      _loadNextPage(state.searchPeopleContainer, (nextPage) async {
        final result =
        // TODO may be add separate search
            await _movieApiClient.searchPeople(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
        return result;
      });

      if (state.searchPeopleContainer.isComplete) return;
      final nextPage = state.searchPeopleContainer.currentPage + 1;
      final result = await _movieApiClient.searchPeople(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
      final people = List<People>.from(state.peopleContainer.people)..addAll(result.people);
      final container = state.searchPeopleContainer.copyWith(
        people: people,
        currentPage: result.page,
        totalPage: result.totalPages,
      );
      final newState = state.copyWith(searchPeopleContainer: container);
      emit(newState);
    } else {
      if (state.peopleContainer.isComplete) return;
      final nextPage = state.peopleContainer.currentPage + 1;
      final result = await _movieApiClient.popularPeople(nextPage, event.locale, Configuration.apiKey);
      final people = List<People>.from(state.peopleContainer.people)..addAll(result.people);
      final container = state.peopleContainer.copyWith(
        people: people,
        currentPage: result.page,
        totalPage: result.totalPages,
      );
      final newState = state.copyWith(peopleContainer: container);
      emit(newState);
    }
  }

  Future<PeopleListContainer?> _loadNextPage(
      PeopleListContainer container, Future<PeopleResponse> Function(int) loader) async {
    if (container.isComplete) return null;
    final nextPage = state.peopleContainer.currentPage + 1;
    final result = await loader(nextPage);
    final people = List<People>.from(container.people)..addAll(result.people);
    final newContainer = container.copyWith(
      people: people,
      currentPage: result.page,
      totalPage: result.totalPages,
    );
    return newContainer;
  }

  Future<void> onPeopleListEventLoadReset(PeopleListEventLoadReset event, Emitter<PeopleListState> emit) async {
    emit(PeopleListState.initial());
    // add(MovieListEventLoadNextPage(event.locale));
  }

  Future<void> onPeopleListEventLoadSearchMovie(PeopleListEventSearchMovie event, Emitter<PeopleListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState = state.copyWith(searchQuery: event.query, searchPeopleContainer: const PeopleListContainer.initial());
    emit(newState);
  }
}
