// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/people/people_list_container.dart';
import 'package:comics_db_app/domain/entity/people.dart';
import 'package:comics_db_app/domain/entity/people_response.dart';

part 'popular_people_list_bloc.freezed.dart';

part 'popular_people_list_event.dart';

part 'popular_people_list_state.dart';

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
      final result =
          await _movieApiClient.searchPeople(nextPage, event.locale, state.searchQuery, Configuration.apiKey);
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
    emit(const PeopleListState.initial());
    // add(MovieListEventLoadNextPage(event.locale));
  }

  Future<void> onPeopleListEventLoadSearchMovie(PeopleListEventSearchMovie event, Emitter<PeopleListState> emit) async {
    if (state.searchQuery == event.query) return;
    final newState =
        state.copyWith(searchQuery: event.query, searchPeopleContainer: const PeopleListContainer.initial());
    emit(newState);
  }
}
