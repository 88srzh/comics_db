import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ThemeEvent>(_switchTheme);
  }

  void _switchTheme(ThemeEvent event, Emitter<ThemeState> emit) {
   if (state.theme == AppThemes.appThemeData[AppTheme.lightTheme]) {
     emit(state.copyWith(theme: AppThemes.appThemeData[AppTheme.darkTheme]!));
   } else {
     emit(state.copyWith(theme: AppThemes.appThemeData[AppBarTheme.lightTheme]!));
   }
  }

  bool get isLightTheme == AppThemes.appThemeData[AppTheme.lightTheme] ? true : false;
}