// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/tv_list/components/tv_list_data.dart';

class TvListCubitState extends Equatable {
  final List<TvListData> tvs;
  final String localeTag;
  final int totalResults;

  const TvListCubitState({required this.tvs, required this.localeTag, required this.totalResults});

  @override
  List<Object> get props => [tvs, localeTag, totalResults];

  TvListCubitState copyWith({
    List<TvListData>? tvs,
    String? localeTag,
    int? totalResults,
  }) {
    return TvListCubitState(
      tvs: tvs ?? this.tvs,
      localeTag: localeTag ?? this.localeTag,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
