part of 'theme_cubit.dart';

class ThemeListState {
  final bool value;

  const ThemeListState({
    required this.value,
  });

  ThemeListState copyWith({
    bool? value,
  }) {
    return ThemeListState(
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeListState &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
