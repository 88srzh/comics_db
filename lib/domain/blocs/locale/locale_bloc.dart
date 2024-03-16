// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/generated/l10n.dart';

part 'locale_event.dart';

part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleState.initial()) {
    on<LocaleEvent>(_switchLocale);
  }

  void _switchLocale(LocaleEvent event, Emitter<LocaleState> emit) {
    if (state.locale == S.load(const Locale('en'))) {
      emit(state.copyWith(locale: S.load(const Locale('en'))));
    } else {
      emit(state.copyWith(locale: S.load(const Locale('ru'))));
    }
  }

  bool get isEnLocale => state.locale == S.load(const Locale('en')) ? true : false;
}
