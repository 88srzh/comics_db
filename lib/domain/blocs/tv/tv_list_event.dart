abstract class TvListEvent {}

class TvListEventLoadNextPage extends TvListEvent {
  final String locale;

  TvListEventLoadNextPage(this.locale);
}

class TvListEventLoadReset extends TvListEvent {}

class TvListEventSearchTv extends TvListEvent {
  final String query;

  TvListEventSearchTv(this.query);
}
