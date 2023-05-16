import 'package:comics_db_app/ui/widgets/people_widget/components/people_list_data.dart';

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
