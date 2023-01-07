// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/people.dart';

class PeopleListContainer extends Equatable {
  final List<People> people;
  final int currentPage;
  final int totalPage;

  bool get isComplete => currentPage >= totalPage;

  const PeopleListContainer.initial()
      : people = const <People>[],
        currentPage = 0,
        totalPage = 1;

  const PeopleListContainer(
      {required this.people,
      required this.currentPage,
      required this.totalPage});

  @override
  List<Object> get props => [people, currentPage, totalPage];

  PeopleListContainer copyWith(
      {List<People>? people, int? currentPage, int? totalPage}) {
    return PeopleListContainer(
      people: people ?? this.people,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
    );
  }
}
