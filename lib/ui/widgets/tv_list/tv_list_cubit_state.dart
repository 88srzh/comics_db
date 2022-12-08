import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';

class TvListCubitState {
  final List<TvListData> tvs;
  final String localeTag;

  TvListCubitState({required this.tvs, required this.localeTag});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvListCubitState && runtimeType == other.runtimeType && tvs == other.tvs && localeTag == other.localeTag;

  @override
  int get hashCode => tvs.hashCode ^ localeTag.hashCode;

  TvListCubitState copyWith({
    List<TvListData>? tvs,
    String? localeTag,
  }) {
    return TvListCubitState(
      tvs: tvs ?? this.tvs,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}
