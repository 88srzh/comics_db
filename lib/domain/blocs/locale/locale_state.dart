part of 'locale_bloc.dart';

@immutable
class LocaleState extends Equatable {
  final Future<S> locale;

  const LocaleState({required this.locale});

  factory LocaleState.initial() {
    return LocaleState(locale: S.load(const Locale('en')));
  }

  @override
  List<Object?> get props => [locale];

  LocaleState copyWith({Future<S>? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }
}
