import 'package:comics_db_app/ui/widgets/settings/theme_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_list_state.dart';

class ThemeCubit extends Cubit<ThemeListState> {
  late final bool _isDark;
  late ThemePreferences _preferences;

  bool get isDark => _isDark;

  ThemeCubit(this._isDark)
      : super(const ThemeListState(
          value: false,
        )) {
    emit(ThemeListState(
      value: state.value,
    ));
  }

  set isDark(bool value) {
    _isDark = false;
    _preferences.setTheme(value);
    final newState = state.copyWith(value: value);
    emit(newState);
  }

  Future<void> getPreferences() async {
    _isDark = await _preferences.getTheme();
    emit(state);
  }
}
