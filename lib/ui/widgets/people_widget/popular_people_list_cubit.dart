// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:comics_db_app/ui/widgets/people_widget/components/people_list_cubit_state.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/people/popular_people_list_bloc.dart';
import 'package:comics_db_app/domain/entity/people.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/people_widget/components/people_list_data.dart';

// TODO replace cubit state

class PeopleListCubit extends Cubit<PeopleListCubitState> {
  final PeopleListBloc peopleListBloc;
  late final StreamSubscription<PeopleListState> peopleListBlocSubscription;
  Timer? searchDebounce;
  var people = <People>[];

  PeopleListCubit({required this.peopleListBloc})
      : super(PeopleListCubitState(
            people: const <PeopleListData>[], localeTag: '')) {
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
    peopleListBloc.add(PeopleListEventLoadNextPage(locale: localeTag));
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
    peopleListBloc.add(PeopleListEventLoadNextPage(locale: state.localeTag));
  }

  void searchPopularPeople(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(
      const Duration(milliseconds: 300),
      () async {
        peopleListBloc.add(PeopleListEventSearchMovie(query: text));
        peopleListBloc
            .add(PeopleListEventLoadNextPage(locale: state.localeTag));
      },
    );
  }

  void onPeopleTap(BuildContext context, int index) {
    final id = state.people[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.peopleDetails, arguments: id);
  }
}
