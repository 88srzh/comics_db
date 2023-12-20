// Package imports:
import 'package:equatable/equatable.dart';

class AccountDetailsCubitState extends Equatable {
  final int id;
  final String name;
  final String username;
  final bool includeAdult;
  final String avatarPath;

  const AccountDetailsCubitState({
    required this.id,
    required this.name,
    required this.username,
    required this.includeAdult,
    required this.avatarPath,
  });

  @override
  List<Object> get props => [id, name, username, includeAdult, avatarPath];

  AccountDetailsCubitState copyWith({
    int? id,
    String? name,
    String? username,
    bool? includeAdult,
    String? avatarPath,
  }) {
    return AccountDetailsCubitState(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      includeAdult: includeAdult ?? this.includeAdult,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
