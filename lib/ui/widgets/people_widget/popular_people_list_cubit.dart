import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/popular_people_list_bloc.dart';
import 'package:comics_db_app/domain/entity/people.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/people_widget/components/people_list_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PeopleListCubitState {
  final List<PeopleListData> people;
  final String localeTag;

  PeopleListCubitState({required this.people, required this.localeTag});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeopleListCubitState &&
          runtimeType == other.runtimeType &&
          people == other.people &&
          localeTag == other.localeTag;

  @override
  int get hashCode => people.hashCode ^ localeTag.hashCode;

  PeopleListCubitState copyWith({
    List<PeopleListData>? people,
    String? localeTag,
  }) {
    return PeopleListCubitState(
      people: people ?? this.people,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}

class PeopleListCubit extends Cubit<PeopleListCubitState> {
  final PeopleListBloc peopleListBloc;
  late final StreamSubscription<PeopleListState> peopleListBlocSubscription;
  Timer? searchDebounce;
  var people = <People>[];

  PeopleListCubit({required this.peopleListBloc})
      : super(PeopleListCubitState(people: const <PeopleListData>[], localeTag: '')) {
    Future.microtask(
      () {
        _onState(peopleListBloc.state);
        peopleListBlocSubscription = peopleListBloc.stream.listen(_onState);
      },
    );
  }

  void _onState(PeopleListState state) {
    final people = state.people.map(_makeListData).toList();
    final newState = this.state.copyWith(people: people);
    emit(newState);
  }

  void setupPopularPeopleLocale(String localeTag) {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    peopleListBloc.add(PeopleListEventLoadReset());
    peopleListBloc.add(PeopleListEventLoadNextPage(localeTag));
  }

  @override
  Future<void> close() {
    peopleListBlocSubscription.cancel();
    return super.close();
  }

  PeopleListData _makeListData(People people) {
    return PeopleListData(
      name: people.name,
      profilePath: people.profilePath,
      id: people.id,
    );
  }

  void showedPopularPeopleAtIndex(int index) {
    if (index < state.people.length - 1) return;
    peopleListBloc.add(PeopleListEventLoadNextPage(state.localeTag));
  }

  void searchPopularPeople(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(
      const Duration(milliseconds: 300),
      () async {
        peopleListBloc.add(PeopleListEventSearchMovie(text));
        peopleListBloc.add(PeopleListEventLoadNextPage(state.localeTag));
      },
    );
  }

  void onPeopleTap(BuildContext context, int index) {
    final id = state.people[index].id;
    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }
}
